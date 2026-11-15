package android.app;

import android.content.Context;
import android.content.Intent;
import java.util.ArrayList;
import java.util.List;

public class Activity extends Context {
    public boolean finishing, destroyed;
    public final List<Intent> started=new ArrayList<>();
    private Intent intent;
    public Intent getIntent() { return intent; }
    public void setIntent(Intent intent) { this.intent=intent; }
    public void startActivity(Intent intent) { started.add(intent); }
    public boolean isFinishing() { return finishing; }
    public boolean isDestroyed() { return destroyed; }
}
