
void setup() {
  size(600,600, P3D);
}

float rotAmt = 0;
PVector A = new PVector(300,300, 0);
PVector B = new PVector(200,200,-100);
PVector C = new PVector(400,200,-100);
PVector D = new PVector(400,400,-100);
PVector E = new PVector(200,400,-100);

void doVertex(PVector v) {
  vertex(v.x, v.y, v.z);
}
void triangleVertices(PVector v1, PVector v2, PVector v3) {
  doVertex(v1);
  doVertex(v2);
  doVertex(v3);
}

void draw() {
  background(0);
  translate(width/2, 0);
  rotateY(rotAmt);
  translate(-width/2, 0);

  fill(255);
  noStroke();

  //lights();
  pointLight(255,255,255, mouseX, mouseY, 200);
  stroke(255);
  strokeWeight(10);
  point(mouseX, mouseY, 200);
  noStroke();

  pushMatrix();
  translate(150,150);
  sphere(75);
  popMatrix();

  pushMatrix();
  translate(450,450);
  box(75);
  popMatrix();
  
  /*
  beginShape(TRIANGLE_FAN);
  doVertex(A);
  doVertex(B);
  doVertex(C);
  doVertex(D);
  doVertex(E);
  doVertex(B);
  endShape();
  */

  
  beginShape(TRIANGLES);
  triangleVertices(A, B, C);
  triangleVertices(A, C, D);
  triangleVertices(A, D, E);
  triangleVertices(A, E, B);
  endShape();
  
}

void mouseDragged() {
  rotAmt += (pmouseX - mouseX) * 0.01;
}
