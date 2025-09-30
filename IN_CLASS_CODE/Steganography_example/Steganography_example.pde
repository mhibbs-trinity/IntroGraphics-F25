PImage img;
PImage copy;


void settings() {
  //img = loadImage("SundayInPark.jpg");
  //img = loadImage("alamo.png");
  //img = loadImage("balloons.png");
  //img = loadImage("city.png");
  //img = loadImage("MTower.jpg");
  //img = loadImage("orion.png");
  //img = loadImage("PearlEarring.jpg");
  //img = loadImage("riverwalk.png");
  //img = loadImage("timon.png");
  img = loadImage("raft.png");
  //img = loadImage("camera.png");
  //gimg = loadImage("green_bike.jpg");
  //img = loadImage("robotBoy_run.jpg");
  size(img.width,img.height);
}

int offset = 32;

void setup() {
  copy = img;
}

void draw() {
  background(0);
  if(keyPressed) {
    image(copy, 0,0);
  } else {
    image(img,0,0);
  }  
}

