float radius = 2000; 
int c = -1; 
void setup() { 
  size(1000, 500); 
  smooth();
} 
void draw() { 
  background(c); 
  fill(-c); 
  noStroke(); 
  ellipse(width/2, height/2, 10, 10); 
  drawCircle(width/2, height/2, radius); 
  radius += width/20; 
  if (frameCount%4 == 0) saveFrame(); 
  if (frameCount%40 == 0) radius = width*2; 
  if (frameCount == 40) exit();
} 
void drawCircle(float w, float h, float r) { 
  noFill(); 
  stroke(-c); 
  strokeWeight(5); 
  ellipse(w, h, r, r); 
  if (r > 30) { 
    drawCircle(w, h, r/2);
  }
}
