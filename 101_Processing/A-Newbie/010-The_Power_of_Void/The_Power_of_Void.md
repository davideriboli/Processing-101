---
tags: ['background','displayHeight','displayWidth','draw','line','random','setup','size','stroke','void']  
---

#### Code

- [References](https://processing.org/reference/)

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
