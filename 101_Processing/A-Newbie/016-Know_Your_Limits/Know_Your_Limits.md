---
tags: ['background','ellipse','fill','float','if','noStroke','println','random','setup','size','void']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
/*
After analyzing the code below,
try changing it so that the circle
bounces at the contact of the circumference
[currently reacts to contact with the center]
and add the necessary instructions
to change the fill color at every bounce.
*/

// THIS SKETCH COMES FROM THE WORK OF \\
// ABE PAZOS @ FUNPROGRAMMING.ORG [THANKS!] \\

// Starting position
float circle_x = 100;
float circle_y = 0;

// Moving step
float move_x = 2;
float move_y = -2;

void setup() {
  size(400, 200);
}

void draw() {
  background(#21EA73);
  fill(255);
  noStroke();
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;

  if (circle_x > width) {
    circle_x = width; // Keep it inside
    move_x = -move_x; // Move it backward
    println("Too far right");
  }

  if (circle_y > height) {
    circle_y = height; // Keep it inside
    move_y = -move_y; // Move it backward
    println("Too far bottom");
  }

  if (circle_x < 0) {
    circle_x = 0; // Keep it inside
    move_x = -move_x; // Move it forward
    println("Too far left");
  }

  if (circle_y < 0) {
    circle_y = 0; // Keep it inside
    move_y = -move_y; // Move it forward
    println("Too far top");
  }
}

/*
Do not continue reading
if you want to do it alone
the following lines contain
the answer to the question!
*/

// !!! DON'T READ MORE !!! \\\



























/*
float circle_x = 100;
float circle_y = 0;
float r = 255;
float g = 255;
float b = 255;

float move_x = 2;
float move_y = -2;

void setup() {
  size(400, 200);
}

void draw() {
  background(#21EA73);
  smooth();
  fill(r, g, b);
  noStroke();
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;

  if (circle_x > width-20) {
    r=255;
    g=0;
    b=0;
    circle_x = width-20;
    move_x = -move_x;
    println("Too far right");
  }

  if (circle_y > height-20) {
    r=0;
    g=0;
    b=255;
    circle_y = height-20;
    move_y = -move_y;
    println("Too far bottom");
  }

  if (circle_x < 20) {
    g=0;
    b=0;
    r=0;
    circle_x = 20;
    move_x = -move_x;
    println("Too far left");
  }

  if (circle_y < 20) {
    g=255;
    b=255;
    r=255;
    circle_y = 20;
    move_y = -move_y;
    println("Too far top");
  }
}
*/
```

---
