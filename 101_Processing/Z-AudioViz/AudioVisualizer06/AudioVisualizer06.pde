import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
AudioInput in;
float[] angle;
float[] y, x;
 
void setup()
{
  size(displayWidth, displayHeight,P3D);
  minim = new Minim(this);
  
  jingle = minim.loadFile("ghost1.mp3");
  jingle.play();
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  
  /*
  in = minim.getLineIn(Minim.STEREO, 2048, 192000.0);
  fft = new FFT(in.bufferSize(), in.sampleRate());*/

  y = new float[fft.specSize()];
  x = new float[fft.specSize()];
  angle = new float[fft.specSize()];
  frameRate(240); 
}
 
void draw()
{
  background(0);
  fft.forward(jingle.mix);
  doubleAtomicSprocket();
}
 
void doubleAtomicSprocket()
{
  noStroke();
  pushMatrix();
  
  translate(width/2, height/2);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/100;
    x[i] = x[i] + fft.getFreq(i)/100;
    angle[i] = angle[i] + fft.getFreq(i)/2000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    //    stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(fft.getFreq(i)*2, 0, fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+50)%width/3, (y[i]+50)%height/3);
    box(fft.getBand(i)/20+fft.getFreq(i)/15);
    popMatrix();
  }
  
  popMatrix();
  pushMatrix();
  
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/1000;
    x[i] = x[i] + fft.getFreq(i)/1000;
    angle[i] = angle[i] + fft.getFreq(i)/100000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    //    stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(0, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width, (y[i]+250)%height);
    box(fft.getBand(i)/20+fft.getFreq(i)/15);
    popMatrix();
  }
  
  popMatrix();
}
 
void stop()
{
  //always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  super.stop();
}
