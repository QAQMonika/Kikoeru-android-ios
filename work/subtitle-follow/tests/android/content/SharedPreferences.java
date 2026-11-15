package android.content;

import java.util.Map;
import java.util.Set;

public interface SharedPreferences {
    Map<String,?> getAll();
    String getString(String key,String fallback);
    Set<String> getStringSet(String key,Set<String> fallback);
    boolean getBoolean(String key,boolean fallback);
    boolean contains(String key);
    Editor edit();
    interface Editor {
        Editor putString(String key,String value);
        Editor putStringSet(String key,Set<String> value);
        Editor putBoolean(String key,boolean value);
        Editor remove(String key);
        void apply();
    }
}
