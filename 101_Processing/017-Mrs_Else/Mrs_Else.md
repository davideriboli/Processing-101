---
tags: ['else','fill','height','if','rect','setup','size','void','width']  
---

#### Code

``` java
void setup() {
  size(300, 300);
}
void draw() {
  if (mouseX < width/2) {
    fill(255);
    rect(0, 0, width/2, height);
    fill(0);
    rect(width/2, 0, width, height);
  } 
  else {
    fill(0);
    rect(0, 0, width/2, height);
    fill(255);
    rect(width/2, 0, width, height);
  }
}
```

---

#### References

-[else](https://processing.org/reference/else.html)
- [fill](https://processing.org/reference/fill_.html)
- [height](https://processing.org/reference/height.html)
- [if](https://processing.org/reference/if.html)
- [rect](https://processing.org/reference/rect_.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [void](https://processing.org/reference/void.html)
- [width](https://processing.org/reference/width.html)
---
