void setup(){
  size(800, 500, P3D);

  smooth();
  fill(0);
  strokeWeight(2);
  stroke(255);
}

void draw(){
  background(0);
  camera(150*sin(TWO_PI*frameCount/360), -90, 150*cos(TWO_PI*frameCount/360),
         0.0, 0.0, 0.0,
         0.0, 1.0, 0.0);
  box(50);
  //if(frameCount%5 == 0){
  //  saveFrame();
  //}
  //if(frameCount == 90){
  //  exit();
  //}
}
