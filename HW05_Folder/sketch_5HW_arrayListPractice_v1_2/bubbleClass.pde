class bubble {
  float x, y, sz;
  float offset;
  float t;

  bubble(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
  }

  void update() {
    display();
    move();
  }

  void lnDraw(bubble other){
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
    x+=random(-1, 1);
  }
}

