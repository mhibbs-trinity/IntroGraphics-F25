float r = 100;

void setup() {
size(600,600);

}


void draw() {
  background(255);
stroke(0);
strokeWeight(3);
  for(float x=0; x<width; x++) {
    for(float y=0; y<height; y++) {
      if(x*x + y*y == r*r) {
        point(x,y);
      }
    }
  }
  
  for(float theta=0; theta < 2*PI; theta += PI/128) {
    float x = r * cos(theta) + 300;
    float y = r * sin(theta) * pow(sin(theta/2), map(mouseX,0,width,0,10)) + 300;
    point(x,y);
  }
}
