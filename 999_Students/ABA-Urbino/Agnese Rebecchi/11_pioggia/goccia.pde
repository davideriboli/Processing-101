//vado a disegnare le gocce e posizionarle nello spazio
class Drop {
  float x = random(width);
  float y = random(-500,-50);
  float z = random(0,20);
  float len = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 4, 10);

  void fall() {
    y = y + yspeed;
    yspeed = yspeed + 0.005;
    
    if (y > height) {
      y = random(-200,-100);
      
      //quì imposto la velocità delle gocce che cadono
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(255);
    line(x,y,x,y+len);
  }
  
}
