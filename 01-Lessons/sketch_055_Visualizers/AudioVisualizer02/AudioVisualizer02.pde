// Oct 2013
// http://kow-luck.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://kow-luck.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// If you want to use this work as free, or encourage me,
// please contact me via http://kow-luck.com/contact

//============================================ global vars
import processing.opengl.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

boolean Negative = false;

//============================================ setup
void setup() {
  colorMode(RGB, 10);
  size(1280, 720, OPENGL);
  frameRate(30);

  minim = new Minim(this);
  minim.debugOn();

  in = minim.getLineIn(Minim.STEREO, width);
}

//============================================ frame loop 

void draw() {

  mouseReleased();
  keyReleased();

  if (Negative) {
    background(0);
  }
  else {
    background(10);
  }

  drawMe();

  println(frameRate);
}

//============================================ select color
void mouseReleased() {
  if (mouseButton == LEFT) {
    Negative =false;
  }
  else if (mouseButton == RIGHT) {
    Negative = true;
  }
}

//============================================ select style
void keyReleased() { 
  switch(key) {

    //fixed
  case ' '  : //a birds-eye view
    rotateX(0); 
    rotateY(0); 
    rotateZ(0);
    break;
  case '1' : //fixed at top
    rotateX(radians(90)); 
    translate(0, 0, -height/3.5);
    break;
  case '2' : //fixed at bottom
    rotateX(radians(90)); 
    translate(0, 0, -height/1.4);
    break;
  case '3' : //fixed at left
    rotateY(radians(90)); 
    translate(0, 0, width/50); 
    break;
  case '4' : //fixed at right
    rotateY(radians(90)); 
    translate(0, 0, width);
    break;

    //vertical
  case '5' : //vertical most far
    rotateY(radians(90)); 
    translate(width*2, 0, width/2);
    break;
  case '6' : //vertical second far
    rotateY(radians(90)); 
    translate(width, 0, width/2);
    break;
  case '7' : //vertical second near
    rotateY(radians(90)); 
    translate(width/3, 0, width/2);
    break;
  case '8' : //vertical most near
    rotateY(radians(90)); 
    translate(-width/2, 0, width/2);
    break;

    //horizontal
  case '9' : //horizontal most near
    rotateX(radians(90)); 
    translate(0, 0, -height/2);
    break;
  case '0' : //horizontal second near
    rotateX(radians(90)); 
    translate(0, -height, -height/2);
    break;
  case '-' : 
    rotateX(radians(90)); //horizontal second far
    translate(0, -height*2, -height/2);
    break;
  case '^' : //horizontal most far
    rotateX(radians(90)); 
    translate(0, -height*3, -height/2);
    break; 

    //rotation
  case '¥' : //fast rotation
    translate(width/2, height/2, -width/2);
    rotateX(frameCount * 0.07);
    rotateY(frameCount * 0.08); 
    rotateZ(frameCount * 0.09);
    break; 
  case ENTER: //slow rotation
    translate(width/2, height/2, -width/2);
    rotateX(frameCount * 0.02);
    rotateY(frameCount * 0.01); 
    rotateZ(frameCount * 0.03);
    break;
  }
}

//============================================ draw object
void drawMe() {
  int r = 360/36;
  float sW = height/240;

  for (int j =1 ; j<= 36 ; j++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(5+r*j));

    for (int i = 0; i < width-1; i++) { 
      float lIn = in.left.get(i);
      float rIn = in.right.get(i);
      float nextRIn = in.right.get(i+1);
      
      if (Negative) {
        stroke(8, lIn*10*random(5), rIn*5*random(10), 3);
      } 
      else {
        stroke(3, lIn*10*random(5), rIn*5*random(10), 2);
      } 
      strokeWeight(sW);
      line(i, lIn*100, lIn*340, i+1, nextRIn*100, nextRIn*350 );
    }
    popMatrix();
  }
}

//============================================ stop
void stop() {
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}
