//Provo a creare una texture effetto 'tubo catodico'

PImage woman;       // carico l'immagine
int cellsize = 2; // decido quanto deve essere grande la cella della griglia
int cols, rows;   // quì imposto le colonne e le righe 

void setup() {
  size(500, 500, P3D);
  woman = loadImage("woman.jpg"); 
  cols = width/cellsize; //calcolo la lunghezza delle celle
  rows = height/cellsize; //calcolo l'altezza delle celle
}

void draw() {
  background(255);
  woman.loadPixels();

  for (int i = 0; i < cols; i++ ) {
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // quì posiziono la x
      int y = j*cellsize + cellsize/2; // quì posiziono la y
      int loc = x + y*width;
      color c = woman.pixels[loc];
     //vado a posizionare i pixel con il float 'map'
      float z = map(brightness(woman.pixels[loc]), 0, 50, 55, 0);
      pushMatrix();
      translate(x, y, z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}
