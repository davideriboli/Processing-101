void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  smooth();
  strokeWeight(5);
  stroke(0);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

/*
By changing a single line of code, what should
you do to get a red line changing its intensity
relative to the position of the mouse
[0,0 = very dark red, almost black | 200,200 = full, intense red]?
*/
