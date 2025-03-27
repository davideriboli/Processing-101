import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
boolean paused = false;
 
void setup()
{
  size(1280, 720);
  frameRate(30);
  minim = new Minim(this);
 
  song = minim.loadFile("ghost1.mp3");
  song.play();
 
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
 
void draw()
{
  background(240);
  fft.forward(song.mix);
  strokeWeight(2);
  stroke(20);
 
  pushMatrix();
  translate(width/2, 0);
 
  float fftBand;
  for (int i = 0; i < fft.specSize(); i++){
    fftBand = fft.getBand(i) * 4;
    line(i, height*4/5,   i, (height*4/5 - fftBand));
    line(-i, height*4/5, -i, (height*4/5 - fftBand));
  }
  popMatrix();
  stroke(20);
}
 
void keyPressed()
{
  if (paused){
    song.play();
    paused = false;
  }
  else {
    song.pause();
    paused = true;
  }
}
 
void stop(){
  song.close();
  minim.stop();
  super.stop();
}
