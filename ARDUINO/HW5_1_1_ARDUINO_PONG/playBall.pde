class ball {
  float x;
  float y;
  float xspd;
  float yspd;
  float acc;

  //////////////////////////////////////////////////

  ball() {
    x = width/2;
    y = height/2;
    acc = 0.1;
    xspd= constrain(xspd, 0, 7);

    initiate();
  } 

  //////////////////////////////////////////////////

  void playBall() {

    display();
    move();
    bounceWall();
    bouncePaddle();
  }

  //////////////////////////////////////////////////

  void initiate() {
    x = width/2;
    y = height/2;

    if (random(0, 1) > 0.5) {
      xspd = 5;
    }

    else {
      xspd = -5;
    }
    yspd = 1.85;
  }

  //////////////////////////////////////////////////

  void display() {
    rect(x, y, 20, 20);
  }

  //////////////////////////////////////////////////

  void move() {
    x+=xspd;
    y+=yspd;
  }
  //////////////////////////////////////////////////

  void bounceWall() {
    if (floorBounce()) {
      xspd=xspd;
      yspd=-yspd;
    }

    if (fallBounce()) {
      gameOver();
    }
  }

  //////////////////////////////////////////////////

  void gameOver() {

    delay(500);
    initiate();
  }


  //////////////////////////////////////////////////

  boolean floorBounce() {
    if (y < 0 || y > height-20) {
      return true;
    }
    else return false;
  }

  //////////////////////////////////////////////////

  boolean fallBounce() {
    if (x<-50 || x>width+50) {
      return true;
    }
    else return false;
  }

  ///////////////////////////////////////////////////

  void bouncePaddle() {
    if (y < game.controller1+game.paddleLength/2+50 && y > game.controller1-game.paddleLength/2) {
      if (x < 30) {
        xspd = -xspd;
        if (xspd < 0) {
          xspd -= acc;
        }
        else xspd += acc;
      }
    }
    if (y < game.controller2+game.paddleLength/2+50 && y > game.controller2-game.paddleLength/2) {
      if (x > width-50) {
        xspd = -xspd;
        if (xspd < 0) {
          xspd -= acc;
        }
        else xspd += acc;
      }
    }
  }

  //////////////////////////////////////////////////
}

