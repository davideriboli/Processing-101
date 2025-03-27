---
tags: ['++', 'PImage', 'background', 'createImage', 'draw', 'filter', 'float', 'for', 'frameRate', 'get', 'image', 'int', 'loadImage', 'loadPixels', 'map', 'saveFrame', 'setup', 'sin', 'size', 'theta', 'tint', 'updatePixels', 'void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://pastebin.com/iZwCCQff)

``` java
PImage img;
float theta;
int slices=200, unit;
PImage[] rSlices = new PImage[slices];
PImage[] lSlices = new PImage[slices];
 
void setup() {
  img = loadImage("image.jpg");
  size(640,480);
  unit = height/slices;
  background(255);
  frameRate(15);
 
  for (int i=0; i<slices; i++) {
    rSlices[i] = createImage(width/2, unit, RGB);
    rSlices[i].loadPixels();
    lSlices[i] = createImage(width/2, unit, RGB);
    lSlices[i].loadPixels();
    for (int x=width/2; x<width; x++) {
      for (int y=0; y<unit; y++) {
        rSlices[i].pixels[y*width/2+x-(width/2)]=img.get(x, i*unit);
        lSlices[i].pixels[y*width/2+x-(width/2)]=img.get(x-width/2, i*unit);
      }
    }
    rSlices[i].updatePixels();
    lSlices[i].updatePixels();
    //image(pslices[i], width/2, i*unit);
  }
}
 
void draw() {
  tint(255, 255);
  image(img, 0, 0);
  filter(BLUR);
  tint(255, 150);
  for (int i=0; i<slices; i++) {
    float offSet = map(sin(theta+(TWO_PI/slices*i)), -1, 1, 0, width/4);
    float offSet2 = map(sin(-theta+(TWO_PI/slices*i)), -1, 1, -width/4, 0);
    image(rSlices[i], width/2+offSet, i*unit);
    image(lSlices[i], offSet2, i*unit);
  }
  filter(BLUR);
  theta += .0523;
  //theta += (TWO_PI/15);
  //if (theta<TWO_PI) saveFrame("image-###.gif");
}
```

---

