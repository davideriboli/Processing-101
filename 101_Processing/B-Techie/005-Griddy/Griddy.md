---
tags: ['&&','++','+=','==','TWO_PI','[]','boolean','draw','ellipse','fill','float','for','frameCount','if','int','map','noStroke','offSet','random','rect','rectMode','saveFrame','setup','sin','size','void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://p5art.tumblr.com/)

``` java



    int div = 10, unit, cx, cy, rx, ry;
    float theta;
    float[] off = new float[div*div];
    boolean[] rec = new boolean[div*div];
     
    void setup() {
      size(400, 400);
      unit = width/div;
      noStroke();
      rectMode(CENTER);
      for (int i=0; i<rec.length; i++) {
        off[i]= random(TWO_PI);
        if (random(1)>0.3) rec[i]= true;
      }
    }
     
    void draw() {
      background(20);
      for (int i=0; i<div; i++) {
        for (int j=0; j<div; j++) {
          cx = (i*unit+unit/2);
          cy = (j*unit+unit/2);
          float sz = unit*.9;
          fill(255);
          ellipse(cx, cy, sz, sz);
        }
      }
      for (int i=1; i<div; i++) {
        for (int j=1; j<div; j++) {
          if (rec[j*div+i]) {
            rx = (i*unit);
            ry = (j*unit);
            float offSet = off[j*div+i] ;
            float sz = map(sin(theta+offSet), -1, 1, 0, unit*1.0);
            fill(20);
            rect(rx, ry, sz, sz);
          }
        }
      }
      theta += 0.0523/2;
     
      //if (frameCount%2==0 && frameCount<241) saveFrame("image-###.gif");
     
    }
```

---

