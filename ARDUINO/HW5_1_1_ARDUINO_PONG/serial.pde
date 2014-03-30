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
        game.controller1 = map(Sensors[0], 0, 1023, 0, height-game.paddleLength);
        game.controller2 = map(Sensors[1], 0, 1023, 0, height-game.paddleLength);
        if(Sensors[2] == 1){
         check = true; 
        }
        else {check = false;}
      }
    }
    
    //I'm done. With this set of numbers. Let's get the next row by typing in something!
    myPort.write("A");
  }
}
