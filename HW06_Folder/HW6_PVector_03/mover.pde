class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float t = 0;
  float x;
 float y;
 float size;

    Mover(float _x, float _y) {
    location = new PVector(width/2,  height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 10;
    x=_x;
    y=-y;
    size = 2;
  }

  void update() {
    //    float n = noise(t);
    //    t+=0.001;
    //    acceleration = PVector.random2D();
    //    acceleration.mult(n);
    PVector mouse = new PVector(x, y);
    PVector dir = PVector.sub(mouse, location);
    
    dir.normalize();
    dir.mult(0.5);
    
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display() {
    smooth();
    //fill(175);
    //noStroke();
    rect(location.x, location.y, random(size*4),size);
    
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y >height) {
      location.x = width/2; 
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }

  void collision(Mover other) {
    if (dist(location.x, location.y, other.location.x, other.location.y) <1) {
      acceleration.mult(-1);
      velocity.mult(-1);
    }
  }
  void mouseDragged() {
    acceleration = new PVector(0, 0.5);
  }

  void mouseReleased() {
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
}

