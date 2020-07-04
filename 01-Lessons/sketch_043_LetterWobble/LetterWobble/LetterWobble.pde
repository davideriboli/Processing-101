/*

http://www.openprocessing.org/sketch/149698#

THIS IS A PROCESSING SKETCH!
change file suffix in .pde before running

*/

ArrayList<PVector> l;
color c1,c2,c3;
boolean doWobble = false;
String currletter;
 
ArrayList<ArrayList<PVector>> word = new ArrayList<ArrayList<PVector>>();
 
void setup() {
  size(600,600);
  smooth();
  noStroke();
  makeColors();
  textAlign(CENTER,CENTER);
  
 prepareLetter("L"); word.add(l);
 prepareLetter("e"); word.add(l);
 prepareLetter("t"); word.add(l);
 prepareLetter("r"); word.add(l);
 prepareLetter("s"); word.add(l);
  
 currletter = "2";
 prepareLetter(currletter);
 setWobble();
}
 
boolean preparing = false;
 
void draw() { 
  if(!preparing) {
    background(c1);
   
    pushMatrix();
    translate(width/2,height/2);
    fill(c3);
    drawLetter(l);
    popMatrix();
    pushMatrix();
    fill(c2);
    scale(0.2);
    translate(150,250); drawLetter(word.get(0));
    translate(250,0); drawLetter(word.get(1));
    translate(250,0); drawLetter(word.get(2));
    translate(250,0); drawLetter(word.get(2));
    translate(250,0); drawLetter(word.get(1));
    translate(250,0); drawLetter(word.get(3));
    translate(250,0); drawLetter(word.get(4));
    popMatrix();
    textSize(16);
    fill(100);
    text("current letter/digit = " + currletter,300,580);
  }
}
 
float[] wratio;
float[] wtheta;
 
void setWobble() {
  wratio = new float[l.size()];
  wtheta = new float[l.size()];
  for(int i=0;i<wratio.length;i++) {
    wratio[i] = random(-0.02,0.02);
    wtheta[i] = PI;
  }
}
 
void drawLetter(ArrayList<PVector> letter) {
    beginShape();
    for(int i=0;i<letter.size();i++) {
      float shift = 0;
      if(doWobble)
        shift = 5*sin(wtheta[i]);
      curveVertex(letter.get(i).x+shift,letter.get(i).y-shift);
      wtheta[i] += wratio[i];
    }
    endShape(CLOSE);
}
 
void prepareLetter(String letter) {
  preparing = true;
  fill(0);
  smooth();
  noStroke();
  background(255);
  textSize(400);
  text(letter,width/2,height/2-30);
  l = new ArrayList<PVector>();
  for(float th=0;th<TWO_PI;th+=TWO_PI/50) {
    float r = 290;
    float b = 255;
    int nx=0,ny=0;
    while(b>128) {
        nx = width/2+(int)(-r * sin(th));
        ny = height/2+(int)(r * cos(th));
        b = brightness(get((int)nx,(int)ny));
        fill(255,255,0);
        r-=2;
      }
      r+=10;
      nx = width/2+(int)(-r * sin(th));
      ny = height/2+(int)(r * cos(th));
      l.add(new PVector(nx-width/2,ny-height/2));
    }
    setWobble();
    preparing = false;
}
 
String[] ltrs = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                 "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                 "0","1","2","3","4","5","6","7","8","9"};
 
void mouseClicked() {
  makeColors();
  currletter = ltrs[(int)random(0,ltrs.length)];
  prepareLetter(currletter);
}
 
void keyPressed() {
  if(key == RETURN || key == ENTER) doWobble = !doWobble;
  if(doWobble) setWobble();
}
 
void makeColors() {
  colorMode(HSB,360,100,100);
  int h = (int)random(360);
  int s = (int)random(40,60);
  int b = (int)random(90,100);
  c1 = color(h,s,b);
  c2 = color(h,s-15,b-30);
  c3 = color( ((int)(h+180+random(-10,10)))%360,s*0.6,b*0.8);
  colorMode(RGB,255);
}
