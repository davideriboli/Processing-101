PImage img;
 
void setup() {
  background(0);
  img = loadImage("image.jpg");
  
size(400, 400);

  image(img, 0, 0);
  frameRate(5);
}
 
void draw() {
  int x1 = 0;
  int y1 = (int) random(0, height);
 
  int y2 = round(y1 + random(-7, 7));
  int x2 = round(random(-5, 5));
 
  int w = width;
  int h = (int) random(35, 50);
 
  copy(x1, y1, w, h, x2, y2, w, h);
}
 
void keyReleased() {
  if (keyCode == DELETE || keyCode == BACKSPACE) {
    background(0);
    image(img, 0, 100);
  }
  if (key=='s' || key=='S') saveFrame("image_##.png");
}
