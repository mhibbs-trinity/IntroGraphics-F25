

PShader shade;
PImage img = createImage(1,1,RGB);
float t = 0;

float yRot = 0;

void setup() {
  size(600,600,P3D);
  //shade = loadShader("frag.glsl","vert.glsl");
  //shade = loadShader("frag_plot.glsl","vert.glsl");
  //shade = loadShader("frag_pattern.glsl","vert.glsl");
  shade = loadShader("frag_flare.glsl","vert.glsl");
  shader(shade);
}

void draw() {
  rotateY(yRot);
  
  shade.set("u_resolution", float(width), float(height));
  shade.set("u_mouse", float(mouseX), float(mouseY));
  shade.set("u_time", millis() / 1000f);
  
  shade.set("time", t);
  shade.set("mouseX", map(mouseX, 0,width, 0,1));
  shade.set("mouseY", map(mouseY, 0,height, 0,1));
  t += 0.01;
  
  background(0);
  beginShape(QUADS);
  texture(img);
  vertex(0,         0,0, 0,0);
  vertex(width,     0,0, 1,0);
  vertex(width,height,0, 1,1);
  vertex(0,    height,0, 0,1);
  endShape();
  
}

void mouseDragged() {
  float dx = pmouseX - mouseX;
  if(abs(dx) > 0) {
    yRot += dx / width;
  }
}
