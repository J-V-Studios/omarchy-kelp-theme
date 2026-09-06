precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

// Fast pseudo-random function
float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

// Render dynamic, non-uniform bubble cell layer with aspect-ratio correction
float renderBubbleLayer(vec2 uv, float t, float scaleY, float speedMult, float seed) {
    // Aspect-ratio corrected grid space (spans entire width cleanly)
    vec2 st = vec2(uv.x * (scaleY * 2.0), uv.y * scaleY);
    
    // Non-linear vertical movement per column to break straight lines
    float colHash = hash21(vec2(floor(st.x) + seed, 1.0));
    st.y += t * (0.8 + colHash * 0.8) * speedMult;

    vec2 id = floor(st);
    vec2 gv = fract(st) - 0.5;

    // Cell random seed
    float n = hash21(id + seed);

    // Skip 60% of cells for organic spacing and clusters across the whole screen
    if (n < 0.6) return 0.0;

    // Organic drift wobble inside each cell
    vec2 offset = vec2(
        sin(t * 2.5 + n * 6.28) * 0.25,
        cos(t * 2.0 + n * 3.14) * 0.25
    );

    float dist = length(gv - offset);
    
    // Micro-bubble radius range
    float radius = 0.012 + fract(n * 13.0) * 0.018;
    
    // Crisp bubble ring highlight
    return smoothstep(0.01, 0.0, abs(dist - radius));
}

void main() {
    // Bound time to 120 seconds to prevent GLSL float precision degradation
    float t = mod(time, 120.0);
    vec2 uv = v_texcoord;

    // Micro wave distortion (keeps text sharp while giving fluid ambient movement)
    float waveX = sin(uv.y * 12.0 + t * 1.2) * 0.0010;
    float waveY = cos(uv.x * 10.0 + t * 1.0) * 0.0008;
    vec2 distortedUV = uv + vec2(waveX, waveY);

    // Sample background texture
    vec4 color = texture2D(tex, distortedUV);

    // Subtle kelp water tint
    color.rgb *= vec3(0.92, 1.03, 1.01);

    // Light caustics overlay
    float caustic = sin(uv.x * 15.0 + t) * cos(uv.y * 15.0 + t);
    color.rgb += vec3(0.012, 0.03, 0.02) * max(0.0, caustic);

    // Combine two offset bubble layers spanning the full aspect ratio
    float bubbles = 0.0;
    
    // Fast, small micro-bubbles
    bubbles += renderBubbleLayer(uv, t, 18.0, 1.2, 0.0);
    
    // Slower, slightly larger background bubbles
    bubbles += renderBubbleLayer(uv, t, 12.0, 0.7, 42.0);

    // Edge fading near top and bottom
    float fade = smoothstep(1.0, 0.88, uv.y) * smoothstep(0.0, 0.12, uv.y);

    // Add soft cyan/white highlight
    color.rgb += vec3(0.7, 0.95, 0.85) * clamp(bubbles, 0.0, 1.0) * fade * 0.6;

    gl_FragColor = color;
}