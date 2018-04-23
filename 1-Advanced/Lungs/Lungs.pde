/*
 * [005] Lung #1
 *
 * 2013 [+++] @tinytintoto (http://tinytintoto.tumblr.com/post/48121186809)
 */
int step, v;
PVector origin, first;
float lineW = 36;
final int maxdpt = 18;
final float attn = 0.666;
final float deg = radians(80);

void setup() {
  size(500, 500);
  frameRate(24);
  stroke(195, 0, 0);
  strokeCap(SQUARE);
  smooth();
  step = 0;
  v = 1;

  origin = new PVector( floor(width / 2), floor(height / 6));
  first = new PVector(0, floor(height / 3));
}

void draw() {
  background(0);
  strokeWeight(lineW);
  line(origin.x, origin.y, origin.x + first.x, origin.y + first.y);

  if ( step > 0 ) {
    branch( min(step, maxdpt), origin, first, lineW * attn);
  }

  step += v;
  if ( step == 0 || step == maxdpt ) {
    v = -(v);
  }
}

void branch(int dpt, PVector org, PVector parent, float lw) {
  PVector leftP = new PVector( parent.x, parent.y );
  PVector rightP = new PVector( parent.x, parent.y );

  leftP.rotate( deg );
  rightP.rotate( -deg );

  leftP.setMag( parent.mag() * attn );
  rightP.setMag( parent.mag() * attn );

  strokeWeight(lw);
  pushMatrix();
    translate(parent.x + org.x, parent.y + org.y);
    line(0, 0, leftP.x, leftP.y);
    line(0, 0, rightP.x, rightP.y);
  popMatrix();

  dpt--;
  if (dpt > 0) {
    branch(dpt, PVector.add(parent, org), leftP, lw * attn);
    branch(dpt, PVector.add(parent, org), rightP, lw * attn);
  }
}
