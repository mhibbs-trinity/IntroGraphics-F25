class RunSquare {
  PVector pos;
  PVector dest;
  PVector delta;
  int stepCount = 100;
  PVector step = null;
  float EPSILON = 0.001;
  
  RunSquare(float x, float y) {
    pos = new PVector(x,y);
  }
  
  void display() {
    rect(pos.x, pos.y, 30,30);
    if(mousePressed) {
      dest = new PVector(mouseX, mouseY);
      step = PVector.sub(dest,pos).div(stepCount);
    }
    if(step != null) {
      pos.add(step);
      if(abs(pos.x - dest.x) < EPSILON && abs(pos.y - dest.y) < EPSILON) {
        step = null; 
      }
    }
  }
}
  
