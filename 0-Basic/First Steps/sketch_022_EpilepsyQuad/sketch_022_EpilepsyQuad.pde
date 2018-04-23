/*

I've seen this code on http://vimeo.com/45573600/
It's not very difficult. Take a look at it and:
1] try to understand how it works;

2] Rectsmodify just a line and add another line to obtain
a new animation with centered rects and random colors;

3] Modify two lines to obtain the same anim of point 2, but with circles;

4] Modify just a value to obtain the same anim again, but with random ellipses.

*/
    


int rectsize = 100;
int rectcount = 10;

void setup() {
  size(500, 500);
}

void draw() {
  for (int x = 0; x<rectcount; x++) {
    for (int y = 0; y<rectcount; y++) {
      fill(random(0, 255));
      float s = random(0, rectsize);
      rect(x*100, y*100, s, s);
    }
  }
}
