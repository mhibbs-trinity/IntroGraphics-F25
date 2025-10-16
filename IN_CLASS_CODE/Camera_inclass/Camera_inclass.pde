
float rotAmt = 0;

void setup() {
  size(600,600, P3D);
} 

PVector eye = new PVector(0,0,500); // camera position - centered on the window, 500 pixels "away"
PVector center = new PVector(0,0,0);
PVector up = new PVector(0,1,0);

void draw() {
  background(0);
  rotAmt += 0.01;
  
  translate(width/2, height/2);
  rotateY(rotAmt);
  
  translate(-width/4, -height/4);
  box(100);
  translate(width/4, height/4);
  sphere(100);
  translate(width/4, height/4);
  box(100);


}

void mouseDragged() {
  
}
