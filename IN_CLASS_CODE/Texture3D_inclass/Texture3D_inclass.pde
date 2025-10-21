
float rot = 0;
PImage img;
TextureSphere ts;

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
  ts = new TextureSphere(200,10);
}

void draw() {
  background(0);
  
  pointLight(255,255,255, mouseX, mouseY, 500);
  stroke(255);
  strokeWeight(10);
  point(mouseX, mouseY, 200);
  noStroke();
  
  translate(width/2,height/2);
  rotateY(rot);
  ts.display();
  translate(-width/2,-height/2);
  
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
