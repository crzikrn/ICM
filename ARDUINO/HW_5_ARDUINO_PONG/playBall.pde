class ball {
  float x;
  float y;
  float xspd;
  float yspd;
  

  ball() {
    x = width/2;
    y = height/2;
    
    if (random(1) <0.5) {
      xspd = -5;
    }
    else {
      xspd = 5;
    }
    yspd = 1.85;
    
    
  }  
  void playBall() {
    display();
    move();
    bounce();
  }
  void display() {
    rect(x, y, 20, 20);
  }

  void move() {
    x+=xspd;
    y+=yspd;
  }

  void bounce() {
    if (y<0 || y>height-20) {
      xspd=xspd;
      yspd=-yspd;
      //xspd+=0.1;
    }
    if (x<-50 || x>width+50) {
      x = width/2;
      y = height/2;
      delay(500);
      playBall();
    }

    if (y<yPos1+paddlel/2+20 && y>yPos1-paddlel/2) {
      if (x<30) {
        xspd=-xspd*1.05;
        yspd=yspd;
        
      }
    }
    if (y < yPos2+paddlel/2+20 && y > yPos2-paddlel/2) {
      if (x > width-50) {
        xspd=-xspd*1.05;
        yspd=yspd;
      }
    }
  }
}

