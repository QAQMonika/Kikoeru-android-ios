package com.zinhao.kikoeru;

import android.app.Activity;
import android.os.Handler;
import android.widget.Toast;
import com.koushikdutta.async.http.AsyncHttpResponse;
import java.io.IOException;
import java.lang.reflect.Proxy;
import org.json.JSONException;
import org.json.JSONObject;

public final class CatalogStateTest {
    private static int checks;
    private static void check(boolean value,String message) {
        checks++;
        if(!value) throw new AssertionError(message);
    }
    private static AsyncHttpResponse response(int code) {
        return (AsyncHttpResponse)Proxy.newProxyInstance(CatalogStateTest.class.getClassLoader(),
                new Class<?>[]{AsyncHttpResponse.class},(proxy,method,args)-> {
                    if(method.getName().equals("code")) return code;
                    if(method.getReturnType()==boolean.class) return false;
                    if(method.getReturnType()==int.class) return 0;
                    return null;
                });
    }
    private static final class Receiver implements CatalogState.Receiver {
        boolean current=true;
        int delivered;
        Exception error;
        JSONObject result;
        public boolean isCurrent() { return current; }
        public void receive(Exception error,AsyncHttpResponse response,JSONObject result) {
            delivered++; this.error=error; this.result=result;
        }
    }
    private static Receiver deliver(Exception error,AsyncHttpResponse response,JSONObject result) {
        Receiver receiver=new Receiver();
        CatalogState.deliver(receiver,error,response,result);
        check(receiver.delivered==0,"Delivery is deferred to the main queue");
        Handler.advance(0);
        check(receiver.delivered==1,"Current request delivered exactly once");
        return receiver;
    }
    public static void main(String[] args) throws Exception {
        Handler.reset();
        for(int type=491;type<=500;type++) {
            check(!CatalogState.refreshOnResume(false,type,0,0),"No double initial load "+type);
            check(CatalogState.refreshOnResume(true,type,1,0)==(type!=498),"Uncheck refresh "+type);
            check(CatalogState.refreshOnResume(true,type,0,1)==(type!=498),"Check refresh "+type);
            check(CatalogState.refreshOnResume(true,type,0,0)==(type>=492 && type<=496),
                    "Only review lists re-fetch on ordinary resume "+type);
        }
        check("updated_at".equals(CatalogState.reviewOrder("release")),"Review default uses update time");
        for(String order:new String[]{"rate_count","dl_count","price","create_date","updated_at"})
            check(order.equals(CatalogState.reviewOrder(order)),"Other sort choices unchanged "+order);
        IOException transport=new IOException("https://example.invalid/?token=private");
        check(CatalogState.reviewError(transport,null,null)==transport,"Keep transport failure identity");
        for(int code:new int[]{200,201,204})
            check(CatalogState.reviewError(null,response(code),null)==null,"Any successful status "+code);
        for(int code:new int[]{401,403,404,500}) {
            Exception error=CatalogState.reviewError(null,response(code),new JSONObject());
            check(error!=null && error.getMessage().contains("HTTP "+code),"HTTP failure visible "+code);
        }
        check(CatalogState.reviewError(null,null,null)!=null,"Missing response is failure");
        check(CatalogState.reviewError(null,response(200),new JSONObject().put("success",false))!=null,
                "Server refusal must not show success");
        for(String body:new String[]{null,"","  \n"})
            check(CatalogState.reviewJson(body).length()==0,"Empty successful body accepted");
        check(CatalogState.reviewJson("{\"success\":true}").getBoolean("success"),"Real JSON parsing");
        boolean invalid=false;
        try { CatalogState.reviewJson("<html>bad</html>"); } catch(JSONException expected) { invalid=true; }
        check(invalid,"Invalid response remains an error, not false success");
        for(JSONObject result:new JSONObject[]{null,new JSONObject(),new JSONObject().put("message"," ")})
            check(CatalogState.reviewMessage(result).equals("\u8fdb\u5ea6\u5df2\u66f4\u65b0"),
                    "Missing success message has a fallback");
        check(CatalogState.reviewMessage(new JSONObject().put("message","saved")).equals("saved"),
                "Server success message preserved");
        JSONObject works=new JSONObject("{\"works\":[],\"pagination\":{\"currentPage\":1,\"totalCount\":0}}");
        Receiver receiver=deliver(null,response(200),works);
        check(receiver.error==null && receiver.result==works,"Valid server data retained");
        receiver=deliver(null,null,works);
        check(receiver.error==null,"Original local cache response retained");
        receiver=deliver(null,response(401),new JSONObject());
        check(receiver.error!=null && receiver.error.getMessage().contains("401"),"GET auth refusal not silent");
        receiver=deliver(transport,response(404),works);
        check(receiver.error==transport,"Transport error not hidden by data");
        receiver=deliver(null,response(200),null);
        check(receiver.error!=null,"Null successful catalog response cannot crash native consumer");
        receiver=deliver(null,response(200),new JSONObject().put("works","wrong"));
        check(receiver.error!=null,"Invalid list shape reported");
        receiver=deliver(null,response(200),new JSONObject().put("works",works.getJSONArray("works"))
                .put("success",false));
        check(receiver.error!=null,"Catalog success:false reported");
        receiver=new Receiver();
        CatalogState.deliver(receiver,null,response(200),works);
        receiver.current=false;
        Handler.advance(0);
        check(receiver.delivered==0,"Ownership checked after queuing; old response discarded");
        receiver=new Receiver(); receiver.current=false;
        CatalogState.deliver(receiver,transport,response(401),null);
        Handler.advance(0);
        check(receiver.delivered==0,"Cancelled owner's errors discarded too");
        Activity activity=new Activity();
        CatalogState.showError(activity,CatalogState.reviewError(null,response(401),null));
        check(Toast.shown==0,"Error UI dispatched on main");
        Handler.advance(0);
        check(Toast.shown==1 && Toast.last.contains("401"),"Error visible without debug setting");
        CatalogState.showError(activity,transport); Handler.advance(0);
        check(Toast.shown==2 && !Toast.last.contains("token") && !Toast.last.contains("example.invalid"),
                "Transport diagnostics do not expose credentials");
        CatalogState.showError(activity,transport); activity.destroyed=true; Handler.advance(0);
        check(Toast.shown==2,"No stale toast on destroyed page");
        activity.destroyed=false; activity.finishing=true;
        CatalogState.showError(activity,transport); Handler.advance(0);
        check(Toast.shown==2,"No stale toast on finishing page");
        check(Handler.pending()==0,"No queued work leaks");
        System.out.println("PASS: "+checks+" catalog refresh/review checks against production bytecode");
    }
}
