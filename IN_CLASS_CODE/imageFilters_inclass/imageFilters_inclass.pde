PImage img;
PImage copy;

void settings() {
  //img = loadImage("SundayInPark.jpg");
  img = loadImage("alamo.png");
  //img = loadImage("balloons.png");
  //img = loadImage("city.png");
  //img = loadImage("MTower.jpg");
  //img = loadImage("orion.png");
  //img = loadImage("PearlEarring.jpg");
  //img = loadImage("riverwalk.png");
  //img = loadImage("robotBoy_run.jpg");
  size(img.width,img.height);
}

void setup() {
  copy = simpleEdge(img);
}

PImage simpleEdge(PImage img) {
  img.loadPixels();
  PImage modImg = createImage(img.width,img.height,RGB);
  modImg.loadPixels();
  for(int x=1; x<img.width-1; x++) {
    for(int y=1; y<img.height-1; y++) {
      color mid = img.pixels[y*img.width + x];
      color lr = img.pixels[(y+1)*img.width + x+1];
      if(brightness(mid) - brightness(lr) > 20) {
        modImg.pixels[y*img.width + x] = color(255);
      }
    }
  }
  modImg.updatePixels();
  return modImg;
}

PImage simpleBlur(PImage img) {
  img.loadPixels();
  PImage modImg = createImage(img.width,img.height,RGB);
  modImg.loadPixels();
  for(int x=1; x<img.width-1; x++) {
    for(int y=1; y<img.height-1; y++) {
      color mid = img.pixels[y*img.width + x];
      color left = img.pixels[y*img.width + x-1];
      color right = img.pixels[y*img.width + x+1];
      color up = img.pixels[(y-1)*img.width + x];
      color down = img.pixels[(y+1)*img.width + x];
      
      modImg.pixels[y*img.width + x] = color(
        (red(mid) + red(left) + red(right) + red(up) + red(down)) / 5,
        (green(mid) + green(left) + green(right) + green(up) + green(down)) / 5,
        (blue(mid) + blue(left) + blue(right) + blue(up) + blue(down)) / 5); 
    }
  }
  modImg.updatePixels();
  return modImg;
}


PImage spotlight(PImage img) {
  PImage copy = createImage(img.width,img.height,RGB);
  img.loadPixels();
  copy.loadPixels();
  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      copy.pixels[y*width + x] = lerpColor(img.pixels[y*width+x], color(0), map(dist(x,y, mouseX,mouseY), 0,200, 0,1));
    }
  }
  copy.updatePixels();
  return copy;
}


PImage tintRed(PImage img) {
  PImage copy = createImage(img.width,img.height,RGB);
  img.loadPixels();
  copy.loadPixels();
  for(int i=0; i<img.pixels.length; i++) {
    color c = (color)img.pixels[i];
    //float avg = (red(c) + blue(c) + green(c)) / 3.0;
    copy.pixels[i] = color(green(c),red(c),green(c));//avg,avg,avg);
  }
  copy.updatePixels();
  return copy;
}

PImage grayScale(PImage img) {
  PImage copy = createImage(img.width,img.height,RGB);
  img.loadPixels();
  copy.loadPixels();
  for(int i=0; i<img.pixels.length; i++) {
    color c = (color)img.pixels[i];
    float avg = (red(c) + blue(c) + green(c)) / 3.0;
    copy.pixels[i] = color(brightness(c));//avg,avg,avg);
  }
  copy.updatePixels();
  return copy;
}

float bound(float num) {
  if(num < 0) return 0;
  else if(num > 255) return 255;
  else return num;
}


void randomCircles(PImage img) {
  int x = int(random(width));
  int y = int(random(height));
  img.loadPixels();
  color c = img.pixels[y*width + x];
  fill(c);
  noStroke();
  ellipse(x,y, 20,20);
}

void draw() {
  background(0);
  //for(int i=0; i<50; i++)
  //  randomCircles(img);
  
  //copy = spotlight(img);
  if(keyPressed) {
    image(img, 0,0);
  } else {
    image(copy,0,0);
  }
}
