class PixelParticle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector dir;
  float mass;

  PixelParticle(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {

    //    target = new PVector(mouseX,mouseY);
    //    dir = PVector.sub(target,location);
    //    dir.setMag(0.5);
    //    acceleration = dir;

    velocity.add(acceleration);
    //velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    noStroke();
    rect(location.x, location.y, 1*mass, 1*mass);
  }

  void checkEdges() {
    if (location.x > width-20) {
      velocity.x = -velocity.x;
      applyForce(new PVector(-10,0));
    }
    else if (location.x < 0) {
      velocity.x = -velocity.x;
    }
    if (location.y > height-50) {
      velocity.y = -velocity.y;
      location.y = height-50;
    }
    else if (location.y < 0) {
      velocity.y = -velocity.y;
    }
    if (location.y >= height-50) {
      velocity.x = 0;
    }
  }
}

