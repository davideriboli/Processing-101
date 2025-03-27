---
tags: ['[]','background','beginShape','colorMode','curveVertex','draw','else','endShape','float','if','int','noFill','noise','random','round','setup','size','smooth','stroke','strokeCap(ROUND)','strokeJoin(ROUND)','strokeWeight','void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](https://www.catodo.net)

``` java

/*
* Artwork exposed during the LAMPO Exhibition
* http://www.lampo.info
*/
 
float xc, yc, r, g, b;
float num = 1;
int[][] colors = {{51,157,6},{150,150,150}};
int flag = 0;

void setup() {
  size(1024, 768);
  colorMode(RGB, 100);
  background(0, 0, 0);
  smooth();
  noFill();
  strokeCap(ROUND);
  strokeJoin(ROUND);
  xc = width/2 + random(-width/4, width/4);
  yc = height/2 + random(-height/4, height/4);
}

void draw() {
  if (num<80) {
    xc += random(-width/20,width/20);
    yc += random(-width/20,width/20);
    stroke(colors[flag][0],colors[flag][1],colors[flag][2],num);
    strokeWeight(1/num * 150);
    generate(xc+noise(xc), yc+noise(yc), round(num % 34));
    num += 0.2;
  } else {
    num = 0;
    flag = 1 - flag;
    xc = width/2 + random(-width/4, width/4);
    yc = height/2 + random(-height/4, height/4);
  }
}

void generate (float xc, float yc, int num_points){
  float x;
  float y;
  beginShape();
  float al = 2*PI / num_points;
  float rd = random(-width/15,width/15);
  beginShape();
  for (int i = 0; i < num_points+3; i++)
  {
    x = xc + cos(al*i) * rd + random(-30, 30);;
    y = yc + sin(al*i) * rd + random(-30, 30);;
    curveVertex(x, y);
  }
  endShape();
}
```

---

