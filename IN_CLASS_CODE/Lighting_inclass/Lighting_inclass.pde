
void setup() {
  size(600,600, P3D);
}

float rotAmt = 0;
PVector A = new PVector(300,300, 0);
PVector B = new PVector(200,200,-100);
PVector C = new PVector(400,200,-100);
PVector D = new PVector(400,400,-100);
PVector E = new PVector(200,400,-100);


void vertNorm(PVector v, PVector n) {
  normal(n.x, n.y, n.z);
  vertex(v.x, v.y, v.z);
}
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
  
  //ambientLight(50,50,50);
  
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
  fill(100,255,0);
  sphere(75);
  popMatrix();

  pushMatrix();
  translate(450,450);
  fill(255,0,0);
  box(75);
  popMatrix();
  
  /*
  beginShape(TRIANGLE_FAN);
  normal(1,0,0);
  doVertex(A);
  doVertex(B);
  doVertex(C);
  doVertex(D);
  doVertex(E);
  doVertex(B);
  endShape();
  */
  fill(0,0,255);
  PVector Anorm = new PVector(0,0,1);
  PVector Bnorm = (new PVector(-1,-1,0)).normalize();
  PVector Cnorm = (new PVector( 1,-1,0)).normalize();
  PVector Dnorm = (new PVector( 1, 1,0)).normalize();
  PVector Enorm = (new PVector(-1, 1,0)).normalize();
  beginShape(TRIANGLES);
  vertNorm(A, Anorm);
  vertNorm(B, Bnorm);
  vertNorm(C, Cnorm);
  
  vertNorm(A, Anorm);
  vertNorm(C, Cnorm);
  vertNorm(D, Dnorm);
  
  vertNorm(A, Anorm);
  vertNorm(D, Dnorm);
  vertNorm(E, Enorm);
  
  vertNorm(A, Anorm);
  vertNorm(E, Enorm);
  vertNorm(B, Bnorm);
  endShape();
  
  
  /*
  beginShape(TRIANGLES);
  PVector n = PVector.sub(B,A).cross(PVector.sub(C,A)).normalize();
  normal(n.x,n.y,n.z);
  triangleVertices(A, B, C);
  
  n = PVector.sub(C,A).cross(PVector.sub(D,A)).normalize();
  normal(n.x,n.y,n.z);
  triangleVertices(A, C, D);
  
  n = PVector.sub(D,A).cross(PVector.sub(E,A)).normalize();
  normal(n.x,n.y,n.z);
  triangleVertices(A, D, E);
  
  n = PVector.sub(E,A).cross(PVector.sub(B,A)).normalize();
  normal(n.x,n.y,n.z);
  triangleVertices(A, E, B);
  endShape();
  */
}

void mouseDragged() {
  rotAmt += (pmouseX - mouseX) * 0.01;
}
