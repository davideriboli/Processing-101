/*
Remember that, before using fonts in your sketches,
you have to create them with the “Create Font” tool
under the “Tools” menu.
*/

int x = 30;
void setup() {
  size(200, 200);
  background(125);  
  frameRate(7);
}

void draw() {
PFont fontA = loadFont("Andalus-48.vlw");
textFont(fontA, 32);

  fill(random(255),0,0);
  text("Red", x, 60);
  fill(0,random(255),0);
  text("Green", x, 120);
  fill(0,0,random(255));
  text("Blue", x, 180);
}
