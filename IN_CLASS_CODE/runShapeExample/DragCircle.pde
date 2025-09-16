class DragCircle {
  float x,y;
  float dx,dy;
  boolean hover = false;
  boolean drag = false;
  boolean first = false;
  boolean pressed = false;
  
  DragCircle(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void display() {
    if(!mousePressed) {
      drag = false;
      first = false;
      pressed = false;
    } else {
      if(pressed) {
        first = false;
      } else {
        pressed = true;
        first = true;
      }
    }
    
    ellipse(x,y, 50,50);
    
    if(hover) fill(128);
    else fill(255);
    
    if(dist(x,y, mouseX,mouseY) <= 25) {
      hover = true;
    } else hover = false;
    
    if(drag) {
      x = mouseX + dx;
      y = mouseY + dy;
    } else if(hover && first) {
      drag = true;
      dx = x - mouseX;
      dy = y - mouseY;
    } else drag = false;
    
  }
  
}
