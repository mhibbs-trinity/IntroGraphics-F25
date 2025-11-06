  PShader shade;

void setup() {
  size(500,500,P3D);
  noStroke();
  fill(255);
  
  shade = loadShader("colorfrag.glsl", "colorvert.glsl");
}

void draw() {
  shader(shade);
  background(0);
  
  translate(width/2, height/2);
  sphereDetail(8);
  fill(100,150,25);
  sphere(200);
}
