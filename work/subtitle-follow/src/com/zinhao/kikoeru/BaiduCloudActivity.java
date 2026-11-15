package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;

/** Compatibility host for existing explicit cloud intents. */
public final class BaiduCloudActivity extends Activity {
    private BaiduCloudController controller;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        controller=new BaiduCloudController(this,false); controller.create(state);
        setContentView(controller.view());
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                |View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
        int page=ThemePalettes.color(ThemePalettes.selected(this),1);
        ThemePalettes.systemBars(getWindow(),page,page,page); controller.view().requestApplyInsets();
        if(Build.VERSION.SDK_INT>=33) getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0,()->controller.back());
    }
    @Override protected void onNewIntent(Intent intent) { super.onNewIntent(intent); setIntent(intent); controller.onNewIntent(intent); }
    @Override public void onBackPressed() { controller.back(); }
    @Override protected void onSaveInstanceState(Bundle state) { controller.onSaveInstanceState(state); super.onSaveInstanceState(state); }
    @Override protected void onStart() { super.onStart(); controller.onStart(); }
    @Override protected void onResume() { super.onResume(); controller.onStart(); }
    @Override protected void onStop() { controller.onStop(); super.onStop(); }
    @Override protected void onDestroy() { controller.onDestroy(); super.onDestroy(); }
}
