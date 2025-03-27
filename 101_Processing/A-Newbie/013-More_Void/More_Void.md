---
tags: ['background','draw','keyPressed','line','mouseDragged','mouseX','mouseY','pmouseX','pmouseY','setup','size','stroke','void']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
void setup() {
  size(200, 200);
  background(255);
}

void draw() {
}

void mouseDragged() {
  stroke(0);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  background(255);
}


```

---
