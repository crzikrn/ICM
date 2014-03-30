import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencvFace;
OpenCV opencvEye;
Capture cam;
Rectangle[] faces;
Rectangle[] eyes;
int w = 640;
int h = 480;

void setup() {
  size(640, h);
  opencvFace = new OpenCV(this, w/2, h/2);
  //  opencvEye = new OpenCV(this, w/2, h/2);
  cam = new Capture(this, w/2, h/2);

  //  opencvEye.loadCascade(OpenCV.CASCADE_EYE);
  opencvFace.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  cam.start();
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  background(0);
  //scale(2);

  //opencvEye.loadImage(cam);

  opencvFace.loadImage(cam);
  
  //opencvFace.brightness(0);
  opencvFace.threshold(75);
  //opencvFace.blur(0);
  //opencvFace.invert(); 
  //opencvFace.dilate();
  //opencvFace.erode();
  //opencvFace.invert(); 
  //opencvFace.adaptiveThreshold(591,1);
  //opencvFace.diff(cam);
  opencvFace.findCannyEdges(20,75);
  PImage grayness = opencvFace.getOutput();
  
  image(cam, 0, 0);
  image(grayness, 320, 0);

  faces = opencvFace.detect();
  //eyes = opencvEye.detect();

  beginShape();
  if (faces != null || eyes != null) {
    for (int i = 0; i<faces.length; i++) {
      stroke(255, 0, 0);
      strokeWeight(3);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);


      //      
      //      for (int j = 0; j<eyes.length; j++) {
      //        stroke(255, 0, 0);
      //        strokeWeight(3);
      //        vertex(eyes[i].x+eyes[i].width/2,eyes[i].y+eyes[i].height/2);
      //        rect(eyes[j].x, eyes[j].y, eyes[j].width, eyes[j].height);
      //      }
    }
  }
  endShape();
}

