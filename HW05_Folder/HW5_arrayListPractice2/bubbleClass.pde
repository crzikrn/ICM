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

  void inDraw(Bubble other){
    line(x,y,other.x,other.y);
  }

  void display() {
    noFill();
    ellipse(x, y, sz, sz);
    if (y<-sz) {
      y = height+sz*2;
    }
  }

  void move() {
    //y--;
    x+=random(-2, 0.5);
  }
}

