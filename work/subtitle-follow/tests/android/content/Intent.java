package android.content;

import java.util.HashMap;
import java.util.Map;

public class Intent {
    public static final int FLAG_ACTIVITY_REORDER_TO_FRONT=0x00020000,FLAG_ACTIVITY_SINGLE_TOP=0x20000000;
    private int flags;
    public final Class<?> target;
    private final Map<String,Object> extras=new HashMap<>();
    public Intent(Context context,Class<?> target) { this.target=target; }
    public Intent putExtra(String name,String value) { extras.put(name,value); return this; }
    public Intent addFlags(int flags) { this.flags|=flags; return this; }
    public int getFlags() { return flags; }
    public String getStringExtra(String name) { return (String)extras.get(name); }
}
