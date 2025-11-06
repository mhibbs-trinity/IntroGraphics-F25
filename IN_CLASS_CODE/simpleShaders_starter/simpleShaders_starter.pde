  PShader shade;

void setup() {
  size(500,500,P3D);
  noStroke();
  fill(255);
  
  shade = loadShader("frag.glsl","vert.glsl");
}

void draw() {
  shader(shade);
  background(0);
  
  pointLight(255,255,255, mouseX,mouseY,400);
  
  translate(width/2, height/2);
  sphereDetail(8);
  fill(200,150,25);
  sphere(200);
}
