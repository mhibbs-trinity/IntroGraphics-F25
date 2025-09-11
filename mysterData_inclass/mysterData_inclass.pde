
Table myData;
float barWidth;
color f;

void setup() {
  size(800,600);
  
  myData = loadTable("someData.txt","header,tsv");
  for(TableRow row : myData.rows()) {
    println(row.getInt("Year"));
  }
  barWidth = (float)width / myData.getRowCount();
  println(barWidth);
  f = color(255);
}

void draw() {
  background(f);
  
  fill(255);
  pushMatrix();
  translate(0,600);
  scale(1,-1);
  int idx = (int)map(mouseX, 0,width, 0,myData.getRowCount());
  for(int i=0; i<myData.getRowCount(); i++) {
    int yr = myData.getRow(i).getInt("Year");
    int num = myData.getRow(i).getInt("Number");
    if(i == idx) fill(255,0,0);
    else fill(255);
    rect((yr-1965)*barWidth, 0, barWidth, map(num, 0,90000, 0,height));
  }
  popMatrix();
  
  int num = myData.getRow(idx).getInt("Number");
  text(num, mouseX,mouseY);
}

void mousePressed() {
  f = color(255,0,0);
}
