package com.zinhao.kikoeru;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.*;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;

/** HTTPS-only transport. No raw response, URL or credential is included in errors. */
public final class BaiduHttp implements BaiduApi.Network {
    interface Connections { HttpsURLConnection open(URL url) throws IOException; }
    private final Connections connections;
    public BaiduHttp() { this(url->(HttpsURLConnection)url.openConnection()); }
    BaiduHttp(Connections connections) { this.connections=connections; }
    static String encode(String value) throws Exception { return URLEncoder.encode(value,"UTF-8"); }
    public JSONObject get(String endpoint,Map<String,String> parameters) throws Exception {
        if(!(endpoint.equals(BaiduApi.OAUTH+"device/code") || endpoint.equals(BaiduApi.OAUTH+"token")
                || endpoint.equals(BaiduApi.XPAN+"file") || endpoint.equals(BaiduApi.XPAN+"multimedia") || endpoint.equals(BaiduApi.XPAN+"nas")))
            throw BaiduApi.failure("\u4e0d\u652f\u6301\u7684\u4e91\u7aef\u63a5\u53e3");
        String method=parameters.get("method");
        if(method!=null && !Arrays.asList("list","filemetas","uinfo").contains(method)) throw BaiduApi.failure("\u4e91\u7aef\u53ea\u652f\u6301\u8bfb\u53d6\u64cd\u4f5c");
        StringBuilder url=new StringBuilder(endpoint).append('?');
        for(Map.Entry<String,String> entry:parameters.entrySet()) url.append(encode(entry.getKey())).append('=').append(encode(entry.getValue())).append('&');
        HttpsURLConnection connection=null;
        try {
            connection=connections.open(new URL(url.toString())); setup(connection); connection.setRequestProperty("Accept","application/json");
            int status=connection.getResponseCode();
            if(status>=300 && status<400) throw BaiduApi.failure("\u767e\u5ea6\u6388\u6743\u63a5\u53e3\u8fd4\u56de\u4e86\u610f\u5916\u8df3\u8f6c");
            InputStream stream=status>=400?connection.getErrorStream():connection.getInputStream();
            if(stream==null) throw BaiduApi.failure("\u767e\u5ea6\u63a5\u53e3\u672a\u8fd4\u56de\u6709\u6548\u6570\u636e");
            try(InputStream in=stream) { return new JSONObject(new String(read(in,2*1024*1024),StandardCharsets.UTF_8)); }
        } catch(IOException e) { throw BaiduApi.failure("\u767e\u5ea6\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"); }
        catch(Exception e) { throw BaiduApi.failure("\u767e\u5ea6\u63a5\u53e3\u54cd\u5e94\u65e0\u6548"); }
        finally { if(connection!=null) connection.disconnect(); }
    }
    private static void setup(HttpsURLConnection connection) throws IOException {
        connection.setInstanceFollowRedirects(false); connection.setConnectTimeout(12000); connection.setReadTimeout(20000);
        connection.setRequestMethod("GET"); connection.setRequestProperty("User-Agent","pan.baidu.com");
        connection.setRequestProperty("Accept-Encoding","identity"); connection.setUseCaches(false);
    }
    static final class Failure extends IOException { final int status; Failure(int status) { super("\u4e91\u7aef\u6587\u4ef6\u8bfb\u53d6\u5931\u8d25\uff08HTTP "+status+"\uff09"); this.status=status; } }
    static final class Opened implements Closeable {
        final InputStream input; final long length; final HttpsURLConnection connection;
        Opened(InputStream in,long length,HttpsURLConnection c) { input=in; this.length=length; connection=c; }
        public void close() throws IOException { try { input.close(); } finally { connection.disconnect(); } }
    }
    Opened open(String initial,long position,long length) throws Exception {
        if(position<0 || length< -1 || (length>0 && position>Long.MAX_VALUE-length)) throw BaiduApi.failure("\u97f3\u9891\u8bfb\u53d6\u8303\u56f4\u65e0\u6548");
        String url=initial;
        for(int redirects=0;redirects<=5;redirects++) {
            if(!BaiduApi.downloadUrl(url)) throw BaiduApi.failure("\u4e0d\u5b89\u5168\u7684\u4e91\u7aef\u6587\u4ef6\u5730\u5740");
            HttpsURLConnection connection=connections.open(new URL(url));
            try {
                setup(connection);
                connection.setRequestProperty("Range",range(position,length));
                int code=connection.getResponseCode();
                if(code==301 || code==302 || code==303 || code==307 || code==308) {
                    String location=connection.getHeaderField("Location");
                    if(location==null) throw new Failure(code);
                    url=new URL(new URL(url),location).toString(); connection.disconnect(); continue;
                }
                if(code==416 && ("bytes */"+position).equals(connection.getHeaderField("Content-Range")))
                    return new Opened(new ByteArrayInputStream(new byte[0]),0,connection);
                if(code!=200 && code!=206) throw new Failure(code);
                long available=responseLength(code,position,connection.getHeaderField("Content-Range"),connection.getContentLengthLong());
                if(length>=0) available=available<0?length:Math.min(length,available);
                return new Opened(connection.getInputStream(),available,connection);
            } catch(Exception e) { connection.disconnect(); if(e instanceof Failure) throw e;
                throw BaiduApi.failure("\u4e91\u7aef\u6587\u4ef6\u8bfb\u53d6\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"); }
        }
        throw BaiduApi.failure("\u4e91\u7aef\u6587\u4ef6\u8df3\u8f6c\u6b21\u6570\u8fc7\u591a");
    }
    static String range(long position,long length) { return "bytes="+position+"-"+(length>0?String.valueOf(position+length-1):""); }
    static long responseLength(int status,long start,String contentRange,long length) throws IOException {
        if(status==200) {
            if(start!=0) throw BaiduApi.failure("\u7f51\u76d8\u672a\u652f\u6301\u5206\u6bb5\u8bfb\u53d6\uff0c\u65e0\u6cd5\u5feb\u901f\u8df3\u8f6c");
            return length;
        }
        Matcher matcher=Pattern.compile("bytes ([0-9]+)-([0-9]+)/(?:[0-9]+|\\*)").matcher(contentRange==null?"":contentRange);
        try {
            if(!matcher.matches() || Long.parseLong(matcher.group(1))!=start) throw new IOException();
            long end=Long.parseLong(matcher.group(2)); if(end<start || end-start==Long.MAX_VALUE) throw new IOException();
            return end-start+1;
        } catch(Exception e) { throw BaiduApi.failure("\u7f51\u76d8\u8fd4\u56de\u4e86\u9519\u8bef\u7684\u97f3\u9891\u8303\u56f4"); }
    }
    static byte[] read(InputStream input,int limit) throws IOException {
        ByteArrayOutputStream out=new ByteArrayOutputStream(); byte[] buffer=new byte[16384]; int n;
        while((n=input.read(buffer))!=-1) { if(out.size()+n>limit) throw new IOException("\u4e91\u7aef\u5c0f\u6587\u4ef6\u8d85\u8fc7\u8bfb\u53d6\u4e0a\u9650"); out.write(buffer,0,n); }
        return out.toByteArray();
    }
}
