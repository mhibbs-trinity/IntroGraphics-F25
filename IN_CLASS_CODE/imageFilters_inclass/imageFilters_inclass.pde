PImage img;
PImage copy;

void settings() {
  img = loadImage("SundayInPark.jpg");
  //img = loadImage("alamo.png");
  //img = loadImage("balloons.png");
  //img = loadImage("city.png");
  //img = loadImage("MTower.jpg");
  //img = loadImage("orion.png");
  //img = loadImage("PearlEarring.jpg");
  //img = loadImage("riverwalk.png");
  //img = loadImage("robotBoy_run.jpg");
  copy = img;
  size(img.width,img.height);
}

void setup() {

}


float bound(float num) {
  if(num < 0) return 0;
  else if(num > 255) return 255;
  else return num;
}


void draw() {
  background(0);
  
  if(keyPressed) {
    image(img, 0,0);
  } else {
    image(copy,0,0);
  }
  
  
}
