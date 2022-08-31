---
tags: ['background','draw','ellipse','fill','float','if','noStroke','setup','size','void']  
---

#### Code

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

#### References

- [background](https://processing.org/reference/background_.html)
- [draw](https://processing.org/reference/draw_.html)
- [ellipse](https://processing.org/reference/ellipse_.html)
- [fill](https://processing.org/reference/fill_.html)
- [float](https://processing.org/reference/float.html)
- [if](https://processing.org/reference/if.html)
- [noStroke](https://processing.org/reference/noStroke_.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [void](https://processing.org/reference/void.html)
---
