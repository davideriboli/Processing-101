/*

http://www.local-guru.net/blog/2013/1/24/blue-waves


*/

void setup() {
  size(300,300);
  smooth();
  background(0);
}

void draw() {
  fill(0,10);
  noStroke();
  rect(0,0, width,height);
  
  
  stroke(0,0,255,4);
  strokeWeight(2);
  for ( float j=0; j < 20; j++) {
    float f1 = map( j, 0, 20, 1, 1.2 );
    float f2 = map( j, 0, 20, .013, .013 + sin( frameCount * .001)*.003);
    float f3 = map( j, 0, 20, 30 + cos( frameCount * f2 * .63 ) * 20, 25 + sin( frameCount * f2 ) * 20 );
    beginShape(LINES);
    for( int i=0; i< width; i++) {
      vertex(i,height/2+sin( f1 * TWO_PI * i/300 -frameCount * f2  )*f3);
    }
    endShape();
  }
}
