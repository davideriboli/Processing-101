//Codice adattato dall'originale "Processing Recorder" 
// di Daniel Shiffman

//Contatore di salvataggi
int conta=1;

void setup() {
  size(480, 270);
}

void draw() {
  background(0);

  // Qualcosa da salvare...
  for (float a = 0; a < TWO_PI; a+= 0.2) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a+sin(frameCount*0.004*a));
    stroke(255);
    line(-100, 0, 100, 0);
    popMatrix();
  }
}

void keyPressed() {

  // Cosa deve fare Processing se qualcuno preme s...
  if (key == 's' || key == 'S') {
    save("Immagine_" + nf(conta,3) + ".png");
    conta = conta+1;
 
  }
}
