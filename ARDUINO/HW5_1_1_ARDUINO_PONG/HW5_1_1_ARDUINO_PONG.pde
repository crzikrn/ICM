import processing.serial.*;

Serial myPort;
game game;

float bg;
float fill;
boolean check;
boolean firstContact = false; //microcontroller is it ON or OFF?

void setup() {
  
  game = new game();
  size(800, 600);
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
    
}

void draw() {
  background(fill);
  

  
  game.display();
  
}





