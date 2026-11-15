package android.view;

import java.util.*;

public class ViewGroup extends View implements ViewParent {
    public boolean clipToPadding=true;
    public boolean getClipToPadding() { return clipToPadding; }
    public void setClipToPadding(boolean value) { clipToPadding=value; }
    public final List<View> children=new ArrayList<>();
    public int getChildCount() { return children.size(); }
    public View getChildAt(int index) { return children.get(index); }
    public void addView(View view) { children.add(view); view.parent=this; }
    public void removeView(View view) { children.remove(view); view.parent=null; }
    @Override public <T extends View> T findViewById(int id) {
        T found=super.findViewById(id); if(found!=null) return found;
        for(View child:children) { found=child.findViewById(id); if(found!=null) return found; }
        return null;
    }
}
