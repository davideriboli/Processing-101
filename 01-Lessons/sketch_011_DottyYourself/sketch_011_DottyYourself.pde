/*
Do not read the following lines!
Just execute the sketch and try
to understand every action. Then
try to write the right code to 
produce the same, by yourself.
*/

// !! DON'T READ MORE !!! \\









float r;
float g;
float b;
float a;
float diam;
float x;
float y;

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);

  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);
}
