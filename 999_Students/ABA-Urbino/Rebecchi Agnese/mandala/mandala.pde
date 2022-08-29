//vado a ricreare un loop utilizzando le funzioni di seno e coseno, aggiungendo delle circonferenze.

float x= 0;
float y = 10 ;
float angle ;
float dia= 60;

void setup() {
  size(900, 900);
  surface.setLocation(987, 70);
}

void draw() {
  background(255);

  translate(width/2, height/2);
  rotate(radians(angle/3));
  //vado a dire al codice cosa deve disegnare.
  for (float a=0; a<360; a+=90) {
    pushMatrix();
    rotate(radians(a));
    stroke(0);
    strokeWeight(2);
    //non vado a inserire una linea diritta, ma una con più punti, in modo da averne una ricurva.
    float wave = sin(radians(frameCount));
    beginShape();
    vertex(50, 75); // primo punto
    bezierVertex(width/2+wave*200, height/2, x*sin(radians(angle)), 0+wave*200, 100, y-dia/2);
    endShape();
    //inserisco al centro delle circonferenze
    ellipse(x*sin(radians(angle)), 0, dia, dia);
    ellipse(100, y, dia, dia);
    //vado a riempire le figure
    fill(255);
    popMatrix();
  }
  //inserisco la possibilità di salvare i frame, quando eseguo il codice
  //saveFrame("output/mandala-######.jpg");
  angle++;
}
