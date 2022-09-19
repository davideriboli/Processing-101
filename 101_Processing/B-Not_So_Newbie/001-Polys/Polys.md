---
tags: ['background','beginRecord','beginShape','color','draw','else','endRecord','endShape(CLOSE)','fill','float','for','get','getColor','if','imageMode','import','int','loadImage','map','mouseClicked','mouseX','mouseY','noStroke','PImage','polygon','print','save','setup','size','vertex','void']  
---

#### Code

- [References](https://processing.org/reference/)
- [Source](http://fyprocessing.tumblr.com/post/40042967240/etohehir-this-is-my-first-project-for-my)

``` java
import processing.pdf.*;

//Variables
int s;
int x;
int y;
float rad;

PImage img;
int opacity;

int drawLength = 10;

void setup() {
  
  //Window
  size(700 , 700);
  beginRecord(PDF, "output.pdf");
  
  img = loadImage("image.jpg");
  imageMode(CENTER);
  
  //Shape Stuff
  x = width/2;
  y = height/2;
  
  opacity = 20;
  
  //Styling
  fill(255, 255);
  noStroke();
  background(255);
}

void draw() {
  int points = int(map(mouseY, 0, height, 3, 12));
  s = int(map(mouseX, 0, width, 5, 500));

  polygon(points);
}

void mouseClicked(){
  print("Image Saved!");
  save("export.png");
  endRecord();
  //exit();
}

void getColor(int xPt, int yPt){
  if (xPt > width || yPt >= height || xPt <= 0 || yPt <= 0){
    color pix = 255;
  }
  else{
    color pix = img.get(xPt, yPt);
    fill(pix, opacity);
  }
}

void polygon(int points) {
  //Draws a polygon based on how many points you want.
  //Set rotation and angle values.
  float r = 360/points;
  float a = 0;

  //Create x and y arrays.
  float[] locX = new float[points];
  float[] locY = new float[points];
  float[] locX2 = new float[points];
  float[] locY2 = new float[points];

  //Draw a shape on top of each point of the main shape drawn.

  //Dynamically draw big shape.
  getColor(x, y);
  
  beginShape();
  for (int k = 0; k < points; k++)
  {
    for (int j = 0; j < points; j++) {
      a = 0;
      for (int i = 0; i < points; i++)
      {
        //Sets x and y values of individual points, based
        //on rotation from center point.
        float px = x + cos(radians(a)) * s;
        float py = y + sin(radians(a)) * s;

        //Increase angle to set the next point.
        a += r;

        //Set the vertex.
        vertex(px, py);

        //Add x and y values to separate arrays.
        locX[i] = px;
        locY[i] = py;
      }
      endShape(CLOSE);
      //Set new centerpoint to an individual point

      float newX = locX[j];
      float newY = locY[j];
      //Draw shapes!
      getColor(int(newX), int(newY));
      
      beginShape();
      for (int i = 0; i < points; i++)
      {
        //Sets x and y values of individual points, based
        //on rotation from center point.
        float px = newX + cos(radians(a)) * s/3;
        float py = newY + sin(radians(a)) * s/3;

        //Increase angle to set the next point.
        a += r;

        //Set the vertex.
        vertex(px, py);

        //Second array time!
        locX2[i] = px;
        locY2[i] = py;
      }
      endShape(CLOSE);

      float newX2 = locX2[k];
      float newY2 = locY2[k];
      //Draw shapes!
      
      getColor(int(newX2), int(newY2));
      
      beginShape();
      for (int i = 0; i < points; i++)
      {
        //Sets x and y values of individual points, based
        //on rotation from center point.
        float px = newX2 + cos(radians(a)) * s/5;
        float py = newY2 + sin(radians(a)) * s/5;

        //Increase angle to set the next point.
        a += r;

        //Set the vertex.
        vertex(px, py);
      }
      endShape(CLOSE);
    }
  }
}



```

---

