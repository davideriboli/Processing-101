/*
Start the code. Look at result.
Then try to sketch it by yourself,
in no more than 9 lines of code.
*/

// !!! DON'T READ MORE !!! \\\

void setup() {
  size(200, 200);
} 
void draw() {
  background(0);
  rectMode(CENTER);
  fill(random(255), random(255), random(255), random(255));
  rect(width/2, height/2, (random(width)), (random(height)));
}

