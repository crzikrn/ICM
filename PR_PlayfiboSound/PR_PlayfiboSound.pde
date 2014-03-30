//import minim library
import ddf.minim.*;
import ddf.minim.ugens.*;

//Fibonacci Numbers Musical Remainder Viewer
//Karam Byun, after watching numberphile mystery of fibonacci
//set size of fibonacci array
int num = 200;
//scale array
String[] scale = {
  "C", "D", "E", "F", "G", "A", "B"
};
//scale in repeating series
String[] melody = new String[num];
//for fibonacci
int current;
int start = 0;
int next = 1;
int j;

Minim minim;
AudioOutput out;

void setup() {

  //size(500, 500);
  background(0);
  
  //make sound
  minim = new Minim(this);
  out = minim.getLineOut();

  //set melody array with repeating major scale note
  for (int i = 0; i < num; i++) {
    if (j==7) {
      j = 0;
    }
    melody[i] = scale[j];
    j++;
  }
}

void draw() {
  
  //check if there is a note letter for melody array
  for (int i = 0; i < num; i++) {
    String a = melody[i];  
    //println(a);
  }

  //get fibonacci numbers
  current = fib();
  print(melody[abs(current%7)]);
  float delay;
  
  //random note duration generator
  if (random(1) < 0.5) {
    delay = 0.9;
  }
  else
  delay = 1.5;
  //float delay = random(0.5);
  myDelay(delay*1000);

  //play fibonacci sequence play
  //get fibonnaci number remainder and use that number for melody array to get a note
  out.playNote(0.0, delay, melody[abs(current%7)]+((current%5)+1) );
  
  //print(melody[abs(current%20)]);
  println(melody[abs(current%7)]+current%7);
  
}

int fib() {
  int result = current;
  start = next;
  next = current;
  current = start + next; 
  return current;
}
//delay loop for clean note audio
void myDelay(float ms) {
  float time = millis();
  while (millis ()-time < ms);
}

