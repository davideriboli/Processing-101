---
tags: ['background','draw','mouseX','mouseY','pmouseX','pmouseY','setup','size','stroke','strokeWeight','void']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
void setup() {
  size(255, 255);
  background(255);
}

void draw() {
  strokeWeight(10);
  stroke(255,0,0);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

/*
By changing a single line of code, what should
you do to get a red line changing its intensity
relative to the position of the mouse
[0,0 = very dark red, almost black | 255,255 = full, intense red]?
*/

```

---
