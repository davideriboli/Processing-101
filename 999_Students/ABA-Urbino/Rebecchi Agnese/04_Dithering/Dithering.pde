//creo un effetto "puntinato" applicabile a una foto
//credit: https://www.youtube.com/watch?v=0L2n8Tg2FwI

PImage Matteo_techno;
void setup() {
  size(960, 960);
  Matteo_techno = loadImage("Matteo_techno.jpg");
  //applico un filtro grigio per avere la foto in bianco e nero
  //in modo che sia più facile prendere i pixel
  Matteo_techno.filter(GRAY);
}

int index(int x, int y) {
  return x + y * Matteo_techno.width;
}


void draw() {
  Matteo_techno.loadPixels();
  for (int y = 0; y < Matteo_techno.height-1; y++) {
    for (int x = 1; x < Matteo_techno.width-1; x++) {
      color pix = Matteo_techno.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      int factor = 1;
      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      Matteo_techno.pixels[index(x, y)] = color( newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;


      int index = index(x+1, y);
      int c = Matteo_techno.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      Matteo_techno.pixels[index] = color(r, g, b);


      index = index(x-1, y+1);
      c = Matteo_techno.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      Matteo_techno.pixels[index] = color(r, g, b);


      index = index(x, y+1);
      c = Matteo_techno.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      Matteo_techno.pixels[index] = color(r, g, b);

      index = index(x+1, y+1);
      c = Matteo_techno.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      Matteo_techno.pixels[index] = color(r, g, b);
    }
  }
  Matteo_techno.updatePixels();
  //vado a posizionare la foto al centro della mia area di lavoro
  image(Matteo_techno, 0, 0);
}
