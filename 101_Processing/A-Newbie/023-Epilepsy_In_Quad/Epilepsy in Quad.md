---
tags: ['++','draw','fill','float','for','int','random','setup','size','void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://vimeo.com/45573600/)

``` java
/*
It's not a very difficult code. Take a look at it and:
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


```

---

