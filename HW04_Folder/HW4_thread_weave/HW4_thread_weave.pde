class DriftC {

  float x;
  float y;
  float size;
  color c;
  float spdx=2;
  float spdy=2;
  boolean direction;

  DriftC(float _x, float _y, float _size, color _c) {
    x = _x;
    y = _y;
    c = _c;
    size = 4;//random((_size-0.05), (_size+0.05));
    direction = true;

    // random scale
  }

  void drawCloud() {

    driftingX();
    driftingY();
    render();
  }

  void move(boolean direction) {
    if (direction) {
      driftingX();
    }
    else driftingY();
  }


  // cloud drifting
  void driftingX() {
    x += spdx;  // moves right
    y += random(-0.5, 0.5); // moves up and down

    if (x > width || x < 0) {
      spdx = -spdx;
    }  
    if (y > height || y < 0) {
      spdy = -spdy;
    }
  }
  void driftingY() {
    y += spdy;  // moves down
    x += random(-0.5, 0.5); // moves left and right

    if (x > width || x < 0 ) {
      spdx = -spdx;
    }  

    if (y > height || y < 0) {
      spdy = -spdy;
    }
  }

  // print cloud
  void render() {
    cloud(x, y, size, c);
  }

  // cloud function
  void cloud(float x, float y, float sz, color c) {
    noStroke();
    fill(c);
    ellipse(x, y, sz, sz);
  }

  void collision(DriftC other) {
    other.direction = !other.direction;
  }

  void collisionY(DriftC other) {
    if (dist(x, y, other.x, other.y) < size) {
      other.x = y;
      other.y = x;
      other.spdy = spdy;
      other.spdx = spdx;
    }
  }
  void collisionX(DriftC other) {
    if (dist(x, y, other.x, other.y) < size) {
      other.x = y+10;
      other.y = x+10;
      other.spdy = -spdy;
      other.spdx = -spdx;
    }
  }
}

