---
tags: ['background','fill','noStroke','rect','rectMode']  
---

#### Code

``` java
/*
  Colors are defined by numbers [0-255]
  Use a single number to work with gray scale
  Use 3 numbers, to work with RGB value
*/

size(200, 200);

// The following line draws a gray background.
background (155);

// And this a red one.
// background (155,0,0);

// Headache in 3, 2, 1...

/*
  background (155);
  fill (0,255,0); //Please note that exists even noFill();
  stroke (0,0,255); //Please note that exists even noStroke();
  rectMode(CENTER); //A new way to draw a rect, setting the origin point.
  rect(width/2,height/2,50,50);
*/

// RGB now!
/*
  background (255);
  noStroke();
  fill (255,0,0);
  rect(0,0,width/2,height/2);
  noStroke();
  fill (0,255,0);
  rect(width/2,0,width/2,height/2);
  noStroke();
  fill (0,0,255);
  rect(0,height/2,width/2,height/2);
*/

/*
Now try on your own to generate three squares
of different colors and one white square in
a different location.
*/
```

---

#### References

- [background](https://processing.org/reference/background_.html)
- [fill](https://processing.org/reference/fill_.html)
- [noStroke](https://processing.org/reference/noStroke_.html)
- [rect](https://processing.org/reference/rect_.html)
- [rectMode](https://processing.org/reference/rectMode_.html)

---
