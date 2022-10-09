//vado a disegnare le stelle e ad animarle
class Star {
  float x;
  float y;
  float z;
  
  float pz;
  
  Star () {
    x = random(-width, width) ;
    y = random (-height, height) ; 
    z = random(width) ;
    pz = z;
  }
  
  void update () {
    z = z - speed; 
    if (z < 1) {
      z = width; 
       x = random(-width, width) ;
       y = random (-height, height) ; 
       pz = z; 
     }
  }
  //disegno le stelle, e decido come devono essere posizionate sui vari assi
  void show() {
    fill(255);
    stroke(152,190,100);
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 18, 2);
    ellipse (sx, sy, r, r);
    
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);
    
    pz = z;
    stroke(255);
    line(px, py, sx, sy);
    
  }
}
