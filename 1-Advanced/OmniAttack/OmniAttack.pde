//Coded by TinyTonto (http://bit.ly/2Hm1UFN)


/*
 * [018] Omnidirectional Attack #1
 *
 * 2013 [+++] @tinytintoto
 */
float dist, theta = 0, rot = 0.25, velocity = 1;
ArrayList dots = new ArrayList();
PVector center;
Dot d;

void setup() {
  size(500, 280, OPENGL);
  frameRate(60);
  smooth();
  noStroke();
  
  center = new PVector( width/2, height/2, 0.0 );
  dist = height / 10;
}

void draw() {
  background(0);

  for ( int i = dots.size() - 1; 0 <= i; i-- ) {
    d = (Dot)dots.get(i);
    d.update();
    d.render();
    if ( d.sweep ) {
      dots.remove(i);
    }
  }

  dots.add( new Dot(dist * cos(theta), 
  dist * sin(theta), 
  new PVector(velocity*cos(theta), velocity*sin(theta)) ));

  theta += rot;
}

class Dot {
  private PVector loc, vel;
  private float r;
  private color col;
  public boolean sweep = false;

  Dot( float x, float y, PVector v ) {
    loc = new PVector( x, y, 0.0);
    vel = v;
    r = height/40;
    col = color( 255 );
  }

  void update() {
    loc.add( vel );
    if ( loc.mag() > width ) {
      sweep = true;
    }
  }

  void render() {
    pushMatrix();
    translate( loc.x + center.x, loc.y + center.y );
    fill(col);
    ellipse( 0, 0, r, r );
    popMatrix();
  }
}
