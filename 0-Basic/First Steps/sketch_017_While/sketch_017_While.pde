size(200, 200);
background(0);
noFill();
stroke(255, 0, 0);
strokeWeight(3);
smooth();

float i = 0;
while (i < 10) {
  ellipse(10+i*20, 10+i*20, 50, 50);
  i = i+1;
}
