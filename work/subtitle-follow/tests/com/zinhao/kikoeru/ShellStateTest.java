package com.zinhao.kikoeru;

public final class ShellStateTest {
    private static int checks;
    private static void check(boolean ok,String message) {
        checks++;
        if(!ok) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        for(int type=480;type<510;type++)
            check(ShellState.catalogTab(type)==(type>=492 && type<=496?1:0),"Catalog type "+type);
        check(ShellState.sourceAt(-20,3,100)==0,"Left edge is clamped");
        check(ShellState.sourceAt(102,3,100)==0,"First source");
        check(ShellState.sourceAt(103,3,100)==1,"Second source boundary");
        check(ShellState.sourceAt(203,3,100)==2,"Third source boundary");
        check(ShellState.sourceAt(900,3,100)==2,"Right edge is clamped");
        check(ShellState.sourceAt(Float.NaN,3,100)==0,"Invalid position stays bounded");
        check(ShellState.sourceAt(2,3,0)==0,"Unmeasured control stays bounded");
        check(ShellState.indicator(0,300,0,100)==0,"Indicator starts correctly");
        check(ShellState.indicator(0,300,1,100)==300,"Indicator ends correctly");
        check(ShellState.indicator(0,300,1.2f,100)==300,"Spring cannot leave capsule");
        check(ShellState.indicator(300,0,1.2f,100)==0,"Reverse spring cannot leave capsule");
        check(ShellState.swipeTarget(0,-20)==1,"Online swipes to local");
        check(ShellState.swipeTarget(1,-20)==2,"Local swipes to cloud");
        check(ShellState.swipeTarget(1,20)==0,"Local swipes to online");
        check(ShellState.swipeTarget(0,20)==0,"Online cannot move beyond left edge");
        check(ShellState.swipeTarget(2,-20)==2,"Cloud cannot move beyond right edge");
        check(ShellState.swipeTarget(1,Float.NaN)==1,"Invalid swipe does not switch");
        check(!ShellState.horizontalGesture(5,0,10),"Tap does not become a swipe");
        check(!ShellState.horizontalGesture(15,20,10),"Vertical list scrolling remains vertical");
        check(ShellState.horizontalGesture(-80,10,10),"Horizontal gesture is recognized");
        check(!ShellState.commitSwipe(0,1,-12,300,0,1),"Short drag returns to its mode");
        check(ShellState.commitSwipe(0,1,-80,300,0,1),"Long drag switches mode");
        check(ShellState.commitSwipe(1,0,40,300,900,1),"Fast drag switches mode");
        check(!ShellState.commitSwipe(1,0,-80,300,-900,1),"Opposite drag cannot select the target");
        check(!ShellState.commitSwipe(1,1,80,300,900,1),"Edge drag cannot leave the library");
        check(ShellState.popupWidth(400,220,24)==220,"Popup remains readable at normal width");
        check(ShellState.popupWidth(160,220,24)==136,"Popup fits a narrow screen");
        check(ShellState.popupWidth(20,220,24)==1,"Popup dimensions remain valid");
        check(!ShellState.folderBackVisible(true,false),"Embedded library root has no Back arrow");
        check(ShellState.folderBackVisible(true,true),"Embedded folders expose Back");
        check(ShellState.folderBackVisible(false,false),"Legacy standalone root keeps Back");
        check(ShellState.folderBackVisible(false,true),"Legacy standalone folders keep Back");
        check(ShellState.visibleToolbarItem(0,0x9) && ShellState.visibleToolbarItem(0,0x10),"Online toolbar keeps layout and sort actions");
        check(!ShellState.visibleToolbarItem(0,0x17),"Duplicate top search icon is hidden in online toolbar");
        check(!ShellState.visibleToolbarItem(1,0x9) && !ShellState.visibleToolbarItem(2,0x10),"Non-online sources hide online toolbar actions");
        check(!ShellState.embeddedTitleVisible(true,false),"Embedded root hides duplicate sub-header title");
        check(ShellState.embeddedTitleVisible(true,true) && ShellState.embeddedTitleVisible(false,false),"Subfolders and standalone pages show header title");
        check(ShellState.glassBlurDp(true)>ShellState.glassBlurDp(false),"Liquid glass uses deeper optical blur than frosted glass");
        check(ShellState.glassFillColor(false,true,true)!=ShellState.glassFillColor(false,true,false),"Liquid and frosted glass use distinct base tints");
        check(ShellState.largeTitleCollapse(0,100)==0f,"Zero scroll keeps large title expanded");
        check(ShellState.largeTitleCollapse(150,100)==1f,"Full scroll collapses large title");
        check(ShellState.rubberBand(80,200)>0f && ShellState.rubberBand(80,200)<80f,"Rubber-band overscroll dampens displacement");
        check(ShellState.commitSwipeBack(140,360,100,1) && ShellState.commitSwipeBack(50,360,900,1),"Interactive edge swipe-back commits on distance or velocity");
        check(!ShellState.commitSwipeBack(20,360,50,1) && !ShellState.commitSwipeBack(160,360,-200,1),"Canceled or reverse edge swipe-back does not pop");
        check("62,978 \u90e8".equals(ShellState.extractWorkCount("Kikoeru (62978)")),"Extracts formatted work count from toolbar title");
        check("\u4f5c\u54c1".equals(ShellState.displayCatalogTitle("Kikoeru (62978)",0,0x1eb)),"Default online title maps to iOS large title");
        System.out.println("PASS: "+checks+" shell navigation checks");
    }
}
