package com.zinhao.kikoeru;

import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.CancellationException;
import java.util.function.BooleanSupplier;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;

/** Two fixed Baidu upload endpoints. No redirects, logs, cookies or token persistence. */
public final class BaiduUploadHttp {
    private final BaiduHttp.Connections connections;
    BaiduUploadHttp() { this(url->(HttpsURLConnection)url.openConnection()); }
    BaiduUploadHttp(BaiduHttp.Connections connections) { this.connections=connections; }
    private static String query(Map<String,String> values) throws Exception {
        StringBuilder result=new StringBuilder();
        for(Map.Entry<String,String> entry:values.entrySet()) {
            if(result.length()>0) result.append('&');
            result.append(BaiduHttp.encode(entry.getKey())).append('=').append(BaiduHttp.encode(entry.getValue()));
        }
        return result.toString();
    }
    private static void setup(HttpsURLConnection connection,String contentType,long length) throws Exception {
        connection.setInstanceFollowRedirects(false); connection.setConnectTimeout(12000); connection.setReadTimeout(60000);
        connection.setRequestMethod("POST"); connection.setDoOutput(true); connection.setUseCaches(false);
        connection.setRequestProperty("User-Agent","pan.baidu.com"); connection.setRequestProperty("Accept","application/json");
        connection.setRequestProperty("Content-Type",contentType); connection.setFixedLengthStreamingMode(length);
    }
    private static JSONObject response(HttpsURLConnection connection) throws Exception {
        int status=connection.getResponseCode();
        if(status>=300 && status<400) throw new IOException("Upload redirect rejected");
        InputStream stream=status>=400?connection.getErrorStream():connection.getInputStream();
        if(stream==null) throw new IOException("Upload response missing");
        try(InputStream in=stream) {
            JSONObject result=new JSONObject(new String(BaiduHttp.read(in,1024*1024),StandardCharsets.UTF_8));
            if(status>=400 && !result.has("errno") && !result.has("error_code")) throw new IOException("Upload HTTP "+status);
            return result;
        }
    }
    JSONObject form(String method,String token,Map<String,String> values) throws Exception {
        if(!Arrays.asList("precreate","create").contains(method) || token==null || token.isEmpty() || !"0".equals(values.get("rtype"))) throw new IOException("Upload request rejected");
        Set<String> allowed=new HashSet<>(Arrays.asList("path","size","isdir","rtype","uploadid","block_list","autoinit"));
        String path=values.get("path"),kind=values.get("isdir");
        if(!allowed.containsAll(values.keySet()) || path==null || !path.equals(BaiduApi.path(path)) || path.equals("/")
                || !("0".equals(kind) || "1".equals(kind)) || (method.equals("precreate") && !kind.equals("0"))) throw new IOException("Upload request rejected");
        if(kind.equals("1")) {
            if(!method.equals("create") || values.size()!=3) throw new IOException("Upload directory request rejected");
        } else {
            String size=values.get("size"),hashes=values.get("block_list");
            try { if(size==null || Long.parseLong(size)<0 || hashes==null) throw new IOException();
                org.json.JSONArray list=new org.json.JSONArray(hashes);
                if(list.length()<1 || list.length()>BaiduUpload.MAX_BLOCKS) throw new IOException();
                for(int i=0;i<list.length();i++) if(!list.getString(i).matches("[0-9a-f]{32}")) throw new IOException();
                if(method.equals("precreate") && (!"1".equals(values.get("autoinit")) || values.containsKey("uploadid"))) throw new IOException();
                if(method.equals("create") && (values.containsKey("autoinit") || values.get("uploadid")==null || values.get("uploadid").isEmpty() || values.get("uploadid").length()>1024)) throw new IOException();
            } catch(Exception e) { throw new IOException("Upload file request rejected"); }
        }
        byte[] body=query(values).getBytes(StandardCharsets.UTF_8);
        String endpoint=BaiduApi.XPAN+"file?"+query(BaiduApi.params("method",method,"access_token",token));
        HttpsURLConnection connection=null;
        try {
            connection=connections.open(new URL(endpoint)); setup(connection,"application/x-www-form-urlencoded",body.length);
            try(OutputStream out=connection.getOutputStream()) { out.write(body); }
            return response(connection);
        } catch(Exception e) { throw BaiduApi.failure("\u767e\u5ea6\u4e0a\u4f20\u8bf7\u6c42\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u4e0e\u6743\u9650"); }
        finally { if(connection!=null) connection.disconnect(); }
    }
    JSONObject part(String token,String path,String uploadId,int index,byte[] bytes,int count,BooleanSupplier cancelled) throws Exception {
        if(token==null || token.isEmpty() || uploadId==null || uploadId.isEmpty() || uploadId.length()>1024 || index<0
                || bytes==null || count<0 || count>bytes.length || count>BaiduUpload.BLOCK) throw new IOException("Upload part rejected");
        path=BaiduApi.path(path);
        String endpoint="https://d.pcs.baidu.com/rest/2.0/pcs/superfile2?"+query(BaiduApi.params("method","upload","type","tmpfile","access_token",token,
                "path",path,"uploadid",uploadId,"partseq",String.valueOf(index)));
        String boundary="Kikoeru"+UUID.randomUUID().toString().replace("-","");
        byte[] prefix=("--"+boundary+"\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file\"\r\nContent-Type: application/octet-stream\r\n\r\n").getBytes(StandardCharsets.US_ASCII);
        byte[] suffix=("\r\n--"+boundary+"--\r\n").getBytes(StandardCharsets.US_ASCII);
        HttpsURLConnection connection=null;
        try {
            if(cancelled.getAsBoolean()) throw new CancellationException();
            connection=connections.open(new URL(endpoint)); setup(connection,"multipart/form-data; boundary="+boundary,(long)prefix.length+count+suffix.length);
            try(OutputStream out=connection.getOutputStream()) {
                out.write(prefix);
                for(int offset=0;offset<count;) { if(cancelled.getAsBoolean()) throw new CancellationException(); int n=Math.min(65536,count-offset); out.write(bytes,offset,n); offset+=n; }
                out.write(suffix);
            }
            if(cancelled.getAsBoolean()) throw new CancellationException();
            return response(connection);
        } catch(CancellationException e) { throw e; }
        catch(Exception e) { throw BaiduApi.failure("\u767e\u5ea6\u5206\u7247\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u4e0e\u6743\u9650"); }
        finally { if(connection!=null) connection.disconnect(); }
    }
}
