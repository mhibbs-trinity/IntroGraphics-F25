
void setup() {
  size(600,600, P3D);
}

PVector A = new PVector(200,200,0);
PVector B = new PVector(100,100,-200);
PVector C = new PVector(300,100,-200);
PVector D = new PVector(300,300,-200);
PVector E = new PVector(100,300,-200);


void draw() {
  background(0);
  camera(300,300,200, 300,300,0, 0,1,0);
  //ortho(-300,300, -300,300);
  
  pointLight(255,255,255, mouseX,mouseY,500);
  //noStroke();
  translate(300,300, -600);
  sphere(100);
  beginShape(TRIANGLE_FAN);
  vertex(A.x, A.y, A.z);
  vertex(B.x, B.y, B.z);
  vertex(C.x, C.y, C.z);
  vertex(D.x, D.y, D.z);
  vertex(E.x, E.y, E.z);
  endShape(CLOSE);
  
}
