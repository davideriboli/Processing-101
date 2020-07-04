void setup() {
  size(200, 200);
  background(255);
}

void draw() {
}

void mouseDragged() {
  smooth();
  stroke(0);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  background(255);
}
/*
Now read about abs [http://processing.org/reference/abs_.html]
and strokeWeight [http://processing.org/reference/strokeWeight_.html]
and add a single line of code, so that the faster the user moves
the mouse, the wider the drawn line.
*/
