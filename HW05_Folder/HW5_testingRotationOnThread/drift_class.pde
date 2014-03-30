//Original Class from Laura's DriftC

class thread {

  float x;
  float y;
  float size;
  color c;
  int a=0;
  float spdx=1;
  float spdy=1;
  boolean direction; //direction up or down
  float theta=0;
  float radius=10;

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
  //-----------------------------------------------------//
  //-----------------CAROUSEL----------------------------//

  void carousel() {
    x = width/2 + radius*cos(theta);
    y = height/2 - radius*sin(theta);
   
    theta+=0.01;
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
    //drifting();
    carousel();
  }
  
  void render2(){
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
}

