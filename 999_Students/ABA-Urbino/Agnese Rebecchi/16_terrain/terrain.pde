//voglio ricreare l'effetto onde o terra
//Vado a ricreare un effetto volo-movimento
//Il tutorial l'ho preso da quì: https://www.youtube.com/watch?v=IKB1hWWedMk

//vado di base a creare una griglia
int cols, rows;
int scl = 20;
int w = 1200;
int h = 900;

//la mia visuale è dall'alto
float flying = 0;
float[][] terrain;
//Inserisco le variabili scritte sopra

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
 
}

void draw() {
  //posso interagire con lo sketch a seconda di come muovo il mouse.
  flying -= map(mouseX, 0, width, 0, 3); 
  
   float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 2;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.05;
    }
    yoff += 0.2;
  }
  //imposto sfondo e griglia
  background(255);
  stroke(0);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
