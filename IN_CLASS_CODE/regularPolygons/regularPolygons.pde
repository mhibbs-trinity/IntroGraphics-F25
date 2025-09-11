
void setup() {
  size(600,600);
  //background(255);
}

void draw() {
  background(255);
  stroke(0);
  fill(200,45,180);
  
  strokeWeight(20);
  strokeJoin(BEVEL);
  
  float step = mouseX / 600.0f * 17 + 3;
  float start = mouseY / 300f;
  beginShape();
  for(float theta=start; theta <= start+TWO_PI; theta += 2*PI/step) {
    vertex(300+200*cos(theta), 300+200*sin(theta)); 
  }
  endShape(CLOSE);
}
