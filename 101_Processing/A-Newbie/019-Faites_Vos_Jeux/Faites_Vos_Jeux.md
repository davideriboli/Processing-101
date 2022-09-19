---
tags: ['==','background','draw','ellipse','fill','height','if','int','mousePressed','noStroke','random','setup','size','void','width']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
/*
Start the sketch, click to play and,
after a couple of rolls try to write your own version.
*/

// !!! DO NOT READ MORE !!! \\

void setup() {
  size(150, 150);
  background(255);
  noStroke();
  fill(0);
}

void draw() {
}

void mousePressed() {
  background(255);
  int v = int(random(1,7));
  //println(v);

  if (v==1) {
    ellipse(width/2, height/2, 25, 25);
  }
  if (v==2) {
    ellipse(width-25, 25, 25, 25);
    ellipse(25, height-25, 25, 25);
  }
  if (v==3) {
    ellipse(width-25, 25, 25, 25);
    ellipse(width/2, height/2, 25, 25);
    ellipse(25, height-25, 25, 25);
  }
  if (v==4) {
    ellipse(width-25, 25, 25, 25);
    ellipse(25, 25, 25, 25);
    ellipse(25, height-25, 25, 25);
    ellipse(width-25, height-25, 25, 25);
  }
  if (v==5) {
    ellipse(width-25, 25, 25, 25);
    ellipse(25, 25, 25, 25);
    ellipse(width/2, height/2, 25, 25);
    ellipse(25, height-25, 25, 25);
    ellipse(width-25, height-25, 25, 25);
  }
  if (v==6) {
    ellipse(width-25, 25, 25, 25);
    ellipse(25, 25, 25, 25);
    ellipse(25, height/2, 25, 25);
    ellipse(25, height-25, 25, 25);
    ellipse(width-25, height-25, 25, 25);
    ellipse(width-25, height/2, 25, 25);
  }
}
```

---
