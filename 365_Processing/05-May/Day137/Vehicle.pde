// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  float r;


  Vehicle(PVector l, float ms, float mf) {
    location = l.get();
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = 0;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if (d < 20.2) {        
        stroke(0);
        line(location.x, location.y, other.location.x, other.location.y);
      }

      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        
        sum.add(diff);
        count++;
      }
    }

    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
}
