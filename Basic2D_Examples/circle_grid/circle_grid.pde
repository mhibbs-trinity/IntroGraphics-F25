
float r = 30;

void setup() {
  size(600,600);
  background(255);
  noSmooth();
}


float open = 0;
float delta = PI/128;
float max = PI/4;

void draw() {
  background(0);  
  noStroke();
  for(float x=r; x<width; x+=r*2) {
    for(float y=r; y<height; y+=r*2) {
      fill(map(x,0,width,0,255), map(y,0,height,0,255), 0);
      //ellipse(x,y,r*2,r*2);
      arc(x,y,r*2,r*2, open, TWO_PI-open);
    }
  }
  if(open > max || open < 0) {
    delta *= -1;
  }
  open += delta;
}
