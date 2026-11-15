package com.zinhao.kikoeru;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.CancellationException;
import org.json.JSONArray;
import org.json.JSONObject;

public final class LocalDeletionTest {
    private static int checks;
    private interface Action { void run() throws Exception; }
    private static void check(boolean value,String message) {
        checks++; if(!value) throw new AssertionError(message);
    }
    private static void reject(Action action,String message) throws Exception {
        boolean rejected=false;
        try { action.run(); } catch(IOException|IllegalStateException|SecurityException|IllegalArgumentException expected) { rejected=true; }
        check(rejected,message);
    }
    private static String uri(String id) { return "content://docs/tree/library/document/"+id; }
    private static LocalIndex.Entry entry(String id,String name,boolean directory) {
        return new LocalIndex.Entry(uri(id),name,directory?"vnd.android.document/directory":"application/octet-stream",directory,directory?0:100);
    }
    private static final class Provider implements LocalDeletion.Provider {
        final Map<String,LocalIndex.Entry> nodes=new HashMap<>();
        final Map<String,List<LocalIndex.Entry>> children=new HashMap<>();
        final Map<String,String> parents=new HashMap<>();
        boolean allow=true,result=true,escaped;
        int deletes;
        Provider() {
            add("library",null,"Collection",true);
            add("album","library","Album A",true); add("sub","album","Disc 2",true);
            add("audio","album","01.flac",false); add("second","sub","02.wav",false);
            add("cover","album","cover.jpg",false); add("lrc","album","01.lrc",false);
            add("other","library","Album B",true); add("other-audio","other","01.mp3",false);
        }
        void add(String id,String parent,String name,boolean directory) {
            LocalIndex.Entry node=entry(id,name,directory); nodes.put(uri(id),node);
            children.putIfAbsent(uri(id),new ArrayList<>());
            if(parent!=null) { children.get(uri(parent)).add(node); parents.put(uri(id),uri(parent)); }
        }
        public LocalIndex.Entry document(String value) throws Exception {
            if(!nodes.containsKey(value)) throw new IOException("Missing folder"); return nodes.get(value);
        }
        public List<LocalIndex.Entry> children(String value) { return new ArrayList<>(children.get(value)); }
        public boolean contains(String parent,String child) {
            if(escaped && child.equals(uri("other-audio"))) return false;
            Set<String> seen=new HashSet<>();
            while(child!=null && seen.add(child)) { if(parent.equals(child)) return true; child=parents.get(child); }
            return false;
        }
        public boolean canDelete(String uri) { return allow; }
        public boolean delete(String uri) { deletes++; return result; }
    }
    private static JSONArray roots(Provider provider) throws Exception {
        JSONObject root=LocalIndex.scan(provider.document(uri("library")),provider::children,new LocalIndex.Progress() {
            public void update(int folders,int tracks) {}
            public boolean cancelled() { return false; }
        }).put("uri","content://docs/tree/library").put("document",uri("library"));
        return new JSONArray().put(root);
    }
    private static LocalDeletion.Snapshot prepare(JSONArray roots,Provider provider) throws Exception {
        return LocalDeletion.prepare(roots,"content://docs/tree/library",uri("album"),provider,()->false);
    }
    private static JSONObject track(String value) throws Exception {
        return new JSONObject().put("local_import",true).put("mediaStreamUrl",value);
    }
    public static void main(String[] args) throws Exception {
        Provider provider=new Provider(); JSONArray roots=roots(provider); String original=roots.toString();
        LocalDeletion.Snapshot plan=prepare(roots,provider);
        check(plan.files==4 && plan.folders==2 && plan.tracks==2 && plan.bytes==400,"Preview includes nested audio, cover and subtitle files");
        check(plan.name.equals("Album A"),"Confirmation uses live folder name");
        check(provider.deletes==0,"Preview never deletes");
        check(LocalDeletion.key(uri("audio")).equals(LocalDeletion.key("content://docs/tree/other/document/audio")),
                "Same document through overlapping imports has one identity");
        check(!LocalDeletion.key(uri("album")).equals(LocalDeletion.key(uri("album2"))),"Sibling prefixes are distinct");
        check(!LocalDeletion.key(uri("audio")).equals(LocalDeletion.key("content://foreign/tree/library/document/audio")),"Authorities are distinct");
        check(LocalDeletion.key("content://docs/tree/a/document/x%2Fy").endsWith("x/y"),"Document IDs are decoded structurally");
        check(!LocalDeletion.key("content://docs/tree/a/document/a+b").equals(LocalDeletion.key("content://docs/tree/a/document/a%20b")),"Plus and space document IDs differ");
        reject(()->LocalDeletion.key("file:///storage/emulated/0/album"),"No raw filesystem deletion fallback");
        reject(()->LocalDeletion.begin(plan,Collections.emptyList(),false,true),"Delete mode off blocks operation");
        reject(()->LocalDeletion.begin(plan,Collections.emptyList(),true,false),"Missing confirmation blocks operation");
        reject(()->LocalDeletion.execute(plan,roots,provider,true,true),"Execute without confirmed transaction blocked");
        reject(()->LocalDeletion.begin(plan,Arrays.asList(track(uri("audio"))),true,true),"Current album queue protected");
        reject(()->LocalDeletion.begin(plan,Arrays.asList(track("content://docs/tree/alias/document/second")),true,true),"Queued descendant through alias protected");
        check(provider.deletes==0,"All rejected actions leave files untouched");
        LocalDeletion.begin(plan,Arrays.asList(track(uri("other-audio"))),true,true);
        try {
            reject(()->LocalDeletion.checkPlayback(Arrays.asList(track(uri("audio")))),"Cannot start deleting work during confirmation transaction");
            LocalDeletion.checkPlayback(Arrays.asList(track(uri("other-audio"))));
            check(true,"Unrelated local playback remains available");
            LocalDeletion.checkPlayback(Arrays.asList(new JSONObject().put("mediaStreamUrl","https://example.invalid/audio")));
            check(true,"Online playback unaffected");
            reject(()->LocalDeletion.begin(plan,Collections.emptyList(),true,true),"Concurrent deletion blocked");
            LocalDeletion.execute(plan,roots,provider,true,true);
            check(provider.deletes==1,"One explicit folder delete call");
            reject(()->LocalDeletion.execute(plan,roots,provider,true,true),"Double execution blocked");
        } finally { LocalDeletion.finish(plan); }
        LocalDeletion.checkPlayback(Arrays.asList(track(uri("audio")))); check(true,"Playback guard released after transaction");
        reject(()->LocalDeletion.begin(plan,Collections.emptyList(),true,true),"Consumed confirmation cannot be reused");
        JSONArray pruned=LocalDeletion.prune(roots,plan);
        check(roots.toString().equals(original),"Pruning does not mutate existing index before save");
        check(pruned.length()==1 && pruned.getJSONObject(0).getInt("count")==1,"Sibling audio count preserved");
        List<JSONObject> albums=LocalIndex.albums(pruned);
        check(albums.size()==1 && albums.get(0).optString("name").equals("Album B"),"Only selected work disappears");
        check(pruned.getJSONObject(0).getJSONArray("entries").toString().indexOf("Album A")==-1,"Descendants removed from index");
        Provider changed=new Provider(); JSONArray changedRoots=roots(changed); LocalDeletion.Snapshot old=prepare(changedRoots,changed);
        changed.add("new-file","album","extra.txt",false);
        LocalDeletion.begin(old,Collections.emptyList(),true,true);
        try { reject(()->LocalDeletion.execute(old,changedRoots,changed,true,true),"New files require fresh confirmation"); }
        finally { LocalDeletion.finish(old); }
        check(changed.deletes==0,"Changed folder is not deleted");
        Provider failed=new Provider(); JSONArray failedRoots=roots(failed); LocalDeletion.Snapshot failure=prepare(failedRoots,failed);
        String failedOriginal=failedRoots.toString();
        failed.result=false; LocalDeletion.begin(failure,Collections.emptyList(),true,true);
        try { reject(()->LocalDeletion.execute(failure,failedRoots,failed,true,true),"Provider failure is not success"); }
        finally { LocalDeletion.finish(failure); }
        check(failedRoots.toString().equals(failedOriginal),"Provider failure retains old index");
        Provider unsupported=new Provider(); unsupported.allow=false;
        reject(()->prepare(roots(unsupported),unsupported),"Unsupported delete flag rejected");
        check(unsupported.deletes==0,"Unsupported providers never receive delete calls");
        reject(()->LocalDeletion.prepare(roots,"content://docs/tree/missing",uri("album"),provider,()->false),"Removed import rejected");
        reject(()->LocalDeletion.prepare(roots,"content://docs/tree/library",uri("other-audio"),provider,()->false),"Tracks cannot be mistaken for whole works");
        reject(()->LocalDeletion.prepare(roots,"content://docs/tree/library",uri("library"),provider,()->false),"Collection root cannot be deleted as one work");
        reject(()->LocalDeletion.prepare(roots,"content://docs/tree/library",uri("album"),provider,()->true),"Cancelled preview rejected");
        Provider cycle=new Provider(); cycle.children.get(uri("sub")).add(cycle.nodes.get(uri("album")));
        reject(()->prepare(roots,cycle),"Folder cycles rejected");
        Provider escape=new Provider(); escape.escaped=true; escape.children.get(uri("album")).add(escape.nodes.get(uri("other-audio")));
        reject(()->prepare(roots,escape),"Provider cannot expand deletion scope to sibling work");
        Provider renamed=new Provider(); JSONArray renamedRoots=roots(renamed); LocalDeletion.Snapshot rename=prepare(renamedRoots,renamed);
        renamed.nodes.put(uri("album"),entry("album","Different work",true));
        LocalDeletion.begin(rename,Collections.emptyList(),true,true);
        try { reject(()->LocalDeletion.execute(rename,renamedRoots,renamed,true,true),"Renamed target requires reconfirmation"); }
        finally { LocalDeletion.finish(rename); }
        check(renamed.deletes==0,"Renamed target not deleted");
        JSONArray nested=new JSONArray().put(new JSONObject(roots.getJSONObject(0).toString())
                .put("uri","content://docs/tree/album").put("document",uri("album")));
        JSONArray combined=new JSONArray().put(roots.getJSONObject(0)).put(nested.getJSONObject(0));
        check(LocalDeletion.prune(combined,plan).length()==1,"Nested overlapping import removed when its actual folder is deleted");
        JSONObject direct=LocalIndex.scan(provider.document(uri("album")),provider::children,new LocalIndex.Progress() {
            public void update(int folders,int tracks) {}
            public boolean cancelled() { return false; }
        }).put("uri","content://docs/tree/direct").put("document",uri("album"));
        JSONArray single=new JSONArray().put(direct);
        LocalDeletion.Snapshot directPlan=LocalDeletion.prepare(single,"content://docs/tree/direct",uri("album"),provider,()->false);
        check(LocalDeletion.prune(single,directPlan).length()==0,"Directly imported single album can be removed without sibling loss");
        check(provider.deletes==1,"Pruning/import cleanup does not itself delete files");
        System.out.println("PASS: "+checks+" local deletion safety checks against production bytecode");
    }
}
