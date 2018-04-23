// VERY SIMPLE PALETTE GRAB by Steve Edwards
 
// Pick colours from a loaded image to add to a pallet array
// to easily paste and use in another sketch
// click on the image to add a colour value to the palette array.
// Press 'r' to reset
// Press 'p' to print a palette array in the console
 
// output eg. " color[] palette = {#A26A53,#ADBDBC,#082A46,#879C97,#D7E7E7,#8A7361} "
 
 
/// IMAGE VARIABLES
PImage img;  
String filename = "snap"; // replace with your own image
String extension = ".png";
 
/// PALETTE SETUP
ArrayList<Integer> colors = new ArrayList<Integer>(); // Arraylist for color values of our palette
ArrayList<PVector> colPos = new ArrayList<PVector>(); // Arraylist for position of colour
 
int palHeight = 50; // height of pallet GUI
float dotR = 25;
boolean hover = false;
 
int currentDot = -1;
 
void setup() {
  size(500, 500); // dummy size for setup
 
  // load the image
  img = loadImage(filename + extension);
 
  // resize the canvas to the image size and add room for the palette
  surface.setSize(img.width, img.height+palHeight);
 
  cursor(CROSS);
 
  background(0);
}
 
void draw() {
  image(img, 0, 0);  //draw image
 
 
 
  for (int k = 0; k < colors.size(); k++) {
    color palCol = colors.get(k);
    float x = colPos.get(k).x;
    float y = colPos.get(k).y;
    //color cc = img.get(int(x), int(y));
    stroke(255);
    if (dist(mouseX, mouseY, x, y) < dotR/2) { // if your mouse is hovering over the dot
      strokeWeight(10);
      hover = true;
      currentDot = k;
      //println(currentDot);
    } else {
      strokeWeight(5);
    }
    fill(255);
    textSize(10);
    text(k+1, x+dotR/2, y-dotR/2);
 
    fill(palCol);
    ellipse(x, y, dotR, dotR);
 
 
    // draw palette below the image
 
    noStroke();
    fill(palCol);
   
    rect(k*img.width/colors.size(), img.height, img.width/colors.size(), palHeight);
   
    fill(255);
    textSize(20);
    text(k+1, k*(img.width/colors.size()), img.height+15);
  }
  if (!hover) currentDot = -1;
  //println(currentDot);
  hover = false;
}
 
 
void mousePressed() {
  if (currentDot == -1) {
    colPos.add(new PVector(mouseX, mouseY));
    color cc = img.get(int(mouseX), int(mouseY));
    colors.add(cc);
  }
}
 
void mouseDragged() {
  if (currentDot>=0) {
    colPos.set(currentDot, new PVector(mouseX, mouseY));
    color cc = img.get(int(mouseX), int(mouseY));
    colors.set(currentDot, cc);
  }
}
 

void keyPressed() {
  if (key == 'r' || key == 'R') {
    colors.clear();
    background(0);
    redraw();
  }
  if (key == 'p' || key == 'P') {
    print("color[] palette = {");
    for (int i = 0; i < colors.size(); i++) {
      color c = colors.get(i);
      if (i == colors.size()-1) {
        print("#"+hex(c, 6));
      } else {
        print("#"+hex(c, 6)+",");
      }
    }
    print("};");
  }
}
