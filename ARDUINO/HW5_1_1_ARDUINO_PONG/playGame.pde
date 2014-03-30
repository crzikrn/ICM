class game {
  ball play;
  float controller1, controller2;
  float paddleLength = 100;

  ///////////////////////////////////////////

  game() {
    play = new ball();
  }

  ///////////////////////////////////////////

  void display() {
    midLine();
    paddles();
    play.playBall();
  }

  ///////////////////////////////////////////

  void paddles() {
    stroke(255);
    noFill();
    rect(0, controller1, 30, paddleLength);
    rect(width-30, controller2, 30, paddleLength);
  }

  void midLine() {
    stroke(255);
    line(width/2, 0, width/2, height);
  }
}

