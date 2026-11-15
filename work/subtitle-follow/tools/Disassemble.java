import java.io.File;
import java.nio.file.Files;
import com.android.tools.smali.baksmali.Baksmali;
import com.android.tools.smali.baksmali.BaksmaliOptions;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;

public final class Disassemble {
    public static void main(String[] args) throws Exception {
        BaksmaliOptions options = new BaksmaliOptions();
        options.localsDirective = true;
        options.debugInfo = true;
        Baksmali.disassembleDexFile(new DexBackedDexFile(null,
                Files.readAllBytes(new File(args[0]).toPath()), 0),
                new File(args[1]), 1, options);
    }
}
