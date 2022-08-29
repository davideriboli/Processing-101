---
tags: ['point','size','stroke','strokeWeight',]  
---

#### Code

``` java
/*
A point is defined by two numerical values representing its X and Y coordinates.
In this sketch, after deciding on a color to draw with,
we generate nine points of progressively greater size, all on the same axis.

As you can see, these are very repetitive instructions.
You will soon learn how to achieve the same result with much more concise syntax.
*/

size(600, 200);

//The color of the "pencil"
stroke(#607F9C);

//The point of the first "pencil" is 5 pixels
strokeWeight(5);
point(100, 100);

strokeWeight(10);
point(150, 100);

strokeWeight(15);
point(200, 100);

strokeWeight(20);
point(250, 100);

strokeWeight(25);
point(300, 100);

strokeWeight(30);
point(350, 100);

strokeWeight(35);
point(400, 100);

strokeWeight(40);
point(450, 100);

strokeWeight(45);
point(500, 100);




```

---

#### References

- [point](https://processing.org/reference/point_.html)
- [stroke](https://processing.org/reference/stroke_.html)
- [strokeWeight](https://processing.org/reference/strokeWeight_.html)

---
