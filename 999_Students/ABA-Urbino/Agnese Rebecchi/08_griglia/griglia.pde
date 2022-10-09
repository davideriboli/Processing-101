//vado a creare delle curve che posso animare con il passaggio del mouse, utile per creare pattern
//https://www.youtube.com/watch?v=1dPFgWT2Aio
float sw, alpha;
float yStep = 10;
float arcSize = 200;

void setup() {
  size(1000, 1000);
}

void draw() {
  background(255);
  
  //quì vado a rendere interattivo il codice, con l'uso del mouse
  
  mouseX= constrain(mouseX, 10, width);
  mouseY= constrain(mouseY, 10, height);
  
  yStep = mouseY;
  
  noFill();
  stroke(20);
  strokeWeight(5);
  
  for (int y = 0; y<height; y+=yStep) {
    sw = map(sin(radians(y)),-1,1,2,yStep);
    strokeWeight(sw);
    for (int x=0; x<width+arcSize; x+=arcSize) {
      arc(x, y, arcSize/2, arcSize/2, 0, PI);
      arc(x+arcSize/2, y, arcSize/2, arcSize/2, PI, TWO_PI);
      
      
    }
  }
}
