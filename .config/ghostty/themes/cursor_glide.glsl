// the cursor glides between cells instead of jumping.
// Unlike a trail shader, this one is the focused cursor, so it
// requires ghostty's own cursor to be hidden:

// --- CONFIGURATION ---
const float DURATION   = 0.20;  // seconds for one glide
const float BG_OPACITY = 0.80;  // your background-opacity (text-under-cursor mask threshold)
const float AA         = 3.0;   // edge antialiasing in pixels

// sRGB -> linear: uniforms arrive as sRGB, iChannel0 and the output are linear.
vec3 sRGBToLinear(vec3 c) {
    return mix(c / 12.92, pow((c + 0.055) / 1.055, vec3(2.4)), step(vec3(0.04045), c));
}

// EaseOutCubic — swap for any of the curves in cursor_sweep.glsl.
float ease(float x) {
    return 1.0 - pow(1.0 - x, 3.0);
}

float sdfRect(vec2 p, vec2 center, vec2 halfSize) {
    vec2 d = abs(p - center) - halfSize;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

// iCurrentCursor/iPreviousCursor are (left, top-edge, width, height) in
// pixels with shadertoy's y-up convention: the rect spans [y - h, y].
vec2 rectCenter(vec4 r) {
    return vec2(r.x + r.z * 0.5, r.y - r.w * 0.5);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 tex = texture(iChannel0, fragCoord / iResolution.xy);
    fragColor = tex;

    if (iCursorVisible == 0 || iFocus == 0) return;
    if (iCurrentCursorStyle == CURSORSTYLE_BLOCK_HOLLOW ||
        iCurrentCursorStyle == CURSORSTYLE_LOCK) return;

    vec4 cur  = iCurrentCursor;
    vec4 prev = iPreviousCursor;
    // An all-zero previous cursor is the first frame after launch; don't
    // glide in from the window corner.
    if (dot(prev.zw, prev.zw) == 0.0) prev = cur;

    float t = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    float e = ease(t);

    vec2 center   = mix(rectCenter(prev), rectCenter(cur), e);
    vec2 halfSize = mix(prev.zw, cur.zw, e) * 0.5;
    vec3 rgb      = sRGBToLinear(mix(iPreviousCursorColor.rgb, iCurrentCursorColor.rgb, e));
    vec4 cursor   = vec4(rgb, 1.0);

    float coverage = 1.0 - smoothstep(0.0, AA, sdfRect(fragCoord, center, halfSize));
    if (coverage <= 0.0) return;

    // Keep the destination cell's glyph on top of the block (see header).
    float inTarget = 1.0 - step(0.0, sdfRect(fragCoord, rectCenter(cur), cur.zw * 0.5));
    float text     = smoothstep(min(BG_OPACITY, 0.999), 1.0, tex.a) * inTarget;
    vec4 cursorPixel = mix(cursor, tex, text);

    fragColor = mix(tex, cursorPixel, coverage);
}
