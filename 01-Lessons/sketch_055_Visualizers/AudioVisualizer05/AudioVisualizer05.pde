/* 
tutorials
http://vimeo.com/7586074
http://vimeo.com/7596987
frequency diagram
http://www.independentrecording.net/irn/resources/freqchart/main_display.htm
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
AudioPlayer song;

FFT fft;
int w;

//CONSTANTS
float fade = 0; // number from 0 - 255
int bgChangeFrequency = 0; //hz

void setup() 
{
    size(500, 500);    
    minim = new Minim(this);
    // in = minim.getLineIn(Minim.STEREO,512);
    song = minim.loadFile("ghost1.mp3", 1024); //second paremeter is the sound quality as a power of 2
  
    song.loop();
    // fft = new FFT(in.buffer.Size(),in.sampleRate());
    // fft.logAverages(60,7);
    fft = new FFT(song.bufferSize(), song.sampleRate() );
    fill(0,255,0);
    stroke(0,255,0);
}

void draw()
{

    fft.forward(song.mix); //mix = mono
    
    //background(255 - (255/fft.getBand(bgChangeFrequency)),0,0,fade);   
    //background(0);
    noStroke();
    fill(0,0,0,100);
    rect(0,0,width,height);
    
    stroke(0,100,0);
    drawSpectrum(song);
    
    stroke(0,100,0);
    drawWaveForms(song);     
}

void drawSpectrum(AudioPlayer audio)
{    
    //audio spectrum
    int space = width*2/fft.specSize();

    for (int i = 1; i < fft.specSize(); i++){
        // draw the line for frequency band i, scaling it up a bit so we can see it
        line( i*space, height, i*space, height - fft.getBand(i) *8);
    }
}

void drawWaveForms(AudioPlayer audio)
{
    //waveforms
    for( int i = 0; i < audio.bufferSize() - 1; i++ ){
        // find the x position of each buffer value
        float x1  =  map( i, 0, audio.bufferSize(), 0, width );
        float x2  =  map( i+1, 0, audio.bufferSize(), 0, width );
        // draw a line from one buffer position to the next for both channels
        line( x1, 50 + audio.left.get(i)*50, x2, 50 + audio.left.get(i+1)*50);
        line( x1, 150 + audio.right.get(i)*50, x2, 150 + 
        audio.right.get(i+1)*50);
    }  
}

void stop() 
{
    song.close();
    minim.stop();
    super.stop();
}
