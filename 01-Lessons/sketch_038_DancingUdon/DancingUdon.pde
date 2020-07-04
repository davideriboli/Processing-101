/**
 * [010] Rokurokubi or: Living Udon Noodle #1
 *
 * 2013 [+++] @tinytintoto (http://tinytintoto.tumblr.com/post/48837718954)
 */
PVector p1, p2;
Control c1, c2;
Control[] controls = new Control[2];
int c = 0;
final int controlR = 5, fps = 24;
final float noiseScale = 0.5;

void setup() {
  size( 500, 500 );
  frameRate( fps );
  smooth();
  strokeCap(PROJECT);

  p1 = new PVector( width / 2, height / 5, 0.0 );
  p2 = new PVector( width / 2, height * 1.1, 0.0 );
  c1 = new Control( width / 2, height / 5 * 3 );
  c2 = new Control( width / 2, height / 5 * 3 );
  controls[0] = c1;
  controls[1] = c2;
}

void draw() {
  background( 0 );

  float adj = height / 3 * ( abs( width / 2 - c1.x ) + abs( width / 2 - c2.x ) ) / width;

  if ( frameCount % floor( fps / 12 ) == 0 ) {
    controls[ c ].moveTo( noise( frameCount * noiseScale ) * width, height / 5 * 3 + adj );
    c = ( c + 1 ) % controls.length;
  }

  c1.update();
  c2.update();
  p1.set( p1.x, height / 5 + adj, 0.0 );

  noFill();
  stroke( 255 );
  strokeWeight( 35 );
  bezier( p1.x, p1.y, c1.x, c1.y, c2.x, c2.y, p2.x, p2.y );

  // Uncomment below to draw anchor points and control points of bezier curve.
  /*
   stroke( 255, 0, 0 );
   strokeWeight( 1 );
   line( p1.x, p1.y, c1.x, c1.y );
   line( p2.x, p2.y, c2.x, c2.y );
   fill( 255, 0, 0 );
   noStroke();
   ellipse( p1.x, p1.y, 10, 10 );
   ellipse( p2.x, p2.y, 10, 10 );
   ellipse( c1.x, c1.y, controlR, controlR );
   ellipse( c2.x, c2.y, controlR, controlR  );
   */
}

class Control {
  public PVector p;
  public float x, y;
  PVector d;
  float dur = 8;

  Control( float _x, float _y ) {
    p = new PVector( _x, _y, 0.0 );
    d = new PVector( _x, _y, 0.0 );

    x = _x;
    y = _y;
  }

  void moveTo( float _x, float _y ) {
    d.set( _x, _y, 0.0 );
  }

  void update() {
    x += ( d.x - x ) / dur;
    y += ( d.y - y ) / dur;
    p.set( x, y, 0.0 );
  }
}
