
class TextureSphere {
   int nSeg;
   float r;
   
   TextureSphere(float radius, int numSeg) {
     nSeg = numSeg;
     r = radius;
   }
   
   void display() {
     
     float uStep = TWO_PI / nSeg;
     float vStep = PI / nSeg;
     
     beginShape(QUADS);
     
     for(float u=0; u<2*PI; u+=uStep) {
       for(float v=-PI/2; v<PI/2; v+=vStep) {
         
         PVector a = new PVector(r*sin(u)*cos(v), r*cos(u)*cos(v), r*sin(v));
         normal(a.normalize().x,a.normalize().y,a.normalize().z);
         vertex(a.x, a.y, a.z);
         
         a = new PVector(r*sin(u+uStep)*cos(v), r*cos(u+uStep)*cos(v), r*sin(v));
         normal(a.normalize().x,a.normalize().y,a.normalize().z);
         vertex(a.x, a.y, a.z);
         
         a = new PVector(r*sin(u+uStep)*cos(v+vStep), r*cos(u+uStep)*cos(v+vStep), r*sin(v+vStep));
         normal(a.normalize().x,a.normalize().y,a.normalize().z);
         vertex(a.x, a.y, a.z);
         
         a = new PVector(r*sin(u)*cos(v+vStep), r*cos(u)*cos(v+vStep), r*sin(v+vStep));
         normal(a.normalize().x,a.normalize().y,a.normalize().z);
         vertex(a.x, a.y, a.z);

       }
     }
     
     endShape();
     
     
   }
  
  
}
