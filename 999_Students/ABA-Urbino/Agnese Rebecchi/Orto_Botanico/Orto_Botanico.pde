//imparo a caricare una foto su processing

PImage img;

void setup() {
  //carica immagine orto.jpg
  img = loadImage("Orto.jpg");
  //setta dimensioni background
  size(960, 960);
  image(img, 0, 0);
}

void draw() {
  //Genera due numeri random all'interno di width e height dell'immagine
  int x1 = round(random(width));
  int y1 = round((height));
  
  int x2 = round(x1 + random(-5, 20));
  int y2 = round(y1 + random(-10, 5));

  int w = 45;
  int h = 45;
  //Cambia il colore dei pixel (x2,y2)
  set(x2, y2, get(x1, y1, w, h));
}
//in teoria se premo s, dovrebbe salvarmi un frame nella cartella del file.
void keyReleased() {
  if (key == 's' || key == 's') saveFrame("png"); {
    image(img, 0, 0);
  }
}
