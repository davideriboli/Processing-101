---
tags: ['++','[]','background','class','draw','drawCircle','ellipse','fill','float','for','int','noStroke','null','random','setup','size','smooth','this','void',]  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://www.local-guru.net/blog/2012/6/27/yellow-circles)

``` java
Circle[] c;
float lastx, lasty;
int idx;
void setup() {
  size(300,300);
  smooth();
  lastx = 0;
  lasty = 0;
  idx = 0; 
  c = new Circle[10]; 
}


void draw() {
  background(0);
  for (int i =0; i < 10; i++) {
    if ( c[(idx+i)%10] != null) {
      drawCircle(c[(idx+i) % 10]);
      c[(idx+i)%10].s -= 0.01;
      if (c[(idx+i)%10].s < 0) c[(idx+i)%10] = null;
    }
  }
  
  if ( sq( mouseX - lastx ) + sq( mouseY - lasty ) > 3200 ) {
    c[idx] = new Circle(lastx, lasty);
    idx++;
    if (idx >= 10) idx = 0;
    lastx = mouseX;
    lasty = mouseY;
  }
}

void drawCircle( Circle c ) {
    noStroke();
    fill(255,255,0);
    ellipse(c.x,c.y,c.r1*c.s,c.r1*c.s);
    fill(0);
    ellipse(c.x,c.y,c.r2*c.s,c.r2*c.s);
    fill(255,255,0);
    ellipse(c.x,c.y,c.r3*c.s,c.r3*c.s);
}

public class Circle {
  float r1,r2,r3;
  float x, y;
  
  float s;
  
  public Circle(float x, float y) {
    s = 1;
    r1 = random(40)+60;
    r2 = r1 * random(.9)+.1;
    r3 = r2 * random(.4)+.4;
    this.x = x;
    this.y = y;
  }
}
```

---

