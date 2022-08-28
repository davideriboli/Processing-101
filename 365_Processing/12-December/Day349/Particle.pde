class Particle extends VerletParticle2D {
  
  float r;
  
  Particle(Vec2D loc, float r_) {
    super(loc);
    r=r_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*3, -0.5));
  }
  
  void display() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}

