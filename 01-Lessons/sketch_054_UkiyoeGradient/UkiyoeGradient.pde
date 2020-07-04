/*
 * [006] Ukiyoe Gradient #1
 *
 * 2013 [+++] @tinytintoto ( http://tinytintoto.tumblr.com/post/48256656041 )
 */

color col1 = color(unhex("19"), unhex("44"), unhex("8e"));
color col2 = color(unhex("38"), unhex("a1"), unhex("db"));
color col3 = color(unhex("f8"), unhex("f4"), unhex("e6"));
int c;
float noiseScale = 0.1;

void setup() {
  size(500, 500, P2D);
  frameRate(24);
  smooth();
  blendMode(BLEND);

  c = height;
}

void draw() {
  background(col3);
  for (int i = floor(height/4*3); i >= floor(height/4*1); i--) {
    if ( i < c ) break;

    float inter = map(i, float(height/4*1), floor(height/4*3), 0, 1);
    color col = lerpColor(col2, col3, inter);
    stroke(col);
    line(0, i, width * noise(i * noiseScale) + width * 0.1, i);
  }
  for (int i = floor(height/4*1); i >= 0; i--) {
    if ( i < c ) break;

    float inter = map(i, 0, float(height/4*1), 0, 1);
    color col = lerpColor(col1, col2, inter);
    stroke(col);
    line(0, i, width * noise(i * noiseScale) + width * 0.1, i);
  }
  for (int i=0; i < height; i+=2) {
    stroke( 0, 15 * noise(i*noiseScale));
    line(0, i, width, i);
  }
  for (int i=0; i < height; i+=2) {
    stroke( 255, 15 * noise(i*noiseScale));
    line(i, 0, i, height);
  }

  fill(unhex("dc"), unhex("d3"), unhex("b2"));
  beginShape();
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  
  beginContour();
  vertex(width/20, height/20);
  vertex(width*0.95, height/20);
  vertex(width*0.95, height*0.95);
  vertex(width/20, height*0.95);
  endContour();
  endShape(CLOSE);

  if ( c == 0 ) {
    return;
  }

  c = c - 10;
}
