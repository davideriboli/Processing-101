//Vado a ricreare un effetto "salto nell'iperspazio
Star[] stars = new Star [900];
float speed;
void setup() {
  size( 800, 900);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();  
  }
}
//quì gli dico che se muovo il mouse la velocità delle stelle deve cambiare
void draw() {
  speed = map(mouseX, 0, width, 0, 20) ;
  background (0); 
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update ();
    stars[i].show();
  }
}
