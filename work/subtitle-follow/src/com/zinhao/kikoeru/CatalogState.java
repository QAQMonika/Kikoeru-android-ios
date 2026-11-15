package com.zinhao.kikoeru;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import com.koushikdutta.async.http.AsyncHttpResponse;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

/** Refresh lifecycle and request ownership; never changes account credentials or review data. */
public final class CatalogState {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final class RequestFailure extends IOException {
        RequestFailure(String message) { super(message); }
    }
    public interface Receiver {
        boolean isCurrent();
        void receive(Exception error,AsyncHttpResponse response,JSONObject result);
    }
    public static boolean refreshOnResume(boolean resumed,int type,int previousSubtitle,int subtitle) {
        if(type==498) return false; // Original local-download cache is not an online catalog.
        return previousSubtitle!=subtitle || (resumed && type>=492 && type<=496);
    }
    public static String reviewOrder(String order) {
        return "release".equals(order)?"updated_at":order;
    }
    public static Exception reviewError(Exception error,AsyncHttpResponse response,JSONObject result) {
        if(error!=null) return error;
        int code=response==null?0:response.code();
        if(code>=200 && code<300) {
            if(result!=null && !result.optBoolean("success",true))
                return new RequestFailure("\u670d\u52a1\u5668\u672a\u786e\u8ba4\u8fdb\u5ea6\u66f4\u65b0\u6210\u529f");
            return null;
        }
        if(code==401) return new RequestFailure("\u767b\u5f55\u5df2\u5931\u6548\uff0c\u8bf7\u4f7f\u7528\u7f51\u9875\u7684\u540c\u4e00\u8d26\u53f7\u91cd\u65b0\u767b\u5f55\u5f53\u524d\u670d\u52a1\u5668\uff08HTTP 401\uff09");
        if(code==403) return new RequestFailure("\u5f53\u524d\u670d\u52a1\u5668\u62d2\u7edd\u4e86\u8bf7\u6c42\uff0c\u8bf7\u68c0\u67e5\u8d26\u53f7\u548c\u670d\u52a1\u5668\u5730\u5740\uff08HTTP 403\uff09");
        return new RequestFailure(code==0?"\u672a\u6536\u5230\u670d\u52a1\u5668\u54cd\u5e94":"\u8bf7\u6c42\u5931\u8d25\uff08HTTP "+code+"\uff09");
    }
    public static JSONObject reviewJson(String body) throws JSONException {
        return body==null || body.trim().isEmpty()?new JSONObject():new JSONObject(body);
    }
    public static String reviewMessage(JSONObject result) {
        String fallback="\u8fdb\u5ea6\u5df2\u66f4\u65b0";
        String message=result==null?fallback:result.optString("message",fallback);
        return message.trim().isEmpty()?fallback:message;
    }
    public static void showError(Activity activity,Exception error) {
        // Do not expose request URLs, tokens or response bodies in ordinary error UI.
        String message=error instanceof RequestFailure?error.getMessage():
                "\u8bf7\u6c42\u672a\u6210\u529f\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u548c\u767b\u5f55\u72b6\u6001";
        MAIN.postDelayed(()-> {
            if(!activity.isFinishing() && !activity.isDestroyed())
                Toast.makeText(activity,message,Toast.LENGTH_LONG).show();
        },0L);
    }
    public static void deliver(Receiver receiver,Exception error,AsyncHttpResponse response,JSONObject result) {
        // Check ownership on the same thread that replaces lists and pagination.
        MAIN.postDelayed(()-> {
            if(!receiver.isCurrent()) return;
            Exception failure=error;
            if(failure==null && (response==null || response.code()<200 || response.code()>=300)
                    && (result==null || !result.has("works"))) failure=reviewError(null,response,result);
            if(failure==null && result!=null && !result.optBoolean("success",true))
                failure=new RequestFailure("\u670d\u52a1\u5668\u672a\u786e\u8ba4\u8bf7\u6c42\u6210\u529f");
            if(failure==null && (result==null || result.optJSONArray("works")==null))
                failure=new RequestFailure("\u670d\u52a1\u5668\u672a\u8fd4\u56de\u6709\u6548\u4f5c\u54c1\u5217\u8868");
            receiver.receive(failure,response,result);
        },0L);
    }
}
