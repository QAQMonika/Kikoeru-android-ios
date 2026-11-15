import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.dexbacked.reference.DexBackedStringReference;
import java.io.File;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class VerifyHelpers {
    private static Method method(ClassDef type,String name) {
        if(type==null) throw new AssertionError("Missing packaged class");
        for(Iterable methods:new Iterable[]{type.getDirectMethods(),type.getVirtualMethods()}) for(Object item:methods) {
            Method method=(Method)item;
            if(method.getName().equals(name)) return method;
        }
        throw new AssertionError("Missing method: "+type.getType()+"->"+name);
    }
    private static void homeStartup(ClassDef works) {
        String app="Lcom/zinhao/kikoeru/";
        Set<String> setup=calls(works,"setupData"),create=calls(works,"onCreate");
        if(setup.contains(app+"App;->getValue") || create.contains(app+"WorksActivity;->loadLastOpenWork")
                || !create.contains(app+"WorksActivity;->setupData"))
            throw new AssertionError("Fresh catalog must not restore old filters or cached filtered works");
        Map<String,Integer> values=new HashMap<>();
        Integer literal=null;
        for(Object item:method(works,"setupData").getImplementation().getInstructions()) {
            Instruction instruction=(Instruction)item;
            String op=instruction.getOpcode().name();
            if(instruction instanceof OneRegisterInstruction && ((OneRegisterInstruction)instruction).getRegisterA()==0) {
                if(instruction instanceof NarrowLiteralInstruction)
                    literal=((NarrowLiteralInstruction)instruction).getNarrowLiteral();
                else if(op.equals("IPUT") && instruction instanceof ReferenceInstruction) {
                    FieldReference field=(FieldReference)((ReferenceInstruction)instruction).getReference();
                    values.put(field.getName(),literal);
                } else literal=null;
            }
        }
        if(!Integer.valueOf(491).equals(values.get("type"))
                || !Integer.valueOf(1).equals(values.get("page"))
                || !Integer.valueOf(1).equals(values.get("currentPage"))
                || !Integer.valueOf(0).equals(values.get("totalCount")))
            throw new AssertionError("Fresh catalog must use home, page 1 and no stale count");
        Integer register=null;
        boolean home=false;
        for(Object item:method(works,"onCreate").getImplementation().getInstructions()) {
            Instruction instruction=(Instruction)item;
            if(instruction instanceof NarrowLiteralInstruction) {
                register=((NarrowLiteralInstruction)instruction).getNarrowLiteral()==491
                        ?((OneRegisterInstruction)instruction).getRegisterA():null;
            } else if(register!=null && instruction instanceof ReferenceInstruction) {
                Object ref=((ReferenceInstruction)instruction).getReference();
                if(ref instanceof MethodReference && ((MethodReference)ref).getName().equals("loadFromNetWork")) {
                    home=instruction instanceof FiveRegisterInstruction
                            && ((FiveRegisterInstruction)instruction).getRegisterD()==register;
                }
            }
        }
        if(!home) throw new AssertionError("Startup must actually request the home catalog");
        if(!calls(works,"onNewIntent").contains(app+"WorksActivity;->loadFromNetWork"))
            throw new AssertionError("Explicit in-session tag/voice navigation must remain available");
        for(String call:setup) if(call.contains("PlaybackPosition;") || call.contains("TrackResume;"))
            throw new AssertionError("Browsing defaults must not clear playback checkpoints");
        System.out.println("PASS: packaged home/page-1 startup, no old-filter cache restore and unchanged in-session navigation");
    }
    private static Set<String> calls(ClassDef type,String name) {
        if(type==null) throw new AssertionError("Missing packaged class");
        Set<String> result=new HashSet<>();
        boolean found=false;
        for(Iterable methods:new Iterable[]{type.getDirectMethods(),type.getVirtualMethods()}) for(Object item:methods) {
            Method method=(Method)item;
            if(!method.getName().equals(name)) continue;
            found=true;
            for(Object value:method.getImplementation().getInstructions()) {
                Instruction instruction=(Instruction)value;
                if(instruction instanceof ReferenceInstruction) {
                    Object ref=((ReferenceInstruction)instruction).getReference();
                    if(ref instanceof MethodReference) {
                        MethodReference call=(MethodReference)ref;
                        result.add(call.getDefiningClass()+"->"+call.getName());
                    }
                }
            }
        }
        if(!found) throw new AssertionError("Missing method: "+type.getType()+"->"+name);
        return result;
    }
    private static void catalogBridge(ClassDef works,ClassDef callback,ClassDef api,
            ClassDef action,ClassDef put,ClassDef catalog) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(works,"onResume").contains(app+"CatalogState;->refreshOnResume")
                || !calls(works,"onResume").contains(app+"WorksActivity;->clearWork")
                || !calls(works,"onResume").contains(app+"WorksActivity;->loadFromNetWork"))
            throw new AssertionError("Resume must refresh changed filters and review lists");
        if(!calls(works,"loadFromNetWork").contains(app+"WorksActivity$apisCallback$1;-><init>")
                || !calls(callback,"<init>").contains(app+"WorksActivity;->getCatalogGeneration")
                || !calls(callback,"isCurrent").contains(app+"WorksActivity;->getCatalogGeneration"))
            throw new AssertionError("Each catalog request must own a generation");
        if(!calls(callback,"onCompleted").contains(app+"CatalogState;->deliver")
                || !calls(catalog,"deliver").contains("Landroid/os/Handler;->postDelayed"))
            throw new AssertionError("Response parsing/list mutations must run on main queue");
        if(!calls(callback,"receive").contains(app+"CatalogState;->showError")
                || !calls(action,"onCompleted").contains(app+"CatalogState;->showError")
                || !calls(action,"onCompleted").contains(app+"CatalogState;->reviewError")
                || !calls(put,"onResponse").contains(app+"CatalogState;->reviewJson"))
            throw new AssertionError("Review errors and empty successful bodies must be handled");
        if(!calls(api,"doGetReview").contains(app+"CatalogState;->reviewOrder")
                || calls(api,"doGetWorks").contains(app+"CatalogState;->reviewOrder"))
            throw new AssertionError("Review ordering must not change homepage sorting");
        System.out.println("PASS: packaged filter/review lifecycle, generation guard and error UI bridges");
    }
    private static void subtitleBridge(ClassDef activity,ClassDef follow) {
        String app="Lcom/zinhao/kikoeru/";
        Set<String> sync=calls(activity,"syncLrcFollowIndex");
        if(!sync.contains("Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition")
                || !sync.contains(app+"Lrc;->update") || !sync.contains(app+"LrcAdapter;->update"))
            throw new AssertionError("Entry sync must read actual position and refresh current-row styling");
        for(String call:sync) if(call.endsWith("->seekTo") || call.endsWith("->play") || call.endsWith("->pause"))
            throw new AssertionError("Subtitle entry sync must never change audio playback");
        Set<String> setup=calls(activity,"setupLrc");
        if(!setup.contains(app+"LrcAutoFollow;->alignCurrent") || setup.contains(app+"LrcAutoFollow;->resumeAt"))
            throw new AssertionError("Initial setup must use layout-safe entry alignment, not click scrolling");
        Set<String> align=calls(follow,"alignAfterLayout");
        if(!align.contains(app+"AudioPlayerActivity;->syncLrcFollowIndex")
                || !align.contains("Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset")
                || align.contains("Landroidx/recyclerview/widget/LinearLayoutManager;->startSmoothScroll"))
            throw new AssertionError("Entry alignment must snap only after layout readiness");
        if(!calls(follow,"dispose").contains("Landroidx/recyclerview/widget/RecyclerView;->removeOnLayoutChangeListener"))
            throw new AssertionError("Layout callback must be disposed with the old player page");
        System.out.println("PASS: packaged subtitle re-entry bridge; sync does not seek/play/pause audio");
    }
    private static void localFixBridge(ClassDef player,ClassDef adapter,ClassDef binder,ClassDef selection,
            ClassDef library,ClassDef libraryHost,ClassDef deletion) {
        String app="Lcom/zinhao/kikoeru/";
        Set<String> exit=calls(player,"finish");
        if(exit.size()!=1 || !exit.contains(app+"BaseActivity;->finish"))
            throw new AssertionError("Player Back must only finish, exposing its actual caller");
        for(String call:exit) if(call.endsWith("->play") || call.endsWith("->pause") || call.endsWith("->seekTo"))
            throw new AssertionError("Returning to a local folder cannot change playback");
        if(!calls(player,"setupLrc").contains(app+"LrcSelection;->configure")
                || !calls(selection,"configure").contains("Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator")
                || !calls(adapter,"update").contains(app+"LrcSelection;->refresh"))
            throw new AssertionError("Native subtitle adapter must use unique-selection refresh without stale crossfades");
        boolean committed=false,refresh=false;
        for(Object item:adapter.getVirtualMethods()) {
            Method method=(Method)item; if(!method.getName().equals("update")) continue;
            for(Object value:method.getImplementation().getInstructions()) {
                Instruction instruction=(Instruction)value;
                if(!(instruction instanceof ReferenceInstruction)) continue;
                Object reference=((ReferenceInstruction)instruction).getReference();
                if(reference instanceof FieldReference && instruction.getOpcode().name().equals("IPUT")
                        && ((FieldReference)reference).getName().equals("oldIndex")) committed=true;
                if(reference instanceof MethodReference && ((MethodReference)reference).getDefiningClass().equals(app+"LrcSelection;")
                        && ((MethodReference)reference).getName().equals("refresh")) {
                    if(!committed) throw new AssertionError("Selection must be committed before any row notification");
                    refresh=true;
                }
            }
        }
        if(!refresh) throw new AssertionError("Missing selection commit/refresh bridge");
        if(!calls(binder,"play").contains(app+"LocalDeletion;->checkPlayback"))
            throw new AssertionError("Starting a deleting local work must be blocked");
        if(!calls(libraryHost,"onNewIntent").stream().anyMatch(call->call.endsWith("->setIntent"))
                || !calls(library,"onNewIntent").contains(app+"LocalLibraryController;->requestTab"))
            throw new AssertionError("Reused local browser must consume its return intent");
        if(!calls(deletion,"execute").contains(app+"LocalDeletion$Provider;->delete")
                || calls(deletion,"prepare").contains(app+"LocalDeletion$Provider;->delete"))
            throw new AssertionError("Only confirmed execution may call the document delete API");
        if(calls(library,"back").contains(app+"LocalLibraryController;->findRoot")
                || !calls(library,"onServiceConnected").contains(app+"MiniPlayer;->attach")
                || !calls(library,"onDestroy").contains(app+"MiniPlayer;->dispose"))
            throw new AssertionError("Local Back must skip import ancestors and dock must follow service lifecycle");
        System.out.println("PASS: caller-preserving Back, local dock, unique subtitle selection and deletion safety bridges");
    }
    private static void localUi(ClassDef library,File apk) throws Exception {
        Set<String> icons=new HashSet<>();
        for(Object item:library.getDirectMethods()) {
            Method method=(Method)item; if(!method.getName().equals("build")) continue;
            for(Object valueInstruction:method.getImplementation().getInstructions()) {
                Instruction instruction=(Instruction)valueInstruction; if(!(instruction instanceof ReferenceInstruction)) continue;
                Object reference=((ReferenceInstruction)instruction).getReference();
                if(reference instanceof DexBackedStringReference) {
                    String value=((DexBackedStringReference)reference).getString();
                    if(value.startsWith("ic_")) icons.add(value);
                }
            }
        }
        try(java.util.zip.ZipFile zip=new java.util.zip.ZipFile(apk)) {
            for(String name:icons) if(zip.getEntry("res/drawable/"+name+".xml")==null)
                throw new AssertionError("Local toolbar uses a missing icon: "+name);
        }
        if(!icons.contains("ic_arrow_back_black_24") || !icons.contains("ic_baseline_more_horiz_24"))
            throw new AssertionError("Local toolbar must use the packaged app icons");
        if(!calls(library,"managementMenu").contains("Landroid/widget/Switch;-><init>")
                || calls(library,"managementMenu").contains("Landroid/widget/PopupMenu;-><init>")
                || !calls(library,"styleDialog").contains("Landroid/view/Window;->setBackgroundDrawable"))
            throw new AssertionError("Local management must use palette-styled dialogs and a toggle");
        System.out.println("PASS: local toolbar icon resources, management toggle and palette dialog styling");
    }
    private static void playbackUi(ClassDef player,ClassDef works,ClassDef tree,ClassDef navigation,
            ClassDef mini,ClassDef queue) {
        String app="Lcom/zinhao/kikoeru/";
        for(ClassDef owner:new ClassDef[]{player,works,tree})
            if(!calls(owner,"onAlbumChange").contains(app+"PlayerArtwork;->bindLocal"))
                throw new AssertionError("Every existing playback cover must support restored local artwork");
        if(!calls(works,"setupMoreMenu$lambda$0").contains(app+"PlayerNavigation;->openQueue")
                || !calls(queue,"refresh").contains(app+"PlayerNavigation;->snapshot"))
            throw new AssertionError("Queue entry must browse the live queue explicitly");
        for(Set<String> method:new Set[]{calls(navigation,"openPlayer"),calls(navigation,"openQueue"),calls(mini,"render"),calls(queue,"refresh")})
            for(String call:method) if(call.endsWith("->play") || call.endsWith("->pause") || call.endsWith("->seekTo") || call.endsWith("->setMediaItems"))
                throw new AssertionError("Opening/painting a player or queue must not alter playback");
        if(!calls(mini,"active").stream().anyMatch(call->call.endsWith("->removeListener"))
                || !calls(mini,"dispose").contains(app+"LocalArt;->cancel"))
            throw new AssertionError("Local dock must release listeners and artwork on exit");
        System.out.println("PASS: explicit queue entry, read-only dock rendering, cover recovery and listener disposal");
    }
    private static void resumeFavorites(ClassDef binder,ClassDef more,ClassDef library,ClassDef favorites) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(binder,"play").contains(app+"PlaybackPosition;->startPosition")
                || !calls(more,"onCreate").contains(app+"PlaybackOptions;->install"))
            throw new AssertionError("Native track selection must read per-track position and expose the preference");
        if(!calls(library,"refreshRows").contains(app+"LocalFavorites;->albums")
                || !calls(library,"build").contains(app+"LocalLibraryController;->button")
                || !calls(favorites,"toggle").contains("Landroid/content/SharedPreferences$Editor;->putStringSet"))
            throw new AssertionError("Local favorites must filter local albums and use separate preferences");
        for(Set<String> method:new Set[]{calls(library,"tab"),calls(favorites,"toggle"),calls(favorites,"albums")})
            for(String call:method) if(call.endsWith("->play") || call.endsWith("->seekTo") || call.contains("Lcom/zinhao/kikoeru/Api;"))
                throw new AssertionError("Local tabs/favorites cannot play audio or change online progress");
        System.out.println("PASS: native per-track resume, More switch and independent read-only local favorites bridges");
    }
    private static void visualBridge(ClassDef follow,ClassDef visuals,ClassDef adapter) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(follow,"<init>").contains(app+"LrcVisuals;-><init>")
                || !calls(follow,"scrollTo").contains(app+"LrcVisuals;->scrollTo")
                || !calls(follow,"alignAfterLayout").contains(app+"LrcVisuals;->snap")
                || !calls(follow,"dispose").contains(app+"LrcVisuals;->dispose"))
            throw new AssertionError("Visual effects must share auto-follow alignment/lifecycle");
        for(String name:new String[]{"focus","browsing","scrollTo","onPreDraw","startMotion","dispose"})
            for(String call:calls(visuals,name))
                if(call.endsWith("->play") || call.endsWith("->pause") || call.endsWith("->seekTo") || call.endsWith("->setItemAnimator") || call.endsWith("->setTextSize"))
                    throw new AssertionError("Subtitle decoration must not affect audio, enlargement or change animators");
        if(!calls(visuals,"canMove").contains("Landroid/animation/ValueAnimator;->areAnimatorsEnabled")
                || !calls(visuals,"dispose").contains("Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener"))
            throw new AssertionError("Visual effects must respect system motion and detach lifecycle");
        if(!calls(adapter,"onBindViewHolder").contains(app+"LrcVisuals;->bind")
                || !calls(visuals,"bind").contains("Landroid/widget/TextView;->setTextSize")
                || !calls(visuals,"bind").contains("Landroid/text/TextPaint;->setFakeBoldText"))
            throw new AssertionError("Native rows must measure the uniform lyric typography before layout");
        if(!calls(visuals,"align").contains("Landroidx/recyclerview/widget/RecyclerView;->scrollBy"))
            throw new AssertionError("Measured row centering must use the real viewport");
        System.out.println("PASS: centered native subtitle binding, continuous viewport scroll, visual lifecycle and no audio/change-animation mutations");
    }
    private static void cloudBridge(ClassDef service,ClassDef binder,ClassDef works,ClassDef navigation,
            ClassDef cloud,ClassDef transport,ClassDef vault,ClassDef localPlayback,ClassDef cloudPlayback,ClassDef cloudCache,ClassDef cloudArt) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(service,"onCreate").contains(app+"BaiduPlayback;->configure")
                || !calls(cloudPlayback,"configure").contains("Lcom/google/android/exoplayer2/ExoPlayer$Builder;->setMediaSourceFactory"))
            throw new AssertionError("Cloud files must enter the original ExoPlayer via a dedicated data source");
        boolean routed=false;
        for(Iterable methods:new Iterable[]{binder.getDirectMethods(),binder.getVirtualMethods()}) for(Object item:methods) {
            Method method=(Method)item;
            if(method.getImplementation()!=null && calls(binder,method.getName()).contains(app+"BaiduPlayback;->isUri")) routed=true;
        }
        if(!routed) throw new AssertionError("Cloud identities must bypass the asmr.one token URL builder");
        if(!calls(works,"setupMoreMenu$lambda$0").contains(app+"PlayerNavigation;->openCloud")
                || !calls(navigation,"openCloud").contains("Landroid/content/Intent;-><init>"))
            throw new AssertionError("Cloud browser needs an explicit caller-preserving menu entry");
        boolean cloudSubtitle=false;
        for(Object item:localPlayback.getDirectMethods()) {
            Method method=(Method)item;
            if(method.getImplementation()!=null && calls(localPlayback,method.getName()).contains(app+"BaiduCloud;->smallFile")) cloudSubtitle=true;
        }
        if(!cloudSubtitle
                || !calls(localPlayback,"ignoreNetworkSubtitle").contains(app+"BaiduCloud;->cloud"))
            throw new AssertionError("Cloud subtitles must use their own source and reject stale server callbacks");
        if(!calls(vault,"seal").contains("Ljavax/crypto/Cipher;->doFinal")
                || !calls(vault,"write").contains("Landroid/util/AtomicFile;->finishWrite")
                || !calls(vault,"key").contains("Ljava/security/KeyStore;->getInstance"))
            throw new AssertionError("Cloud credentials must use authenticated encryption and AndroidKeyStore");
        for(String name:new String[]{"create","build","rows","menu","back"})
            for(String call:calls(cloud,name)) if(call.endsWith("->play") || call.endsWith("->seekTo") || call.endsWith("->pause")
                    || call.endsWith("->deleteDocument")) throw new AssertionError("Browsing cloud pages must not mutate playback or source files");
        if(!calls(transport,"get").contains("Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty")
                && !calls(transport,"setup").contains("Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty"))
            throw new AssertionError("Cloud transport must retain its own request headers");
        if(!calls(cloud,"connected").contains(app+"BaiduApi;->libraryRoot")
                || !calls(cloud,"load").contains(app+"BaiduApi;->withinRoot")
                || !calls(cloud,"rows").contains(app+"BaiduApi;->withinRoot")
                || !calls(cloudCache,"findCover").contains(app+"BaiduCloud;->inScope")
                || !calls(cloudCache,"range").contains(app+"BaiduCloud;->inScope")
                || !calls(cloudArt,"find").contains(app+"LocalWaveArt;->tag"))
            throw new AssertionError("Cloud browsing and artwork must enforce the chosen root and bounded metadata reads");
        System.out.println("PASS: cloud menu, original-player routing, separate subtitle source, encrypted vault and read-only browsing");
        System.out.println("PASS: selected cloud folder boundary and metadata-only cover bridges");
    }
    private static boolean anyCall(ClassDef type,String target) {
        for(Iterable methods:new Iterable[]{type.getDirectMethods(),type.getVirtualMethods()}) for(Object item:methods) {
            Method entry=(Method)item;
            if(entry.getImplementation()!=null && calls(type,entry.getName()).contains(target)) return true;
        }
        return false;
    }
    private static void cloudCoverBridge(ClassDef binder,ClassDef artwork,ClassDef cache) {
        String app="Lcom/zinhao/kikoeru/";
        Set<String> play=calls(binder,"play");
        if(!play.contains("Lorg/json/JSONObject;->getLong") || play.contains("Lorg/json/JSONObject;->getInt")
                || !play.contains(app+"AudioService$CtrlBinder;->setCurrentAlbumId")
                || !play.contains(app+"LocalPlayback;->note"))
            throw new AssertionError("Album change callbacks must retain the full saved 64-bit work ID");
        if(!calls(artwork,"bindTrack").contains(app+"BaiduCloud;->showTrackCover")
                || !calls(cache,"showTrackCover").contains(app+"BaiduApi;->artworkFolders")
                || !calls(cache,"trackCover").contains(app+"BaiduApi;->artworkFolders")
                || !anyCall(cache,app+"BaiduCloud;->selectedCover"))
            throw new AssertionError("Cloud playback artwork must support scoped album and selected-track fallbacks");
        System.out.println("PASS: full-width album IDs and scoped cloud playback artwork fallback");
    }
    private static void uploadBridge(ClassDef library,ClassDef deletion,ClassDef cache,ClassDef media,
            ClassDef upload,ClassDef transfer,ClassDef transport) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(cache,"embedded").contains(app+"BaiduArtMedia;->picture")
                || !calls(media,"picture").contains("Landroid/media/MediaMetadataRetriever;->setDataSource")
                || !calls(media,"picture").contains("Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture")
                || !calls(media,"picture").contains("Landroid/media/MediaMetadataRetriever;->release"))
            throw new AssertionError("M4A artwork must use the released framework metadata reader");
        if(!anyCall(library,app+"BaiduUpload;->prepare") || !anyCall(library,app+"BaiduTransfer;->start")
                || !calls(upload,"execute").contains("Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet")
                || !calls(upload,"execute").contains(app+"BaiduUpload$Cloud;->verify")
                || !calls(transfer,"start").contains(app+"LocalDeletion;->isActive")
                || !calls(deletion,"begin").contains(app+"BaiduTransfer;->running"))
            throw new AssertionError("Upload must be confirmed, verified and separated from deletion");
        if(!calls(transport,"setup").contains("Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects")
                || !calls(transport,"setup").contains("Ljavax/net/ssl/HttpsURLConnection;->setFixedLengthStreamingMode"))
            throw new AssertionError("Upload transport must retain fixed-length and redirect protections");
        for(String call:calls(upload,"execute")) if(call.endsWith("->deleteDocument") || call.endsWith("->delete"))
            throw new AssertionError("Copy upload must not delete source files");
        System.out.println("PASS: M4A adapter, confirmed copy upload, deletion exclusion and fixed-length HTTPS bridges");
    }
    private static void shellBridge(ClassDef works,ClassDef history,ClassDef library,ClassDef cloud,
            ClassDef shell,ClassDef home,ClassDef mode,ClassDef glassNavigation) {
        String app="Lcom/zinhao/kikoeru/";
        if(!calls(works,"onCreate").contains(app+"AppShell;->installHome")
                || !calls(works,"onResume").contains(app+"AppShell;->homeResume")
                || !calls(works,"onNewIntent").contains(app+"AppShell;->homeIntent")
                || !calls(works,"onActivityResult").contains(app+"AppShell;->homeResult")
                || !calls(works,"setupListener$lambda$3").contains(app+"AppShell;->homeBack")
                || !calls(works,"updateBottomSelection").contains(app+"AppShell;->homeSelection")
                || !calls(works,"onDestroy").contains(app+"AppShell;->removeHome"))
            throw new AssertionError("Online screen must preserve its navigation hooks");
        for(ClassDef screen:new ClassDef[]{library,cloud}) {
            Set<String> build=calls(screen,"build");
            if(!build.contains(app+"AppShell;->sources") || !build.contains(app+"AppShell;->navigation")
                    || !build.contains(app+"AppShell;->dock"))
                throw new AssertionError("Each library requires source tabs and the shared dock");
        }
        if(!calls(history,"onCreate").contains(app+"AppShell;->installHistory")
                || !calls(history,"onResume").contains(app+"AppShell;->resumeHistory")
                || !calls(history,"onDestroy").contains(app+"AppShell;->destroyHistory"))
            throw new AssertionError("History dock must follow the activity lifecycle");
        if(!anyCall(glassNavigation,app+"ShellState;->indicator"))
            throw new AssertionError("Navigation animation must remain bounded");
        Set<String> change=calls(home,"switchSource");
        if(!change.contains(app+"LocalLibraryController;->create") || !change.contains(app+"BaiduCloudController;->create")
                || change.stream().anyMatch(call->call.endsWith("->startActivity"))
                || !calls(home,"install").contains(app+"AppShell;->styleMini")
                || !calls(mode,"onTouchEvent").contains(app+"AppShell$Home;->switchSource")
                || !calls(shell,"popupDismiss").contains(app+"ShellState;->popupWidth"))
            throw new AssertionError("Source modes must share one host/dock and use bounded menus");
        if(!calls(cloud,"back").contains(app+"BaiduApi;->parent")
                || !calls(cloud,"back").contains(app+"BaiduApi;->withinRoot"))
            throw new AssertionError("Cloud Back must remain within the selected root");
        for(ClassDef panel:new ClassDef[]{library,cloud})
            for(String call:calls(panel,"refreshPalette"))
                if(call.contains("BaiduCloud;->api") || call.contains("LocalDocuments;->load")
                        || call.endsWith("->play") || call.endsWith("->seekTo"))
                    throw new AssertionError("Recoloring must not reload data or alter playback");
        for(String method:new String[]{"openSource","openHistory","styleMini"})
            for(String call:calls(shell,method))
                if(call.endsWith("->play") || call.endsWith("->pause") || call.endsWith("->seekTo")
                        || call.endsWith("->deleteDocument"))
                    throw new AssertionError("Navigation and styling must not mutate playback or files");
        System.out.println("PASS: shared in-place source host, folder/result bridges, bounded menus and read-only navigation");
    }
    public static void main(String[] args) throws Exception {
        MultiDexContainer container = DexFileFactory.loadDexContainer(new File(args[0]), null);
        Set<String> types = new HashSet<>();
        int helpers = 0;
        ClassDef player=null, follow=null, works=null, callback=null, api=null,
                action=null, put=null, catalog=null, adapter=null, binder=null,
                selection=null, library=null,libraryHost=null, deletion=null, tree=null, navigation=null, mini=null, queue=null,more=null,favorites=null,visuals=null,
                service=null,cloud=null,transport=null,vault=null,localPlayback=null,cloudPlayback=null,cloudCache=null,cloudArt=null,
                cloudMedia=null,uploader=null,transfer=null,uploadTransport=null,artwork=null,
                history=null,shell=null,home=null,mode=null,glassNavigation=null;
        for (Object name : container.getDexEntryNames()) {
            String entry = (String)name;
            DexBackedDexFile dex = container.getEntry(entry).getDexFile();
            if (dex.methodCount > 65535 || dex.fieldCount > 65535 || dex.typeCount > 65535)
                throw new AssertionError("DEX reference limit exceeded: " + entry);
            System.out.println(entry + ": " + dex.methodCount + " method references");
            for (Object item : dex.classSection) {
                ClassDef definition = (ClassDef)item;
                String type = definition.getType();
                if(type.equals("Lcom/zinhao/kikoeru/AudioPlayerActivity;")) player=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LrcAutoFollow;")) follow=definition;
                if(type.equals("Lcom/zinhao/kikoeru/WorksActivity;")) works=definition;
                if(type.equals("Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;")) callback=definition;
                if(type.equals("Lcom/zinhao/kikoeru/Api;")) api=definition;
                if(type.equals("Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;")) action=definition;
                if(type.equals("Lcom/zinhao/kikoeru/Api$okhttpPutJsonObject$1;")) put=definition;
                if(type.equals("Lcom/zinhao/kikoeru/CatalogState;")) catalog=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LrcAdapter;")) adapter=definition;
                if(type.equals("Lcom/zinhao/kikoeru/AudioService$CtrlBinder;")) binder=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LrcSelection;")) selection=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LocalLibraryActivity;")) libraryHost=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LocalLibraryController;")) library=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LocalDeletion;")) deletion=definition;
                if(type.equals("Lcom/zinhao/kikoeru/WorkTreeActivity;")) tree=definition;
                if(type.equals("Lcom/zinhao/kikoeru/PlayerNavigation;")) navigation=definition;
                if(type.equals("Lcom/zinhao/kikoeru/MiniPlayer;")) mini=definition;
                if(type.equals("Lcom/zinhao/kikoeru/PlaybackQueueActivity;")) queue=definition;
                if(type.equals("Lcom/zinhao/kikoeru/MoreActivity;")) more=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LocalFavorites;")) favorites=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LrcVisuals;")) visuals=definition;
                if(type.equals("Lcom/zinhao/kikoeru/AudioService;")) service=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduCloudController;")) cloud=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduCloud;")) cloudCache=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduArt;")) cloudArt=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduArtMedia;")) cloudMedia=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduUpload;")) uploader=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduTransfer;")) transfer=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduUploadHttp;")) uploadTransport=definition;
                if(type.equals("Lcom/zinhao/kikoeru/PlayerArtwork;")) artwork=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduHttp;")) transport=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduVault;")) vault=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LocalPlayback;")) localPlayback=definition;
                if(type.equals("Lcom/zinhao/kikoeru/BaiduPlayback;")) cloudPlayback=definition;
                if(type.equals("Lcom/zinhao/kikoeru/LastWatchActivity;")) history=definition;
                if(type.equals("Lcom/zinhao/kikoeru/AppShell;")) shell=definition;
                if(type.equals("Lcom/zinhao/kikoeru/AppShell$Home;")) home=definition;
                if(type.equals("Lcom/zinhao/kikoeru/AppShell$ModeContainer;")) mode=definition;
                if(type.equals("Lcom/zinhao/kikoeru/GlassUi$Navigation;")) glassNavigation=definition;
                if (!types.add(type)) throw new AssertionError("Duplicate shipped class: " + type);
                if (entry.equals("classes3.dex")) {
                    if (!type.matches("Lcom/zinhao/kikoeru/(AppShell|GlassUi|ShellState|BaiduApi|BaiduHttp|BaiduVault|BaiduCloud|BaiduArt|BaiduArtMedia|BaiduUpload|BaiduUploadHttp|BaiduTransfer|BaiduPlayback|BaiduCloudActivity|BaiduCloudController|LrcAutoFollow|LrcSelection|LrcVisuals|PlaybackPosition|PlaybackOptions|TrackResume|LocalFavorites|ThemePalettes|ThemePaletteActivity|LocalIndex|LocalDocuments|LocalPlayback|LocalLibraryActivity|LocalLibraryController|LocalArt|LocalWaveArt|LocalHistory|LocalDeletion|CatalogState|PlayerNavigation|PlayerArtwork|MiniPlayer|PlaybackQueueActivity)(\\$[^;]*)?;"))
                        throw new AssertionError("Unexpected helper dex class: " + type);
                    helpers++;
                }
                if (type.contains("PositionPaletteTest") || type.contains("LrcAutoFollowTest") || type.contains("SystemBarTest") || type.contains("LocalIndexTest") || type.contains("LocalWaveArtTest") || type.contains("LocalHistoryTest") || type.contains("CatalogStateTest") || type.contains("LocalPlayerFixTest") || type.contains("LocalDeletionTest")
                        || type.contains("PlayerArtworkTest") || type.contains("ResumeFavoritesTest") || type.contains("BaiduCloudTest") || type.contains("BaiduArtTest") || type.contains("BaiduArtMediaTest") || type.contains("BaiduUploadTest") || type.contains("LrcVisualsTest") || type.contains("ShellStateTest") || type.contains("FakePlayer") || type.equals("Landroid/media/MediaDataSource;") || type.equals("Landroid/media/MediaMetadataRetriever;") || type.equals("LDeviceSmoke;") || type.equals("LArtworkProbe;"))
                    throw new AssertionError("Test class shipped: " + type);
            }
        }
        if (helpers < 5) throw new AssertionError("Missing helper classes");
        subtitleBridge(player,follow);
        homeStartup(works);
        catalogBridge(works,callback,api,action,put,catalog);
        localFixBridge(player,adapter,binder,selection,library,libraryHost,deletion);
        localUi(library,new File(args[0]));
        playbackUi(player,works,tree,navigation,mini,queue);
        resumeFavorites(binder,more,library,favorites);
        visualBridge(follow,visuals,adapter);
        cloudBridge(service,binder,works,navigation,cloud,transport,vault,localPlayback,cloudPlayback,cloudCache,cloudArt);
        cloudCoverBridge(binder,artwork,cloudCache);
        uploadBridge(library,deletion,cloudCache,cloudMedia,uploader,transfer,uploadTransport);
        shellBridge(works,history,library,cloud,shell,home,mode,glassNavigation);
        System.out.println("PASS: " + helpers + " production helper classes, " + types.size()
                + " unique APK classes; no compile/test classes in helper dex");
    }
}
