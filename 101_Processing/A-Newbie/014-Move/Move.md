---
tags: ['background','draw','ellipse','fill','float','if','noStroke','setup','size','void']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
float circleX=0;
float circleY=100;

void setup () {
  size(200, 200);
}

void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  ellipse(circleX, circleY, 50, 50);
  circleX=circleX+1;
  if (circleX>width+25) {
    circleX=-25;
  }
}

/*
What should you do to fill the
dot with an ever new colour?
*/
```

---
