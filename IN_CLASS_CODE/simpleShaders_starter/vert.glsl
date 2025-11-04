#define PROCESSING_COLOR_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform vec4 lightPosition;
uniform mat3 normalMatrix;

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

varying vec4 theColor;
varying vec3 wsNormal;
varying vec3 lightDir;

void main() {
    gl_Position = transform * vertex;

    vec3 wsVertex = (modelview * vertex).xyz;
    
    wsNormal = normalize(normalMatrix * normal);
    lightDir = normalize(lightPosition.xyz - wsVertex);

    theColor = color;
}
