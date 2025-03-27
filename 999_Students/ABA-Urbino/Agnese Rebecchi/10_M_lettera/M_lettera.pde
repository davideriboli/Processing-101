//Voglio manipolare un elemento di testo.
//credit: https://www.youtube.com/watch?v=SKDhkB8g1So
PGraphics pg;
PFont font;
//dico al programma quale font voglio che utilizzi, dopo averlo inserito in una cartella
//dopodichè imposto colore e grandezza
void setup() {
  font = createFont("Futura XBlk BT.ttf", 600);
  size(800, 800, P2D);
  pg = createGraphics(800, 800, P2D);
  }
  
  void draw() {
    
 background(0);
 
 
 pg.beginDraw();
  pg.background(153, 0, 153);
  pg.fill(0, 204, 0);
  pg.textFont(font);
  pg.textSize(600);
  pg.pushMatrix();
  pg.translate(width/2, height/2);
  pg.textAlign(CENTER, CENTER);
  pg.text("M", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  
  int tilesX = 15;
  int tilesY = 8;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

      //vado a mettere in movimento i vari pezzi della "lettera"
     int wave  = int(sin(frameCount * 0.05 * (x*y) *0.01)*100);
     
      int sx = x * tileW + wave;
      int sy = y * tileH;
      int sw = tileW;
      int sh = tileH;


      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);

    }
  }
  }
