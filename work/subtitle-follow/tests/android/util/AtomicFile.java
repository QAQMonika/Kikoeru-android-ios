package android.util;

import java.io.*;
import java.nio.file.*;

public class AtomicFile {
    private final File base;
    public static boolean failNext;
    public AtomicFile(File base) { this.base = base; }
    public FileOutputStream startWrite() throws IOException {
        if (failNext) { failNext = false; throw new IOException("Simulated storage failure"); }
        return new FileOutputStream(base.getPath() + ".new");
    }
    public void finishWrite(FileOutputStream stream) throws IOException {
        stream.getFD().sync(); stream.close();
        Files.move(Paths.get(base.getPath() + ".new"), base.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }
    public void failWrite(FileOutputStream stream) {
        try { stream.close(); Files.deleteIfExists(Paths.get(base.getPath() + ".new")); }
        catch (IOException ignored) {}
    }
    public byte[] readFully() throws IOException { return Files.readAllBytes(base.toPath()); }
    public FileInputStream openRead() throws FileNotFoundException { return new FileInputStream(base); }
}
