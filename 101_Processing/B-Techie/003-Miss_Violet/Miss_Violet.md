---
tags: ['++','background','beginRecord','beginShape','boolean','colorMode(HSB)','draw','endRecord','endShape(CLOSE)','fill','float','for','import','int','keyPressed','noLoop','random','redraw','setup','size','stroke','strokeWeight','vertex','void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://www.local-guru.net/blog/2013/2/12/violet-abstract-art-generator)

``` java

import processing.pdf.*;

void setup() {
  size(297, 420);
  noLoop();

  beginRecord(PDF, "violet-####.pdf");
  colorMode(HSB); 
}

boolean record = false;

void draw() {
  background(255);

  for ( int i=0; i<20; i++) {
    float h =  200 + random( -10, 10);
      fill(h, 255, 255, 128 + random(30));
    stroke(h, 255, 128, 128 + random(30));
    strokeWeight(2);

    beginShape();
    float x = random( 80, width - 80);
    float y = random( 80, height - 80);
    float r = random( 50, 80);
    for( int j =0; j < 3; j++) {
      vertex( x + random(-r,r), y + random( -r, r ));
    }

    endShape(CLOSE);
  }
  endRecord();
}

void keyPressed() {
  beginRecord(PDF, "violet-####.pdf");
  colorMode(HSB);
  redraw();
}
```

---

