class Bubble {
  float x, y, sz;
  float offset;
  float t;

  Bubble(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
  }

  void update() {
    display();
    move();
  }

  void lnDraw(Bubble other) {
    line(x, y, other.x, other.y);
  }

  void display() {
    ellipse(x, y, sz, sz);
    if (x>width-1) {
      fill(random(255), random(255), random(50), random(255));
    }
  }

  void move() {
    y+=random(-2, 2);
    x++;
  }
}

