//vado a creare un effetto pioggia.

Drop[] drops = new Drop[500];

//quì indico dove prendere le gocce.
void setup() {
  size (640, 360);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < drops.length; i++) {
    drops[i].show();
    drops[i].fall();
  }
}
