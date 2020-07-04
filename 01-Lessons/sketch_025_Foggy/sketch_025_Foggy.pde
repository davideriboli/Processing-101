//http://blog.jamesmakes.com/post/44410635261

int tAngle = 360/4*3;

void setup() {
size(640, 480);
noStroke();
} 

void draw() {
background(0);
translate(width/2,height/2);
for (int i=0; i<tAngle; i++){
pushMatrix();
rotate(radians(i));
fill(255,5);
arc(0,0,i,i,0,radians(i));
popMatrix();
}
}
