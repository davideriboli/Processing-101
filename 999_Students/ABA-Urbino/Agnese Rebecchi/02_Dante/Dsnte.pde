//credit http://www.generative-gestaltung.de/2/sketches/?01_P/P_2_3_3_01
float x = 0;
float y = 0;
float stepSize = 5.0;

PFont font;
//vado a dire al programma che cosa scrivere
String letters = "E quindi uscimmo a riveder le stelle.";
int   fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;

void setup() {
  //imposto l'area di lavoro
  size(800,800);
  background(255);
  cursor(CROSS);

  x = mouseX;
  y = mouseY;
  font = createFont("Pasitn_extended.TTF",18);
  textAlign(LEFT);
  fill(0);
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    float d = dist(x, y, mouseX, mouseY);
    textSize(fontSizeMin + d / 2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY - y, mouseX - x);

      push();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      pop();

      counter++;
      if (counter >= letters.length()) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}
//Imposto alcune azioni su alcuni tasti. per esempio se premo S, mi salva un png.
void keyPressed() {
  if (key == 's') {
    println("Saving...");
    String s = "screen" + nf(1) +".jpg";
    save(s);
    println("Done saving.");
}
}
