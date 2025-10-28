class IcoSphere {
  //Treat this IcoSphere as a Unit sphere centered on the origin
  Mesh3D mesh;

  //Constructor
  IcoSphere() {
    float phi = (1 + sqrt(5)) / 2;
    mesh = new Mesh3D ();
    
    addNormalVertex(-phi,-1,0); //0
    addNormalVertex( phi,-1,0); //1
    addNormalVertex( phi, 1,0); //2
    addNormalVertex(-phi, 1,0); //3

    addNormalVertex(0,-phi, 1); //4
    addNormalVertex(0,-phi,-1); //5
    addNormalVertex(0, phi,-1); //6 
    addNormalVertex(0, phi, 1); //7

    addNormalVertex(-1,0, phi); //8
    addNormalVertex(-1,0,-phi); //9
    addNormalVertex( 1,0,-phi); //10
    addNormalVertex( 1,0, phi); //11
    
    addTriangle(0,5,4);
    addTriangle(0,4,8);
    addTriangle(0,8,3);
    addTriangle(0,3,9);
    addTriangle(0,9,5);
    
    addTriangle(1,4,5);
    addTriangle(1,5,10);
    addTriangle(1,10,2);
    addTriangle(1,2,11);
    addTriangle(1,11,4);
    
    addTriangle(7,8,11);
    addTriangle(7,11,2);
    addTriangle(7,2,6);
    addTriangle(7,6,3);
    addTriangle(7,3,8);
    
    addTriangle(6,2,10);
    addTriangle(6,10,9);
    addTriangle(6,9,3);
    addTriangle(5,9,10);
    addTriangle(4,11,8);
    
    createSphericalUVs();
  }
  
  private void addNormalVertex(float a, float b, float c) {
    PVector v = new PVector(a,b,c);
    v.normalize();
    mesh.verts.add(v);
    mesh.norms.add(v.copy());
  }
  
  private void addTriangle(int a, int b, int c) {
    int[] tarray = {a, b, c};
    mesh.tris.add(tarray);
  }
  
  void createSphericalUVs() {

  }
 
  void subdivideAllTris() {
    ArrayList<PVector> newVerts = new ArrayList<PVector>();
    ArrayList<PVector> newNorms = new ArrayList<PVector>();
    ArrayList<int[]> newTris = new ArrayList<int[]>();
    
    
    mesh.verts = newVerts;
    mesh.norms = newNorms;
    mesh.tris = newTris;
    
    createSphericalUVs();
    
  }
 
  void display() {
    mesh.display();
  }
  
  void display(PImage img) {
    textureMode(NORMAL);
    mesh.display(img);
  } 
  
}
