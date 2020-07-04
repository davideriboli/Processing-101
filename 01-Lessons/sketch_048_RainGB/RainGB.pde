/*
* [003] RGB#1 ( http://tinytintoto.tumblr.com/post/47870445483 )
*/
int c;
int lw, lh;
final int w = 20, h = 50;

void setup() {
  size(500,500);
  frameRate(12);
  smooth();

  lw = floor(width / w);
  lh = floor(height / h);
  c = 0;

  noStroke();
}

void draw() {
  background(0);
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      rgb(i, j);
    }
  }
}

void rgb( int x, int y ){
  pushMatrix();
  translate(x * lw, y * lh);
  fill(getColor(y % 3));
  rect(1, 1, floor(lw/3) - 1, lh - 2);
  translate(floor(lw / 3), 0);
  fill(getColor((y + 1) % 3));
  rect(1, 1, floor(lw/3) - 1, lh - 2);
  translate(floor(lw / 3), 0);
  fill(getColor((y + 2) % 3));
  rect(1, 1, floor(lw / 3) - 1, lh - 2);
  popMatrix();
}

color getColor(int n){
  color col = color(0);

  switch(n){
    case 0:
      col = color(c % 256, 0, 0);
      break;
    case 1:
      col = color(0, c % 256, 0);
      break;
    case 2:
      col = color(0, 0, c % 256);
      break;
  }

  c += 7;// or 89
  return col;
}
