/*
 * [007] Tongue #1
 *
 * 2013 [+++] @tinytintoto (http://tinytintoto.tumblr.com/post/48332944201 )
 */
int c;
float r;
final int maxdeg = 1080;
final int spd = 1;

void setup(){
   size(500, 500);
   colorMode(HSB, 360,100,80);
   smooth();
   frameRate(24);
   background(0);
   
   noStroke();
   fill( 360, 100, 100 );
   
   c = maxdeg;
}

void draw(){
   translate( width/2, height/2);
   for( int i = c; i >= c; i -= spd){
       r = width * pow(i , 2) / pow(maxdeg, 2);
       float rad = radians(i);
       pushMatrix();
         translate( r * cos(rad), r * sin(rad) );
         ellipse( 0, 0, r/1.5, r/1.5 );
       popMatrix();
   }

   c -= spd;
   if( c == 0 ){
       c = maxdeg;
       background(0);
   }
}
