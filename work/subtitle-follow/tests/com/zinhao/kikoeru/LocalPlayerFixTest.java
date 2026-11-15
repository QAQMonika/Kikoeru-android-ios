package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Intent;
import androidx.recyclerview.widget.RecyclerView;
import java.util.*;
import org.json.JSONObject;

public final class LocalPlayerFixTest {
    private static int checks;
    private static void check(boolean value,String message) {
        checks++; if(!value) throw new AssertionError(message);
    }
    private static final class Adapter extends RecyclerView.Adapter<Object> {
        final boolean[] enlarged=new boolean[20];
        final List<Integer> notified=new ArrayList<>();
        int current;
        Adapter(int old) { current=old; if(old>=0) enlarged[old]=true; }
        public int getItemCount() { return enlarged.length; }
        public void notifyItemChanged(int position) {
            if(position<0 || position>=enlarged.length) throw new AssertionError("Out-of-range notification");
            notified.add(position); enlarged[position]=position==current;
        }
        void select(int next) {
            int previous=current; current=LrcSelection.index(next,enlarged.length);
            LrcSelection.refresh(this,previous,current);
        }
    }
    public static void main(String[] args) throws Exception {
        for(int old:new int[]{-1,0,1,2,3,7,18,19}) for(int next:new int[]{-5,-1,0,1,2,3,6,18,19,20,99}) {
            Adapter adapter=new Adapter(old); adapter.select(next);
            int count=0; for(boolean row:adapter.enlarged) if(row) count++;
            int selected=LrcSelection.index(next,20);
            check(count==(selected<0?0:1),"Exactly one highlighted row for "+old+" -> "+next);
            if(old>=0 && old!=selected) check(!adapter.enlarged[old],"Old row reset in both jump directions");
            if(selected>=0) check(adapter.enlarged[selected],"New row is enlarged");
            check(adapter.notified.size()<=2,"Only old/new rows rebound");
        }
        Adapter adapter=new Adapter(19);
        for(int next:new int[]{17,15,18,1,3,2,19,0,-1,7,7}) {
            adapter.select(next); int count=0; for(boolean row:adapter.enlarged) if(row) count++;
            check(count==(next<0?0:1),"Rapid mixed jumps do not accumulate highlights");
        }
        check(LrcSelection.index(0,0)==-1,"Empty subtitles have no selected row");
        RecyclerView recycler=new RecyclerView(); LrcSelection.configure(recycler);
        check(recycler.animator==null,"Obsolete enlarged holders are not crossfaded");
        Activity activity=new Activity(); AudioService.CtrlBinder binder=new AudioService().new CtrlBinder();
        PlayerNavigation.openPlayer(activity);
        Intent intent=activity.started.get(0);
        check(intent.target==AudioPlayerActivity.class,"Player opens directly over the caller");
        check(intent.getFlags()==0,"No reorder, clear-top or new-task flags discard the caller");
        check(intent.getStringExtra("source")==null,"Player open does not synthesize a local-folder return target");
        PlayerNavigation.openQueue(activity);
        check(activity.started.get(1).target==PlaybackQueueActivity.class,"Queue requires an explicit menu action");
        check(activity.started.get(1).getFlags()==0,"Queue browsing preserves the caller's back stack");
        check(PlayerNavigation.snapshot(null).isEmpty(),"Queue browsing before service binding is empty and harmless");
        check(PlayerNavigation.snapshot(binder).isEmpty(),"Empty queue is supported");
        JSONObject first=new JSONObject().put("mediaStreamUrl","content://docs/audio1");
        JSONObject second=new JSONObject().put("mediaStreamUrl","content://docs/audio2");
        binder.queue.add(first); binder.queue.add(second);
        List<JSONObject> shown=PlayerNavigation.snapshot(binder); shown.remove(1);
        check(binder.queue.size()==2,"Browsing snapshot cannot mutate the live queue");
        shown=PlayerNavigation.snapshot(binder); binder.player.position=123456;
        check(PlayerNavigation.select(binder,shown,0),"Selecting current item can open the player");
        check(binder.playCalls==0 && binder.player.position==123456 && !binder.player.playing,"Current row is not restarted or autoplayed");
        check(!PlayerNavigation.select(null,shown,0),"Disconnected selection is rejected");
        check(!PlayerNavigation.select(binder,shown,-1) && !PlayerNavigation.select(binder,shown,2),"Invalid positions rejected");
        binder.queue.set(1,new JSONObject().put("mediaStreamUrl","https://example.invalid/replacement"));
        check(!PlayerNavigation.select(binder,shown,1) && binder.playCalls==0,"Stale queue cannot play a different item");
        shown=PlayerNavigation.snapshot(binder);
        check(PlayerNavigation.select(binder,shown,1),"Explicitly selected other row switches tracks");
        check(binder.playCalls==1 && binder.player.index==1,"Track selection uses the existing player");
        binder.queue.clear();
        check(!PlayerNavigation.select(binder,shown,1),"Cleared queue invalidates old rows");
        System.out.println("PASS: "+checks+" local navigation/subtitle selection checks against production bytecode");
    }
}
