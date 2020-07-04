size(300, 300);
smooth();
strokeWeight(10);

for(int i = 0; i < width; i++) {
  float x = random(0, width);
  stroke(random(50), random(255), random(255), 100);
  line(i, 0, x, height);
}
