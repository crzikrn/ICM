import processing.serial.*;

ball play;
Serial myPort;

float bg;
float fill;
float yPos1, yPos2;

float paddlel = 100;

boolean firstContact = false; //microcontroller is it ON or OFF?

void setup() {
  size(800, 800);
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  play = new ball();
  

}

void serialEvent(Serial myPort) {

  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    myString = trim(myString); //take all whitespaces out

    //check for first contact with sensors. for ON or OFF
    //then let's go to the else!
    
    if (firstContact == false) {
      if (myString.equals("hello")) {
        myPort.clear();
        firstContact = true;
        myPort.write("A");//on the serial for next line of numbers
      }
    }

    //we're ON and ready to go
    else {
      
      //split monitor string collection of DEC numbers with the ","
      int Sensors[] = int(split(myString, ","));
    
      //if there are things in Sensors map them to a value that controls things in processing.
      if (Sensors.length > 1) {
        yPos1 = map(Sensors[0], 0, 1023, 0, height-paddlel);
        yPos2 = map(Sensors[1], 0, 1023, 0, height-paddlel);
        fill = 255;
      }
    }
    
    //I'm done. With this set of numbers. Let's get the next row by typing in something!
    myPort.write("A");
  }
}

void draw() {
  background(bg);
  //play.xspd = constrain(play.xspd, 1,10); 
  fill(fill);
  stroke(255);
  line(width/2,0,width/2,height);
  ellipse (width/2,height/2,60,60);
  rect(0, yPos1, 30, paddlel);
  rect(width-30, yPos2, 30,paddlel);
  play.playBall();
}





