#define PROCESSING_TEXTURE_SHADER
varying vec2 vertTexCoord;
void main() {
  gl_FragColor = vec4(vertTexCoord, 0.0, 1.0);
}
/*
uniform float time;
uniform float mouseX;
uniform float mouseY;

void colorByTexCoord() {
  gl_FragColor = vec4(vertTexCoord, 0.0, 1.0);
}

void colorByFractTexCoord() {
  gl_FragColor = vec4(fract(vertTexCoord * 4), 0.0, 1.0);
}

void colorByDistanceFromOrigin() {
  float dist = length(fract(vertTexCoord * 4)- vec2(0.5, 0.5));
  gl_FragColor = vec4(dist, dist, dist, 1.0);
}

void colorBySinDistToOrigin() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  //d = sin(d * 10);
  d = abs(sin(d * 10));
  gl_FragColor = vec4(d, d, d, 1.0);
}

void colorBySinDistToOriginWithTime() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  d = abs(sin(d * 10 * mouseX + time));
  gl_FragColor = vec4(d, d, d, 1.0);
}

void colorBySinDistToOriginWithTimeAndMouse() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  d = abs(sin(d * 10 * mouseX + time));
  gl_FragColor = vec4(d, d, d, 1.0);
}

void colorBySinDistToOriginWithTimeAndMouseShowNeon() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  d = abs(sin(d * 10 + time));
  if(mouseX < 0.5) {
    d = d;
  } else {
    d = 0.05 / d;
  }
  gl_FragColor = vec4(d, d, d, 1.0);
}

void colorWithNeon() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  d = abs(sin(d * 10 + time));
  d = 0.05 / d;
  gl_FragColor = vec4(d, d, d, 1.0);
}

void colorWithNeonSpread() {
  float od = length(vertTexCoord - vec2(0.5, 0.5));
  float d = distance(fract(vertTexCoord * 4), vec2(0.5, 0.5));
  d = d * exp(-od * 4);
  d = abs(sin(d * 10 + time));
  d = 0.05 / d;
  gl_FragColor = vec4(d, d, d, 1.0);
}


void main() {
  //colorByTexCoord();
  //colorByFractTexCoord();
  //colorByDistanceFromOrigin();
  //colorBySinDistToOrigin();
  //colorBySinDistToOriginWithTime();
  //colorBySinDistToOriginWithTimeAndMouse();
  //colorBySinDistToOriginWithTimeAndMouseShowNeon();
  //colorWithNeon();
  colorWithNeonSpread();
}*/