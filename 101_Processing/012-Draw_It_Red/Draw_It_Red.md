---
tags: ['background','mouseX','mouseY','pmouseX','pmouseY','setup','size','stroke','strokeWeight','void']  
---

#### Code

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

#### References

- [background](https://processing.org/reference/background_.html)
- [mouseX](https://processing.org/reference/mouseX.html)
- [mouseY](https://processing.org/reference/mouseY.html)
- [pmouseX](https://processing.org/reference/pmouseX.html)
- [pmouseY](https://processing.org/reference/pmouseY.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [stroke](https://processing.org/reference/stroke_.html)
- [strokeWeight](https://processing.org/reference/strokeWeight_.html)
- [void](https://processing.org/reference/void.html)
---
