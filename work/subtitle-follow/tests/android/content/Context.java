package android.content;

import java.io.File;
import java.util.*;

public class Context {
    private final File root;
    public final android.content.res.Resources resources=new android.content.res.Resources();
    public Object accessibility;
    private static final Map<String,SharedPreferences> stores=new HashMap<>();
    public Context() { this(new File(System.getProperty("java.io.tmpdir"), "kiko-view-test")); }
    public Context(File root) { this.root = root; }
    public Context getApplicationContext() { return this; }
    public android.content.res.Resources getResources() { return resources; }
    public String getPackageName() { return "com.zinhao.kikoeru"; }
    public Object getSystemService(String name) { return accessibility; }
    public File getFilesDir() { File f = new File(root, "files"); f.mkdirs(); return f; }
    public File getCacheDir() { File f = new File(root, "cache"); f.mkdirs(); return f; }
    public SharedPreferences getSharedPreferences(String name,int mode) {
        synchronized(stores) { return stores.computeIfAbsent(root.getAbsolutePath()+"/"+name,k->new Preferences()); }
    }
    private static final class Preferences implements SharedPreferences {
        private final Map<String,Object> values=new HashMap<>();
        public synchronized Map<String,?> getAll() { return new HashMap<>(values); }
        public synchronized String getString(String key,String fallback) { Object value=values.get(key); return value instanceof String?(String)value:fallback; }
        @SuppressWarnings("unchecked") public synchronized Set<String> getStringSet(String key,Set<String> fallback) {
            Object value=values.get(key); return new HashSet<>(value instanceof Set?(Set<String>)value:fallback);
        }
        public synchronized boolean getBoolean(String key,boolean fallback) { Object value=values.get(key); return value instanceof Boolean?(Boolean)value:fallback; }
        public synchronized boolean contains(String key) { return values.containsKey(key); }
        public Editor edit() {
            return new Editor() {
                private final Map<String,Object> changes=new HashMap<>();
                public Editor putString(String key,String value) { changes.put(key,value); return this; }
                public Editor putStringSet(String key,Set<String> value) { changes.put(key,new HashSet<>(value)); return this; }
                public Editor putBoolean(String key,boolean value) { changes.put(key,value); return this; }
                public Editor remove(String key) { changes.put(key,null); return this; }
                public void apply() { synchronized(Preferences.this) {
                    for(Map.Entry<String,Object> change:changes.entrySet()) {
                        if(change.getValue()==null) values.remove(change.getKey()); else values.put(change.getKey(),change.getValue());
                    }
                } }
            };
        }
    }
}
