package com.zinhao.kikoeru;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.Arrays;
import javax.crypto.*;
import javax.crypto.spec.GCMParameterSpec;
import org.json.JSONObject;

/** No plaintext fallback; keys and refresh tokens stay in this phone's private storage. */
public final class BaiduVault implements BaiduApi.Store {
    private static final byte[] AAD="Kikoeru/Baidu/v1".getBytes(StandardCharsets.US_ASCII);
    private final AtomicFile file;
    private JSONObject cached;
    BaiduVault(Context context) { file=new AtomicFile(new File(context.getNoBackupFilesDir(),"baidu-credentials.v1")); }
    private static SecretKey key() throws Exception {
        KeyStore store=KeyStore.getInstance("AndroidKeyStore"); store.load(null);
        String alias="kikoeru_baidu_v1";
        if(store.containsAlias(alias)) return (SecretKey)store.getKey(alias,null);
        KeyGenerator generator=KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES,"AndroidKeyStore");
        generator.init(new KeyGenParameterSpec.Builder(alias,KeyProperties.PURPOSE_ENCRYPT|KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM).setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE).setKeySize(256).build());
        return generator.generateKey();
    }
    static byte[] seal(SecretKey key,byte[] plain) throws Exception {
        Cipher cipher=Cipher.getInstance("AES/GCM/NoPadding"); cipher.init(Cipher.ENCRYPT_MODE,key); cipher.updateAAD(AAD);
        byte[] iv=cipher.getIV(),body=cipher.doFinal(plain);
        if(iv.length!=12) throw new IOException("\u5bc6\u94a5\u5e93\u8fd4\u56de\u7684\u53c2\u6570\u65e0\u6548");
        byte[] result=new byte[1+12+body.length]; result[0]=1; System.arraycopy(iv,0,result,1,12); System.arraycopy(body,0,result,13,body.length); return result;
    }
    static byte[] unseal(SecretKey key,byte[] data) throws Exception {
        if(data.length<29 || data[0]!=1) throw new IOException("\u52a0\u5bc6\u914d\u7f6e\u65e0\u6548");
        Cipher cipher=Cipher.getInstance("AES/GCM/NoPadding"); cipher.init(Cipher.DECRYPT_MODE,key,new GCMParameterSpec(128,Arrays.copyOfRange(data,1,13)));
        cipher.updateAAD(AAD); return cipher.doFinal(data,13,data.length-13);
    }
    public synchronized JSONObject read() throws Exception {
        if(cached==null) {
            if(!file.getBaseFile().exists() && !new File(file.getBaseFile().toString()+".bak").exists()) cached=new JSONObject();
            else try(InputStream input=file.openRead()) { byte[] plain=unseal(key(),BaiduHttp.read(input,65536));
                try { cached=new JSONObject(new String(plain,StandardCharsets.UTF_8)); } finally { Arrays.fill(plain,(byte)0); } }
        }
        return new JSONObject(cached.toString());
    }
    public synchronized void write(JSONObject value) throws Exception {
        byte[] plain=value.toString().getBytes(StandardCharsets.UTF_8),encrypted;
        try { if(plain.length>60000) throw new IOException("\u914d\u7f6e\u8d85\u8fc7\u4e0a\u9650"); encrypted=seal(key(),plain); }
        finally { Arrays.fill(plain,(byte)0); }
        FileOutputStream output=null;
        try { output=file.startWrite(); output.write(encrypted); file.finishWrite(output); cached=new JSONObject(value.toString()); }
        catch(Exception e) { if(output!=null) file.failWrite(output); throw e; }
    }
}
