//Schifano Veronica
// ABA Urbino - Applicazioni digitali
// Prof. Davide Riboli

//dimensioni quadrate, contenente tetractis (linee e pallini), rotazione sul perno centrale
//(o premendo un tasto o iniziale), premendo un tasto si salva
//+ di 18= tasti differenti= può cambiare il perno della rotazione,variazione colore
//visualizzazione delle figure che compongono la tetractys 
//reference= triangolo o punti/linee, lezione 28
/*
COMANDI 
 "1-2-3-4-5-6-7-8-9-0" = evidenzia i vertici dei triangoli
 "a"= costruzione esagono ed ellisse
 "d"= costruzione stella a sei punte *BETA*
 "s"= salva Frame
 mouse Destro/Sinistro=rotazione figura
 */
float r=0;
float x1=-100;
float y1=-173;
float x2=100;
float y2=173;
float move1=1.9;
float move2=1.1;
void setup() {
  size (800, 800);
  background (#000639);
}
void draw() {
  background (255);
  // translate (310, 417);
  translate (width/2, height/2);
  rotate (r);
  noFill();
  stroke(0);
  triangle (0, 0, -100, 173, 100, 173); //5,8,9
  triangle (-100, 173, -300, 173, -200, 0);//8,7,4
  triangle (100, 173, 300, 173, 200, 0);//9,10,6
  triangle (0, 0, -200, 0, -100, -173);//5,4,2
  triangle (0, 0, 200, 0, 100, -173);//5,6,3
  triangle (100, -173, -100, -173, 0, -346);//3,2,1
  if (key==('1')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
  }
  if (key==('2')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
  }
  if (key==('3')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
  }
  if (key==('4')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
  }
  if (key==('5')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
  }
  if (key==('6')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
    ellipse(200, 0, 20, 20);//6
  }
  if (key==('7')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
    ellipse(200, 0, 20, 20);//6
    fill(255, 255, 0);
    ellipse(-300, 173, 20, 20);//7
  }
  if (key==('8')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
    ellipse(200, 0, 20, 20);//6
    fill(255, 255, 0);
    ellipse(-300, 173, 20, 20);//7
    ellipse(-100, 173, 20, 20);//8
  }
  if (key==('9')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
    ellipse(200, 0, 20, 20);//6
    fill(255, 255, 0);
    ellipse(-300, 173, 20, 20);//7
    ellipse(-100, 173, 20, 20);//8
    ellipse(100, 173, 20, 20);//9
  }
  if (key==('0')) {
    noStroke();
    fill (255, 0, 0);
    ellipse(0, -346, 20, 20);//1
    fill (0, 255, 0);
    ellipse(-100, -173, 20, 20);//2
    ellipse(100, -173, 20, 20);//3
    fill(0, 0, 255);
    ellipse(-200, 0, 20, 20);//4
    ellipse(0, 0, 20, 20);//5
    ellipse(200, 0, 20, 20);//6
    fill(255, 255, 0);
    ellipse(-300, 173, 20, 20);//7
    ellipse(-100, 173, 20, 20);//8
    ellipse(100, 173, 20, 20);//9
    ellipse(300, 173, 20, 20);//10
  }
  if (mousePressed && (mouseButton == LEFT)) {
    r=r+0.005;
  }
  if (mousePressed &&(mouseButton==RIGHT)) {
    r=r-0.005;
  }
  if (key==('a')) {
    noStroke();
    fill(100, 50);
    rect(-width, -height, width*2, height*2);
    noFill();
    strokeWeight(3);
    stroke (255);
    ellipse (0, 0, 400, 400);
    stroke (255, 0, 0);
    line (-100, -173, 100, -173);//2,3
    line(-100, -173, -200, 0); //2,4
    line (-200, 0, -100, 173); //4,8
    line (-100, 173, 100, 173); //8,9
    line (100, 173, 200, 0);//9,6
    line (200, 0, 100, -173);//6,3
  }
  if (key==('d')) {
    //c'è qualche problema nella traiettoria di movimento
    fill(#000639, 230);
    rect(-width, -height, width*2, height*2);
    stroke(#6875E5);
    noFill();
    triangle (-100, -173, 200, 0, -100, 173);
    triangle (100, 173, -200, 0, 100, -173);
    noStroke();
    fill (255);
    ellipse (x1, y1,5, 5);
    x1=x1+move1;
    y1=y1+move2;  
    if (x1>200) {
      x1=200;
      move1=-move1;
    } 
    if (x1<-100) {
      x1=-100;
      move1=0;
      move2=-3;
    }
    if (y1<-173) {
      y1=-173;
      move1=2.91;
      move2=1.67;
    }
    ellipse (x2, y2, 5, 5);
    x2=x2-move1;
    y2=y2-move2;

    if (x2<-200) {
      x2=-200;
      move1=-move1;
    }
    if (x2>100) {
      x2=100;
      move1=0;
      move2=-3;
    }
    if (y2>173) {
      y2=173;
      move1=2.91;
      move2=1.67;
    }
  }
}
void keyPressed() {
  if (key==('s')) {
    saveFrame ("triangle_##.tiff");
  }
}