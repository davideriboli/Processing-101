//in questo sketch vado a creare un testo incolonnato
////https://processing.org/examples/words.html sketch di partenza.

PFont f;

void setup() {

  //imposto la mia tavola di lavoro
  size(1920, 1080);

  // Creo il font
  printArray(PFont.list());
  f = createFont("Futura XBlk BT.ttf", 37);
  textFont(f);
}
//allineo il testo

void draw() {
  background(255);
  textAlign(RIGHT);
  drawType(width * 0.25);
  textAlign(CENTER);
  drawType(width * 0.5);
  textAlign(LEFT);
  drawType(width * 0.75);
}
//gli dico quali parole deve inserire
void drawType(float x) {
  fill(0);
  text("we create complex parts", x, 50);
  fill(0);
  text("machine", x, 100);
  fill(0);
  text("combination", x, 150);
  fill(0);
  text("work", x, 200);
  fill(0);
  text("experiment", x, 250);
  fill(0);
  text("solve", x, 300);
  fill(0);
  text("we create complex parts", x, 350);
  fill(0);
  text("machine", x, 400);
  fill(0);
  text("combination", x, 450);
  fill(0);
  text("work", x, 500);
  fill(0);
  text("experiment", x, 550);
  fill(0);
  text("solve", x, 600);
  text("we create complex parts", x, 650);
  fill(0);
  text("machine", x, 700);
  fill(0);
  text("combination", x, 750);
  fill(0);
  text("work", x, 800);
  fill(0);
  text("experiment", x, 850);
  fill(0);
  text("solve", x, 900);
}
