float y, theta;
PImage img;
float[] len;
 
void setup() {
  img = loadImage("image.jpg");
  
  //Impostare size sulla grandezza immagine da processare
  
  size(400, 400);
  background(0);
  noFill();
  strokeCap(SQUARE);
  len = new float[height];
  for (int y=0; y<height;y++) {
    len[y]=random(width/2);
  }
}
 
void draw() {
  image(img, 0, 0);
  for (int y=0; y<height;y++) {
    stroke(get(width/2, y), 255);
    float myX = map(sin(theta+TWO_PI/height*y), -1, 1, 0, len[y]);
    line(width/2, y, width/2-myX, y);  
  }
 
  theta += 0.0523*2;
 
  //if (frameCount%2==0 && frameCount<61) saveFrame("DG-###.jpg");
 
 
}
