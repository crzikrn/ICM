//Original Class from Laura's DriftC

class thread {

  float x;
  float y;
  float size;
  color c;

  float spdx=1;
  float spdy=1;
  boolean direction; //direction up or down

  //---------------------CONSTRUCTOR------------------------//
  //--------------------------------------------------------//

  thread(float _x, float _y, float _size, color _c, boolean _direction) {
    x = _x;
    y = _y;
    c = _c;
    size = 1;//random((_size-0.05), (_size+0.05));
    direction = _direction;
  }

  //----------------------END-------------------------------//
  //----------------------END-------------------------------//

  // thread X-axis or Y-axis drifting
  void drifting() {
    if (direction) {
      x += spdx;  // moves right
      y += random(-0.5, 0.5); // moves up and down
      bounce();
    }
    if (!direction) {
      y += spdy;  // moves down
      x += random(-0.5, 0.5); // moves left and right
      bounce();
    }
  }

  //----------------------------------------------------//
  //---------------------BOUNCE-------------------------//

  void bounce() {
    if (x > width || x < 0 ) {
      spdx = -spdx;
    }  
    if (y > height || y < 0) {
      spdy = -spdy;
    }
  }

  //-------------------------------------------------------//
  //----------------------RENDER---------------------------//


  void render() {
    thread(x, y, size, c);
    drifting();
  }

  //---------------------------------------------------------//
  //---------------------------------------------------------//

  // thread function
  void thread(float x, float y, float sz, color c) {
    noStroke();
    fill(c);
    ellipse(x, y, sz, sz);
  }


  //collision for changing axis
  boolean collisionDetection(thread other) {
    if (dist(x, y, other.x, other.y) < size*2) {
      return true;
    }
    else {
      return false;
    }
  }

  void collisionChange(thread other) {
    if (collisionDetection(other)) {
      //other.x = y;
      //other.y = x;
      other.direction = !direction;
      direction = !direction;

      other.spdy = -spdy;
      other.spdx = -spdx;
      spdy = -spdy;
      spdx = -spdx;
    }
  }
}

