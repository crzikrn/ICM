import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencvFace;
Capture cam;
Capture camDisplay;

int w = 640;
int h = 480;

void setup() {
  size(w*3/2, h*3/2);
  //Make new Capture
  cam = new Capture(this, w/2, h/2);
  //camDisplay = new Capture(this, w/4, h/4);
  //Make new OpenCV
  opencvFace = new OpenCV(this, w/2, h/2);
  //Load face detection
  opencvFace.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  //Start capturing feed from webcam
  cam.start();
  //camDisplay.start();
}


void draw() {
  //display Camera
  image(cam, width-w/2, height-h/2);
  scale(3);
  
  //opencv collects data from webcam
  opencvFace.loadImage(cam);
    
  //Make an array of rectangles to collect detected faces on camera
  Rectangle[] faces = opencvFace.detect();
  //background(244);

  fill(244,5);
  rect(0,0,width,height);
  for (int i = 0; i<faces.length; i++) {

    noFill();
    Rectangle faced = new Rectangle(faces[i].x, faces[i].y, faces[i].width, faces[i].height+height/2);
    //noStroke();
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //fill(244);
    //rect(0,0,width,height);
    for (int z = 0; z < 3000; z += 1) {

      int x = int(random(faced.x, faced.x+faced.width));
      int y = int(random(faced.y, faced.y+faced.height));
      //x = faced.width - x -1;
      //int loc = x + y*faced.width;

      int c = cam.get(x, y);
      //strokeWeight(map(faced.x, 0, faced.width, 0.4, 1.0));
      strokeWeight(0.1);
      color blue = color(0, 100, 0);
      color white = color(244, 244, 244);
      color palette = int(map(brightness(c), 0, 255, blue, white));
      println(palette);
      stroke(palette,200);

      //line(x, y, x+map(brightness(c), 0, 255, 5*cos(50), 5*sin(-10)), y+map(brightness(c), 0, 255, 5*cos(50), 5*sin(-1)));
     line(x, y, x+map(brightness(c), 0, 255, 5*cos(PI), 7*cos(-PI/4)), y+map(brightness(c), 0, 255, 5*sin(PI), 7*sin(-PI/4)));
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

