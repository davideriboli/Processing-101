---
tags: ['background','displayHeight','displayWidth','draw','line','random','setup','size','stroke','void']  
---

#### Code

``` java

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  stroke(0,250,0);
  line(width/2, height/2, random(width), random(height));
}


/*
void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  background(0);
  stroke(0,250,0);
  line(width/2, height/2, random(width), random(height));
}
*/

```

---

#### References

- [background](https://processing.org/reference/background_.html)
- [displayHeight](https://processing.org/reference/displayHeight.html)
- [displayWidth](https://processing.org/reference/displayWidth.html)
- [draw](https://processing.org/reference/draw_.html)
- [line](https://processing.org/reference/line_.html)
- [random](https://processing.org/reference/random_.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [stroke](https://processing.org/reference/stroke_.html)
- [void](https://processing.org/reference/void.html)