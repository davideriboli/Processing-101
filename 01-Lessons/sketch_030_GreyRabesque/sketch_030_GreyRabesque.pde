/*

http://goo.gl/FHPn8


*/

void setup(){
   size(1066,711);
}

//Use it without draw for quick effect//

void draw(){
  for (int i=0; i<width; i++){
    for (int j=0; j<height; j++){
      stroke(int(abs(cos(i*j)*255)),int(abs(cos(i*j)*255)));
      point(i,j);
    }
  }
}
