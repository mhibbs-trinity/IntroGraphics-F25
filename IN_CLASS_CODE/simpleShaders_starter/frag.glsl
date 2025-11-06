#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 theColor;
varying vec3 wsNormal;
varying vec3 lightDir;

void main() {
    vec3 norm = normalize(wsNormal);
    vec3 litDir = normalize(lightDir);
    float intensity = dot(norm, litDir);
    gl_FragColor = theColor * vec4(vec3(intensity),1.0);
}