/*
A different way to obtain a dotty rain.
Execute the code, try to understand by
yourself how the trick works and write
your own.
*/

// THIS CODE COMES FROME THE WORK OF \\
// ABE PAZOS @ FUNPROGRAMMING:ORG [THANKS!] \\

// !!! DON'T READ MORE !!! \\\











void setup() {
  size(200, 200);
  background(0);
  noStroke();
}

void draw() {

  float X = random(width);
  float Y = random(height);
  float D = random(15);
  float R = random(255);
  float G = random(255);
  float B = random(255);

  fill(0, 5);
  rect(0, 0, width, height);

  smooth();
  fill(R, G, B);
  ellipse(X, Y, D, D);
}
