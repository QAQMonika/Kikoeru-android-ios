package com.koushikdutta.async.http;
public class AsyncHttpClient {
    public abstract static class JSONObjectCallback {
        public abstract void onCompleted(Exception error, Object response, Object result);
    }
}
