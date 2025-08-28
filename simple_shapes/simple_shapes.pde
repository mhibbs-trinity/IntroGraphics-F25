size(600,800);
background(255);

float x = 300;
float y = 400;
float w = 300;

noStroke();
fill(0);
ellipse(300,300, 300,300);
ellipse(300,500, 300,300);
rect(150,300, 300,200);

fill(255);
arc(300,300, 300,300, 0,PI);
arc(225,300, 150,150, PI,2*PI);
arc(375,300, 150,150, PI,2*PI);

fill(0);
ellipse(250,300, 37.5,37.5);
ellipse(350,300, 37.5,37.5);

int sc = 20;
quad(300,300, 300+sc,300+sc, 300,300+sc*2, 300-sc,300+sc);

fill(255);
textAlign(CENTER);
textSize(32);
text("wat?", 300,500);

