float r;

void setup() {
  size(400, 400);
  background(10);
  smooth();
  noStroke();
  fill(255);
}

void draw() {

  /* "translate" does the centering trick,
   translating the relative position */
  translate(width/2, height/2);

  // "rotate" does the rotating trick
  rotate(r);

  ellipse(1+r, 1+r, 5, 5);
  ellipse(1-r, 1+r, 5, 5);
  ellipse(1-r, 1-r, 5, 5);
  ellipse(1+r, 1-r, 5, 5);

  //Change the constant to change the pattern
  r=r+1;

  //A limiter and a color switch
  if (r>width/3) {
    r=-r;
    fill(random(255), random(255), random(255));
    background(random(100), random(100), random(100));
  }

  // We can save a JPEG pressing "s" or "S"
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      save("spirals.jpg");
    }
  }
}
