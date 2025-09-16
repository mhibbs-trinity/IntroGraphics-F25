
RunSquare rs = new RunSquare(300,300);
DragCircle ds = new DragCircle(400,400);

void setup() {
  size(600,600);
  
}

float x = 200;
float y = 100;
float sx = 3;
float sy = 3;
boolean white = false;

void mousePressed() {
  white = !white;
}

void draw() {
  if(white) background(255);
  else background(0);

  ds.display();
  
  fill(255);
  
  rs.display();
  
  ellipse(x,y, 50,50);
  if(x > width-25 || x < 25) {
    sx *= -1;
  }
  if(y > height-25 || y < 25) {
    sy *= -1;
  }

  x += sx;
  y += sy;

}
