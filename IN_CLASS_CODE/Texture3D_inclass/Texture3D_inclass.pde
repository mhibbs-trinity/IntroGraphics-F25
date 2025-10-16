
float rot = 0;
PImage img;

void setup() {
  size(500,500,P3D);
  //img = loadImage("earth.jpg");
  //img = loadImage("earth_lights_lrg.jpg");
  //img = loadImage("glass copy.png");
  //img = loadImage("jupiter.jpg");
  //img = loadImage("grid.png");
  //img = loadImage("timon.png");
  //img = loadImage("SundayInPark.jpg");
  img = loadImage("raft.png");
}

void draw() {
  background(0);
  
  translate(100,100);
  rotateY(rot);
  beginShape(QUAD);
  texture(img);
  vertex(0,0,0, 0,0);
  vertex(300,0,0, img.width,0);
  vertex(300,300,0, img.width,img.height);
  vertex(0,300,0, 0,img.height);
  endShape();
  
}

void mouseDragged() {
  float diff = mouseX - pmouseX;
  rot += diff/width;
}
