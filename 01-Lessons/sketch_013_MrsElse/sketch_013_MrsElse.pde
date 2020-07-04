void setup() {
  size(300, 300);
}
void draw() {
  if (mouseX < width/2) {
    fill(255);
    rect(0, 0, width/2, height);
    fill(0);
    rect(width/2, 0, width, height);
  } 
  else {
    fill(0);
    rect(0, 0, width/2, height);
    fill(255);
    rect(width/2, 0, width, height);
  }
}

