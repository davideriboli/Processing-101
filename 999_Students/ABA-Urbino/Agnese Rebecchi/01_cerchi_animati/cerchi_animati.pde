//vado a creare un'animazione con delle circonferenze
//credit: https://www.youtube.com/watch?v=QHEQuoIKgNE


//vado a dire al programma che deve prendere le circonferenze dalla scheda a fianco
ArrayList<Circle> circles;

//imposto l'area di lavoro
void setup() {
  size(640, 360);
  circles = new ArrayList<Circle>();
}

void draw() {
  background(0);

  Circle newC = newCircle();

  if (newC != null) {
    circles.add(newC);
  }

//animo le circonferenze

  for (Circle c : circles) {
    if (c.growing) {


      if (c.edges()) {
        c.growing = false;
        
        //faccio in modo che le figure si possano sovrapporre
      } else {
        boolean overlapping = false;
        for (Circle other : circles) {
          float d = dist(c.x, c.y, other.x, other.y);
          
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle newCircle() {

  float x = random(width);
  float y = random(height);


  boolean valid = true;
  for (Circle c : circles) {
    if (c.edges()) {
      c.growing = false;
    }
    c.show();
    c.grow();
  }


  if (valid) {
    return new Circle(x, y);
  } else {
    return  null;
  }
}
