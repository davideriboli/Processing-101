//Voglio creare una griglia con degli archi che ruotano e si ripetono
//il tutorial è preso da quì: https://www.youtube.com/watch?v=hI-HCVYjZjU

//imposto colore di background e della figura
color bg = #69d638;
color fg = #ca7288;
// imposto la grandezza della "tavola da disegno"

void setup () {
  size (900, 900);
}

void draw () {
  
  background (bg);
  fill(fg);
  noStroke();

//decido che voglio 6 colonne e 6 righe
  float tilesX = 6;
  float tilesY = tilesX;

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      float posX = tileW * x;
      float posY = tileH * y;
      
      //vado ad animare il tutto 
      float wave = sin(radians(frameCount + x * 10 + y * 10));
      float mappedWave = map(wave, -1,1,0,5);
      
      int selector = int(mappedWave);
      
//disegno la curva che andrà a ripetersi nella griglia finale
      pushMatrix();
      translate(posX, posY);
      if (selector == 0) {
        arc(0, 0, tileW*2, tileH*2, radians(0), radians(90));
      } else if (selector == 1) {
        arc(tileW, 0, tileW*2, tileH*2, radians (90), radians(180));
      } else if (selector == 2) {
        arc (tileW, tileH, tileW*2, tileH*2, radians(180), radians(270));
      } else if (selector == 3) {
        arc (0, tileH, tileW*2, tileH*2, radians(270), radians(360));
      } else {
        rect(0, 0, tileW, tileH);
      }

      popMatrix();
    }
  }
}
