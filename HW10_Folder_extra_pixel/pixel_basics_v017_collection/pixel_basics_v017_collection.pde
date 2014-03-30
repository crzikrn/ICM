//Karam Byun, crzikrn 2013
//Inspiration and basic code reference from Chris Rieschabln
//Using Greg Borenstein's OpenCV for processing
//
//NOTES: Oval faces for floating and immersiveness
//taking different shapes of the face
//framing it, interactive, a slower stroke
//drawing with the body
//stills and images of the faces, keeping the brushing effects
//or flowing effects
//an art piece printing
//drawing with the eyes, keeping a drawing.
//design vs art.
//computer hood

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencvFace;
Capture cam;
Capture camDisplay;
int w = 640;
int h = 480;
PFont font;

void setup() {
  size(w*3/2, h*3/2);
  //size(displayWidth, displayHeight);
  //Make new Capture
  cam = new Capture(this, w/2, h/2);
  //camDisplay = new Capture(this, w/4, h/4);
  //Make new OpenCV
  opencvFace = new OpenCV(this, w/2, h/2);
  //Load face detection
  font = loadFont("AracneRegular-48.vlw");
  //opencvFace.loadCascade(OpenCV.CASCADE_EYE);
  opencvFace.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  //opencvFace.loadCascade(OpenCV.CASCADE_MOUTH);
  //Start capturing feed from webcam
  cam.start();
  //camDisplay.start();
}

boolean sketchFullScreen() {
  return false;
}

void draw() {
  //display Camera
  image(cam, width-w/2, height-h/2);
  scale(3);

  //opencv collects data from webcam
 // opencvFace.loadImage(cam);
  opencvFace.blur(3);
  //opencvFace.adaptiveThreshold(591,5);
  opencvFace.findCannyEdges(350, 500);
  //opencvFace.dilate();
  //opencvFace.erode();
  PImage temp = opencvFace.getOutput();
  //tint(255, 244);
  //image(temp, 0, 0);
  opencvFace.loadImage(cam);
  //Make an array of rectangles to collect detected faces on camera
  Rectangle[] faces = opencvFace.detect();
  //background(244);
  noStroke();
  //fill(6, 10, 10, 15);
  //fill(244, 20);
  fill(0, 30);
  rect(0, 0, width, 480);
  for (int i = 0; i<faces.length; i++) {

    //noFill();
    //+50
    Rectangle faced = new Rectangle(faces[i].x, faces[i].y, faces[i].width, faces[i].height+50);
    //noStroke();
    int cx = faces[i].x+faces[i].width/2;
    int cy = faces[i].y+faces[i].height/2;
    //fill(244, 100, 0, 50);

    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    noFill();
    for (int z = 0; z < 577; z += 1.5) {

      int x = int(random(faced.x, faced.x+faced.width));
      int y = int(random(faced.y, faced.y+faced.height));


      //x = faced.width - x -1;
      //int loc = x + y*faced.width;

      float d = dist(x, y, cx, cy)-random(5, 20);

      rectMode(CENTER);

      color b = 0;
      //b = cam.get(int(x), int(y));

      for (int q = 0; q < 50 ; q+=2) {
        for (int r = 0; r < 10 ; r+=2) { 
          noStroke();
          int rx = int(random(faced.x, faced.x+faced.width));
          int ry = int(random(faced.y, faced.y+faced.height));
          //b = cam.get(int(q+130), int(r+150));
          b = cam.get(int(rx), int(ry));
          fill(b,10);
          rect(cx+q-22, cy+r-15, 2, 2);
        }
      }
      noFill();

      int c = cam.get(x, y);
     // if(d<faces[i].width/3.5){

      //if(d<faces[i].width){
      //strokeWeight(map(faced.x, 0, faced.width, 0.4, 1.0));
      //strokeWeight(0.1);
      strokeWeight(map(brightness(c), 0, 255, 0, 0.5));
      //forblack white
      //strokeWeight(map(brightness(c),0,255,0.5,0.1));
      color blue = color(0, 100, 0);
      color white = color(244, 244, 244);
      color palette = int(map(brightness(c), 0, 255, blue, white));
      println(palette);
      stroke(palette, 200);
      //Style 1 works well with bw then color
      //line(x, y, x+map(brightness(c), 0, 255, 5*cos(50), 5*sin(-10)), y+map(brightness(c), 0, 255, 5*cos(50), 5*sin(-1)));
      //Style 2 bw same as color, can see lines as thin brushstrokes // Looks good with weight from 0 to 1.3
      //line(x, y, x+map(brightness(c), 0, 255, 5*cos(-PI/4), 7*cos(PI)), y+map(brightness(c), 0, 255, 5*sin(-PI/4), 7*sin(PI)));
      //Style 3 best with red.width to 0,1.3// goo for painting the frame.
      //line(x, y, x+map(brightness(c), 0, 255, 12*cos(-PI/2), 10*cos(PI)), y+map(brightness(c), 0, 255, 12*sin(PI), 10*sin(-PI/2)));
      //Style 4 comp.gen art. for 0,0.3 and 0,1.3 without background filling for redness
      //line(x, y, x+map(brightness(c), 0, 255, 12*cos(PI), 10*cos(-PI/16)), y+map(brightness(c), 0, 255, 12*sin(PI), 10*sin(-PI/16)));

      line(x, y, x+map(brightness(c), 0, 255, 3*cos(PI/4), 7*cos(-PI/4)), y+map(brightness(c), 0, 255, 5*sin(PI/4), 7*sin(-PI/4)));
    }

    //  }
  }
  rectMode(CENTER);
  fill(0);
  noStroke();
  rect(160, 430, 100, 400);
  fill(255);
  textFont(font, 12);
  text("gather faces", 127, 235);
}

void captureEvent(Capture c) {
  c.read();
}

