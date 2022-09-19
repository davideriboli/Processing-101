---
tags: ['background','fill','height','line','rect','size','width']  
---

#### Code

- [References](https://processing.org/reference/)

``` java
// Build your window
size (200, 200);

// And cross it in an absolute way...
line(0, 100, 200, 100);
line (100, 0, 100, 200);

// ... or in a relative one.
/*
  line (0,height/2,width,height/2);
  line (width/2,0,width/2,height);
*/

// Let's try again (don't mind the colors, for now)

/*
// A window with a black background
size(200,200);
background(255);

// Three empty square
line (0,height/2,width,height/2);
line (width/2,0,width/2,height);

// And a filled one
fill(0);
rect(0,height/2,width/2,width/2);
*/

// Now try on your own to put the black square in a different position!
```

---
