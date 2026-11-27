package com.zinhao.kikoeru;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Lightweight click-to-translate helper for work titles (browser-style: zero config,
 * Microsoft Edge free web translate with Google gtx fallback, and persistent local cache).
 */
public final class TitleTranslator {
    public interface Transport {
        String get(String url, Map<String, String> headers) throws IOException;
        String post(String url, Map<String, String> headers, String body) throws IOException;
    }

    private static final int CACHE_LIMIT = 2000;
    private static final int BATCH_SIZE = 12;
    private static final long EDGE_TOKEN_TTL_MS = 8 * 60 * 1000L;
    private static final Pattern PURE_CODE = Pattern.compile("^(?i)(RJ|BJ|VJ)\\d+$");
    private static final Pattern HAS_LETTER = Pattern.compile(".*\\p{L}.*", Pattern.DOTALL);

    private static final ConcurrentHashMap<String, String> MEM_CACHE = new ConcurrentHashMap<>();
    private static final Set<String> IN_FLIGHT = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Set<String> MANUAL_SHOWN = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Set<String> MANUAL_HIDDEN = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final ExecutorService IO = Executors.newFixedThreadPool(2);
    private static final Object TOKEN_LOCK = new Object();

    private static volatile String edgeToken = "";
    private static volatile long edgeTokenUntil = 0L;
    private static volatile Transport transport = new HttpTransport();

    private TitleTranslator() {}

    static void setTransportForTest(Transport custom) {
        transport = custom != null ? custom : new HttpTransport();
        synchronized (TOKEN_LOCK) {
            edgeToken = "";
            edgeTokenUntil = 0L;
        }
        MEM_CACHE.clear();
        IN_FLIGHT.clear();
        MANUAL_SHOWN.clear();
        MANUAL_HIDDEN.clear();
    }

    public static boolean enabled(Context context) {
        if (context == null) return false;
        return context.getApplicationContext()
                .getSharedPreferences("playback_options", 0)
                .getBoolean("translate_titles", false);
    }

    public static void enabled(Context context, boolean value) {
        if (context == null) return;
        context.getApplicationContext()
                .getSharedPreferences("playback_options", 0)
                .edit()
                .putBoolean("translate_titles", value)
                .apply();
        MANUAL_SHOWN.clear();
        MANUAL_HIDDEN.clear();
    }

    public static boolean toggle(Context context) {
        boolean next = !enabled(context);
        enabled(context, next);
        return next;
    }

    public static boolean needsTranslation(String text) {
        if (text == null) return false;
        String trimmed = text.trim();
        if (trimmed.isEmpty()) return false;
        if (PURE_CODE.matcher(trimmed).matches()) return false;
        return HAS_LETTER.matcher(trimmed).matches();
    }

    static String key(String original) {
        if (original == null) return "";
        String norm = original.trim();
        if (norm.isEmpty()) return "";
        return UUID.nameUUIDFromBytes(norm.getBytes(StandardCharsets.UTF_8)).toString();
    }

    public static boolean shouldShowTranslated(Context context, String original) {
        if (!needsTranslation(original)) return false;
        String k = key(original);
        if (MANUAL_SHOWN.contains(k)) return true;
        if (MANUAL_HIDDEN.contains(k)) return false;
        return enabled(context);
    }

    public static void setManualVisible(String original, boolean showTranslated) {
        String k = key(original);
        if (k.isEmpty()) return;
        if (showTranslated) {
            MANUAL_HIDDEN.remove(k);
            MANUAL_SHOWN.add(k);
        } else {
            MANUAL_SHOWN.remove(k);
            MANUAL_HIDDEN.add(k);
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences("title_translations", 0);
    }

    public static String cached(Context context, String original) {
        if (context == null || !needsTranslation(original)) return "";
        String k = key(original);
        String mem = MEM_CACHE.get(k);
        if (mem != null) return mem;
        try {
            String raw = prefs(context).getString(k, "");
            if (raw.isEmpty()) return "";
            String value = raw.startsWith("{") ? new JSONObject(raw).optString("t", "") : raw;
            if (!value.isEmpty()) {
                MEM_CACHE.put(k, value);
                return value;
            }
        } catch (Exception ignored) {}
        return "";
    }

    static void putCache(Context context, String original, String translated) {
        if (context == null || !needsTranslation(original) || translated == null) return;
        String clean = translated.trim();
        if (clean.isEmpty()) return;
        String k = key(original);
        MEM_CACHE.put(k, clean);
        try {
            SharedPreferences sp = prefs(context);
            SharedPreferences.Editor edit = sp.edit();
            if (!sp.contains(k) && sp.getAll().size() >= CACHE_LIMIT) {
                String oldest = null;
                long oldestTime = Long.MAX_VALUE;
                for (Map.Entry<String, ?> entry : sp.getAll().entrySet()) {
                    long saved = 0L;
                    try {
                        String v = String.valueOf(entry.getValue());
                        if (v.startsWith("{")) saved = new JSONObject(v).optLong("time", 0L);
                    } catch (Exception ignored) {}
                    if (oldest == null || saved < oldestTime) {
                        oldest = entry.getKey();
                        oldestTime = saved;
                    }
                }
                if (oldest != null) edit.remove(oldest);
            }
            edit.putString(k, new JSONObject()
                    .put("t", clean)
                    .put("time", System.currentTimeMillis())
                    .toString()).apply();
        } catch (Exception ignored) {}
    }

    /** Translates a single title synchronously using Edge (primary) or Google gtx (fallback). */
    static String translateSync(Context context, String original) {
        if (!needsTranslation(original)) return "";
        String hit = cached(context, original);
        if (!hit.isEmpty()) return hit;
        List<String> one = Collections.singletonList(original.trim());
        Map<String, String> batch = translateBatchNetwork(one);
        String result = batch.get(original.trim());
        if (result != null && !result.isEmpty()) {
            putCache(context, original, result);
            return result;
        }
        return "";
    }

    public static void translateSingle(Context context, String original, Runnable onSuccess, Runnable onFailure) {
        if (context == null || !needsTranslation(original)) {
            postMain(onFailure);
            return;
        }
        final Context app = context.getApplicationContext();
        final String clean = original.trim();
        if (!cached(app, clean).isEmpty()) {
            setManualVisible(clean, true);
            postMain(onSuccess);
            return;
        }
        IO.execute(() -> {
            String out = translateSync(app, clean);
            if (!out.isEmpty()) {
                setManualVisible(clean, true);
                postMain(onSuccess);
            } else {
                postMain(onFailure);
            }
        });
    }

    public static void translateBatch(Context context, List<String> originals, Runnable onUpdated) {
        if (context == null || originals == null || originals.isEmpty()) return;
        final Context app = context.getApplicationContext();
        final List<String> pending = new ArrayList<>();
        Set<String> dedup = new LinkedHashSet<>();
        for (String item : originals) {
            if (!needsTranslation(item)) continue;
            String clean = item.trim();
            if (!dedup.add(clean)) continue;
            if (!cached(app, clean).isEmpty()) continue;
            String k = key(clean);
            if (IN_FLIGHT.add(k)) pending.add(clean);
        }
        if (pending.isEmpty()) return;
        IO.execute(() -> {
            try {
                for (int i = 0; i < pending.size(); i += BATCH_SIZE) {
                    List<String> chunk = pending.subList(i, Math.min(pending.size(), i + BATCH_SIZE));
                    Map<String, String> results = translateBatchNetwork(chunk);
                    boolean any = false;
                    for (Map.Entry<String, String> e : results.entrySet()) {
                        if (e.getValue() != null && !e.getValue().trim().isEmpty()) {
                            putCache(app, e.getKey(), e.getValue());
                            any = true;
                        }
                    }
                    if (any) postMain(onUpdated);
                }
            } finally {
                for (String s : pending) IN_FLIGHT.remove(key(s));
            }
        });
    }

    static Map<String, String> translateBatchNetwork(List<String> items) {
        Map<String, String> out = new LinkedHashMap<>();
        if (items == null || items.isEmpty()) return out;
        try {
            Map<String, String> edge = translateViaEdge(items);
            if (!edge.isEmpty()) return edge;
        } catch (Exception ignored) {}
        for (String item : items) {
            try {
                String g = translateViaGoogle(item);
                if (!g.isEmpty()) out.put(item, g);
            } catch (Exception ignored) {}
        }
        return out;
    }

    private static Map<String, String> translateViaEdge(List<String> items) throws Exception {
        String token = getEdgeToken(false);
        if (token.isEmpty()) throw new IOException("No Edge translate token");
        JSONArray payload = new JSONArray();
        for (String s : items) payload.put(new JSONObject().put("Text", s));
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer " + token);
        headers.put("Content-Type", "application/json; charset=UTF-8");
        String url = "https://api-edge.cognitive.microsofttranslator.com/translate?from=&to=zh-Hans&api-version=3.0&includeSentenceLength=false";
        String body;
        try {
            body = transport.post(url, headers, payload.toString());
        } catch (IOException firstFail) {
            token = getEdgeToken(true);
            if (token.isEmpty()) throw firstFail;
            headers.put("Authorization", "Bearer " + token);
            body = transport.post(url, headers, payload.toString());
        }
        JSONArray arr = new JSONArray(body);
        Map<String, String> result = new LinkedHashMap<>();
        int count = Math.min(items.size(), arr.length());
        for (int i = 0; i < count; i++) {
            JSONObject row = arr.optJSONObject(i);
            if (row == null) continue;
            JSONArray translations = row.optJSONArray("translations");
            if (translations == null || translations.length() == 0) continue;
            JSONObject first = translations.optJSONObject(0);
            String text = first != null ? first.optString("text", "").trim() : "";
            if (!text.isEmpty()) result.put(items.get(i), text);
        }
        return result;
    }

    private static String getEdgeToken(boolean forceRefresh) throws IOException {
        long now = System.currentTimeMillis();
        if (!forceRefresh && !edgeToken.isEmpty() && now < edgeTokenUntil) return edgeToken;
        synchronized (TOKEN_LOCK) {
            now = System.currentTimeMillis();
            if (!forceRefresh && !edgeToken.isEmpty() && now < edgeTokenUntil) return edgeToken;
            String fetched = transport.get("https://edge.microsoft.com/translate/auth", Collections.emptyMap());
            if (fetched == null) return "";
            String clean = fetched.trim();
            if (clean.isEmpty()) return "";
            edgeToken = clean;
            edgeTokenUntil = now + EDGE_TOKEN_TTL_MS;
            return clean;
        }
    }

    private static String translateViaGoogle(String text) throws Exception {
        String encoded = URLEncoder.encode(text, "UTF-8");
        String url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=zh-CN&dt=t&q=" + encoded;
        String body = transport.get(url, Collections.emptyMap());
        if (body == null || body.isEmpty()) return "";
        JSONArray root = new JSONArray(body);
        JSONArray segments = root.optJSONArray(0);
        if (segments == null) return "";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < segments.length(); i++) {
            JSONArray seg = segments.optJSONArray(i);
            if (seg != null && !seg.isNull(0)) sb.append(seg.optString(0, ""));
        }
        return sb.toString().trim();
    }

    private static void postMain(Runnable run) {
        if (run == null) return;
        try {
            Looper looper = Looper.getMainLooper();
            if (looper != null) {
                new Handler(looper).post(run);
                return;
            }
        } catch (Throwable ignored) {}
        run.run();
    }

    private static final class HttpTransport implements Transport {
        @Override public String get(String url, Map<String, String> headers) throws IOException {
            HttpURLConnection conn = open(url, "GET", headers);
            try {
                int code = conn.getResponseCode();
                if (code < 200 || code >= 300) throw new IOException("HTTP " + code);
                return readAll(conn.getInputStream());
            } finally { conn.disconnect(); }
        }

        @Override public String post(String url, Map<String, String> headers, String body) throws IOException {
            HttpURLConnection conn = open(url, "POST", headers);
            conn.setDoOutput(true);
            byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
            conn.setFixedLengthStreamingMode(bytes.length);
            try {
                try (OutputStream out = conn.getOutputStream()) { out.write(bytes); }
                int code = conn.getResponseCode();
                if (code < 200 || code >= 300) throw new IOException("HTTP " + code);
                return readAll(conn.getInputStream());
            } finally { conn.disconnect(); }
        }

        private static HttpURLConnection open(String url, String method, Map<String, String> headers) throws IOException {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod(method);
            conn.setConnectTimeout(6000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36");
            if (headers != null) {
                for (Map.Entry<String, String> e : headers.entrySet()) {
                    conn.setRequestProperty(e.getKey(), e.getValue());
                }
            }
            return conn;
        }

        private static String readAll(InputStream in) throws IOException {
            if (in == null) return "";
            try (InputStream stream = in) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[4096];
                int n;
                int total = 0;
                while ((n = stream.read(buf)) != -1) {
                    total += n;
                    if (total > 512 * 1024) throw new IOException("Response too large");
                    out.write(buf, 0, n);
                }
                return new String(out.toByteArray(), StandardCharsets.UTF_8);
            }
        }
    }
}
