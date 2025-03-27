//voglio sovrapporre due immagini e dare loro un effetto

//decido quali immagini deve prendere dalla cartella 'data'
PImage man;
PImage woman;
int minThreshold = 400;
int maxThreshold = 3;
void setup() {
  size(640, 640);
  man = loadImage("man.jpg");
  woman = loadImage("woman.jpg");
}

void draw() {

  //decido di sovrapporre le due immagini
  //aggiungo iL filtro INVERT e una tinta
  image(man, 0, 0);
  tint(255, 100);
  filter(INVERT);
  image(woman, 0, 0);
  //decido dove posizionare l'immagine 'woman')
  translate(20,50);
  tint(255, 0, 0, 100);
  filter(INVERT);
  loadPixels();
}
