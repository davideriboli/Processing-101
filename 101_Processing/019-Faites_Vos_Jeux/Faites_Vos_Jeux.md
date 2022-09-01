---
tags: ['==','background','draw','ellipse','fill','height','if','int','mousePressed','noStroke','random','setup','size','void','width']  
---

#### Code

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

#### References

- [background](https://processing.org/reference/background_.html)
- [draw](https://processing.org/reference/draw_.html)
- [ellipse](https://processing.org/reference/ellipse_.html)
- [fill](https://processing.org/reference/fill_.html)
- [height](https://processing.org/reference/height.html)
- [if](https://processing.org/reference/if.html)
- [int](https://processing.org/reference/int.html)
- [mousePressed](https://processing.org/reference/mousePressed_.html)
- [noStroke](https://processing.org/reference/noStroke_.html)
- [random](https://processing.org/reference/random_.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [void](https://processing.org/reference/void.html)
- [width](https://processing.org/reference/width.html)

---
