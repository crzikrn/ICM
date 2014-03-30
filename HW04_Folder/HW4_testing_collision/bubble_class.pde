class bubble {
  float x;
  float y;
  float sz;
  float yspd = 1;
  float xspd = 0;

  bubble(float _x, float _y) {
    x = _x;
    y = _y;
    sz = 1;
  } 

  void drawBubble() {
    display();
    fill(random(255), random(255), random(255));
    move();
  }

  void move() {
    x+=xspd;
    y-= yspd;
    if (y<0) {
      y=height;
    }
    if (x>width){
     x = 0; 
    }
    if (x<0){
      x=width;
    }
  }

  void display() {
    ellipse(x, y, sz, sz);
  }
  
  void collide(bubble other) {
    if (dist(x, y, other.x, other.y) < sz*2) {
      other.yspd = -other.yspd;
      xspd = 1;
    }
  }
}
