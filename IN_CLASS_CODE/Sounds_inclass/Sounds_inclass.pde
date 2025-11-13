import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
Oscil wave;
AudioOutput out;

void setup() {
  size(600,300,P3D); 
  minim = new Minim(this);
  player = minim.loadFile("felt.mp3");
  //player.play();
  
  out = minim.getLineOut();
  
  wave = new Oscil(220, 0.5f, Waves.SINE);
  wave.patch(out);
  
}

void draw() {
  background(0);
}
