//Codice adattato dall'originale "Processing Recorder" 
// di Daniel Shiffman

// Variabile booleana per gestire lo stato della registrazione
boolean recording = false;

void setup() {
  size(480, 270);
}

void draw() {
  background(0);

  // Qualcosa da registrare...
  for (float a = 0; a < TWO_PI; a+= 0.2) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a+sin(frameCount*0.004*a));
    stroke(255);
    line(-100, 0, 100, 0);
    popMatrix();
  }

  // Cosa deve fare Processing quando si fa
  // partire la registrazione
  if (recording) {
    saveFrame("output/frames####.png");
  }

  // Un po' di feedback...
  // Notare che nulla di tutto questo apparirà sulla registrazione
  // perché i comandi sono invocati DOPO saveFrame.
  textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Premi r per iniziare la registrazione.", width/2, height-24);
  } else {
    text("Premi r per fermare la registrazione.", width/2, height-24);
  }

  // Il classico puntino rosso di "registrazione in atto"
  stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
}

void keyPressed() {

  // Cosa deve fare Processing se qualcuno preme r...
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}
