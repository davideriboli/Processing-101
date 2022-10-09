//creo un testo lungo un tracciato, che mi servirà per il visual del mio progetto.
//credit: http://learningprocessing.com/examples/chp17/example-17-08-textalongcurve
String message = "we create complex parts, machine, combination, works, experiment, solve,";
PFont f;
// il raggio della circonferenza
float r = 209;
float angleRotate = 360;
float arclength = 300;

void setup() {
  size(600, 600);
  f = createFont("Georgia",40,true);
  textFont(f);
  // centro il testo
  textAlign(CENTER);
  smooth();
  rotate(radians(arclength));
}

void draw() {
  background(255);

  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  noFill();
  //imposto la circonferenza bianca, così non si vede sullo sfondo 
  stroke(255);
  ellipse(0, 0, r*2, r*2);

  // mantengo la posizione lungo la curva
  


  for (int i = 0; i < message.length(); i++)
  {
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);
    arclength += w/2;
    // inizio dalla parte sinistra della circonferenza aggiungendo PI
    float theta = PI + arclength / r;

    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta+PI/2); 
    fill(0);
    text(currentChar,0,0);
    popMatrix();
   
    arclength += w/2;
  }
}
