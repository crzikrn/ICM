class ball {
  float x;
  float y;
  float sz;
  float a;
  float theta;
  float radius = 100;

  ball() {
    x = width/1.5;
    y = height/2;
    sz = 2;
  }

  void render() {
    ellipse(x, y, sz, sz);
  }

  void move() {
    x++;
  }

  void rota() {

    //float theta = PI/180*8+ speed/180;
    
    x = width/2 + radius*cos(theta);
    y = height/2 - radius*sin(theta);
     
    theta+=0.005;
  }
}

//length
//w/2 + rcos(theta);
//
//h/2 + rsin(theta);
//
//change theta
//
//remember theta is in radians. change 
//{PI/180*sz






