

// Code by Davide Riboli ///
// August 2012 ////////////

//The basic ingredient
float a = 0;

void setup() {

  //Other Ingredients
  background(0);
  size(500, 500);
  noFill();
  strokeWeight(2);
  smooth();
  colorMode(HSB);

  //The oven [just to bake the starting image] 
  while (a < TWO_PI) {  
    float x = width/2 + cos(a) * 150;
    float y = height /2 + sin(a) * 150;

    stroke(255, 100, 100);
    ellipse (x, y, 10, 10);
    a = a + 0.1;
  }
}


void draw() {
  //Really void
}

void mouseMoved() {

  //This is to stop the drawing loop  
  background(0);
  if (a>TWO_PI) {
    a=0;
  }

  //This is the magick
  while (a < TWO_PI) {  
    float x = width/2 + cos(a) * 150;
    float y = height /2 + sin(a) * 150;

    stroke(255, 100, 100);
    ellipse (x, y, 1+mouseX, 1+mouseY);
    a = a + 0.1;
  }
}

//And a closing little saver
void keyPressed() {
  if (keyPressed) {

    if (key == 's' || key == 'S') {
      save("MathLoom.png");
      println("Image Saved!");
    }
    else {
      println("To save, use the 's' key.");
    }
  }
}
