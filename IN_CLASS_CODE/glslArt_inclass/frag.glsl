#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform float time;

varying vec2 uv;

float box(vec2 center, float sz) {
    vec2 tl = center - sz * 0.5;
    vec2 br = center + sz * 0.5;
    float inBoxX = step(tl.x, uv.x) - step(br.x, uv.x);
    float inBoxY = step(tl.y, uv.y) - step(br.y, uv.y);
    return inBoxX * inBoxY;
}

float gradient() {
    return smoothstep(0.3,0.7, uv.x);
}

void main() {
    float diff = uv.x - uv.y;
    float s = 1.0 - step(0.01, abs(diff));

    //float d = distance(uv, vec2(0.5));
    //s = step(0.4, d) - step(0.45, d);
    //s = smoothstep(0.41, 0.4, d) -
    //    smoothstep(0.4, 0.39, d);

    //s = box(vec2(0.5), 0.25)
    //    + box(vec2(0.25), 0.1);
    //float s = step(0.5, uv.x);
    //gl_FragColor = vec4(vec3(s + gradient()), 1.0);

    //gl_FragColor = vec4(uv.x, uv.y, 0.0, 1.0);
    //float d = distance(uv, vec2(0.5));
    //vec3 col = mix(vec3(1.0,0.5,0.0), vec3(0.0,0.2,0.8), abs(sin(d*12.0 - time)));
    //gl_FragColor = vec4(col, 1.0);

    vec2 st = fract(uv * 4.0);
    float d = distance(st, vec2(0.5));
    float origDist = distance(uv, vec2(0.5));
    d = d * exp(-origDist * 4.0);
    d = abs(sin(d * 20.0 - time));
    d = 0.2 / d;
    gl_FragColor = vec4(vec3(1.0, 0.7, 0.2) * d, 1.0);
    //gl_FragColor = vec4(st.x, st.y, 0.0, 1.0);

}