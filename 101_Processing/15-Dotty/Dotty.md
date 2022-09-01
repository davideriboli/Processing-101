---
tags: ['background','ellipse','fill','noStroke','random','setup','size','void']  
---

#### Code

``` java
/*
Do not read the following lines!
Just execute the sketch and try
to understand every action. Then
try to write the right code to 
produce the same, by yourself.
*/

// !! DON'T READ MORE !!! \\




















































































float r;
float g;
float b;
float a;
float diam;
float x;
float y;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);

  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);
}
```

---

#### References

- [background](https://processing.org/reference/background_.html)
- [ellipse](https://processing.org/reference/ellipse_.html)
- [fill](https://processing.org/reference/fill_.html)
- [noStroke](https://processing.org/reference/noStroke_.html)
- [random](https://processing.org/reference/random_.html)
- [setup](https://processing.org/reference/setup_.html)
- [size](https://processing.org/reference/size_.html)
- [void](https://processing.org/reference/void.html)
---
