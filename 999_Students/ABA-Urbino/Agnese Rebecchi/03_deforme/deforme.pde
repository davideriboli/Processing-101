//prendo un mio selfie e lo riduco in tanti pixel, posizionati in uno spazio 3D
// credit: https://www.youtube.com/watch?v=WEBOTRboXBE

//prendo l'immagine dalla cartella 'data' del progetto
PImage deforME;

void setup() {
  size(900, 900, P3D);
  //carico l'immagine
  deforME = loadImage("deforME.jpg");
  //ho bisogno di scalare la foto di partenza, perchè è molto grande
  deforME.resize(900, 900);
}
void draw() {
  background(255);
  fill(0);
  noStroke();
//decido che i pixel sono delle piccole sfere
  sphereDetail(1);
  float tiles = 100;
  float tileSize = width/tiles;

  push();
  
  //animo il tutto, posizionandolo nell'area di lavoro

  translate(width/2, height/3);
  rotateY(radians(frameCount));

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = deforME.get( int (x * tileSize), int(y*tileSize));
      float b = map( brightness(c), 0, 255, 1, 0);

      float z = map(b, 0, 1, -100, 100);

      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(tileSize*b*0.8);
      pop();
      
     
    }
  }
  pop();
}
