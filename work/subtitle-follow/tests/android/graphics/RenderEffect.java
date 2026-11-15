package android.graphics;

public class RenderEffect {
    public static int creations;
    public static boolean fail;
    public final float radius;
    private RenderEffect(float radius) { this.radius=radius; }
    public static RenderEffect createBlurEffect(float x,float y,Shader.TileMode tile) {
        if(fail) throw new IllegalStateException("Unsupported effect");
        if(x<=0 || y<=0) throw new AssertionError("Zero-radius blur must be cleared, not allocated");
        creations++; return new RenderEffect(x);
    }
}
