//vado a ricreare delle linee che partono da un lato della mia finestra e ruotando vanno a creare un disegno.
//https://www.youtube.com/watch?v=ajLZgjDS-LA lo scheletro generale e il tutorial l'ho preso da quì.
float x;
float sW = 4;
float angleVar = 360;

void setup () {
  size (900, 900);
  surface.setLocation(987, 70);

  strokeCap(CORNER);
  //noLoop();

  mouseX = 10;
}
//imposto lo sfondo
void draw() {
  background (#ff5100) ;

  translate(width/2, height/2);

  for (int angle=0; angle<=360; angle+=angleVar) {

    if (angleVar<=1) x = random(100, 300);
    else x = 300;
    //quì disegno la linea e gli dico di quanto deve ruotare
    pushMatrix();
    rotate(radians(angle));

stroke(144, 43, 113);
    strokeWeight(4);
    line(x, 0, width, 0);
    popMatrix();


  }


  if (angleVar>1) angleVar -= 1;
  else {
    angleVar = 1;
    frameRate(1);
  }
  sW = map(angleVar, 1, 360, 4, 128);
}
