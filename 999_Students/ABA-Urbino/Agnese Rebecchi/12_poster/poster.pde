//vado a deformare un vecchio poster che avevo fatto mettendo i vari pixel in 3D
//credit - https://processing.org/tutorials/pixels

PImage poster;       // l'immagine che andò ad utilizzare
int cellsize = 5; //dimensione della cella
int cols, rows;   // numero delle colonne e delle righe
void setup() {
  size(596, 596, P3D);
 poster  = loadImage("poster.jpg"); // carico l'immagine
  cols = width/cellsize;             // calcolo le colonne
  rows = height/cellsize;            // e quì le righe
}

void draw() {
  background(255);
  loadPixels();
  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // posizione della x
      int y = j*cellsize + cellsize/2; // posizione della y
      int loc = x + y*width;           
      color c = poster.pixels[loc];    
      float z = (300/(float)width) * brightness(poster.pixels[loc]) - 50.0;
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,44);
      popMatrix();
    }
  }
}
