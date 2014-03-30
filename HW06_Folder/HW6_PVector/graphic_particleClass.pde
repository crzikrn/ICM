class Grapp {
  PVector location;
  PVector velocity;
  float size;

  Grapp(float _x, float _y,float _size) {
    location = new PVector(_x, _y);
    size = _size;
  }

  void update() {
    velocity = new PVector(0, random(-1, 1));
    location.add(velocity);
  }

  void display() {
    ellipse(location.x, location.y, size, size);
    vertex(location.x, location.y);
    }
}

