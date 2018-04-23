/*

http://p5art.tumblr.com/post/120441104644/bubbles-code-here

*/

*/float x, y, scale, rotation, sz, time, theta;
int frames = 120, num = 100, fc;
long rs;
boolean save = false;
 
void setup() {
  size(540, 540);
  smooth(8);
  noStroke();
  rs = (long) random(10000);
}
 
void draw() {
  randomSeed(rs);
  background(#490A3D);
  time = (frameCount % frames)/float(frames);
  for (int i=0; i<num; i++) {
    drawBubble(i);
  }
  if (save) {
    saveFrame("image-###.gif");
    if (frameCount==fc+frames) noLoop();
  }
  theta += TWO_PI/frames;
}
 
void drawBubble(int i) {
  x = random(width);
  y = random(height);
  scale = random(1, 3);
  rotation = random(-.01, 0.1);
  float m = map(sin(theta+TWO_PI/num*i), -1, 1, .5, 2);
  sz = random(20, 50)*m;
  resetMatrix();
  scale(scale);
  translate(x, y);
  rotate(rotation);
  fill(#F8CA00, 200);
  if (random(1)>.9)   fill(#BD1550, 200);
  if (random(1)>.9)   fill(#8A9B0F, 200);
  ellipse(0, -time*height+height, sz, sz);
  ellipse(0, -time*height, sz, sz);
}
 
void mouseReleased() {
  rs = (long) random(10000);
}
 
void keyPressed() {
  save = true;
  fc = frameCount;
}
