/*
* [001]Heartbeat#1 ( http://tinytintoto.tumblr.com/post/47719780928 )
*/
int x, y;
int r, c;
float sz;
final int spd = 24;

void setup() {
   // setup drawing properties
   size(500, 500);
   frameRate(24);
   smooth();
   noStroke();
   
   x = floor(width / 2);
   y = floor(height / 2);
   r = floor(width / 8);
   c = -90;
}

void draw() {
   background(0);
  
   c = (c >= 180)
     ? ( c + spd ) % 180 - 180
     : c + spd;
   
   // draw ellipse
   sz = r * max( 1.15, abs( atan( radians( c ) ) ));
   
   fill(227, 0, 0);
   ellipse(x, y, sz, sz);
}
