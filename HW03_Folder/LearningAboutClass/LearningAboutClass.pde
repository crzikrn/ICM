//Array
ball[] ballArray = new ball[10];

//Singular Class
//ball b1;
//ball b2;

void setup() {

  size(600, 600);

  for (int i = 0; i < 10; i++) {
    ballArray[i] = new ball();
    ballArray[i].x = 100*i;
  }
  //Singular Class
  //b1 = new ball();
  //b2 = new ball();
}


void draw() {

  for (int i = 0; i < 10;i++) {
    
    ballArray[i].display();
    ballArray[i].move();
  } 

  //Singular Class
  // b2.x = 500;
  // b1.display();
  // b2.display(); 
  //print(nameOfBall.x);

  //Normal
  //ellipse(width/2, height/2,20,20);
}

