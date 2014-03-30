import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencvFace;
OpenCV opencvEye;
Capture cam;
PGraphics composite;
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
  opencvFace.adaptiveThreshold(591,1);
  //opencvFace.diff(cam);
  //opencvFace.findCannyEdges(75,200);
  //opencvFace.findContours();
  
  PImage grayness = opencvFace.getOutput();
  
  composite = createGraphics(cam.width, cam.height);
  composite.beginDraw();
  composite.background(0);
  composite.smooth();
  composite.strokeWeight(0.1);

  for (int i=0; i<10000; i+=1) {
    int rndX = (int) random(grayness.width);
    int rndY = (int) random(grayness.height);
    int c = grayness.get(rndX, rndY);
    composite.stroke(red(c), green(c), blue(c), map(brightness(c), 0, 255, 0, 100));
    //composite.strokeWeight(map(brightness(c),0,255,0,3));
    //composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, 100), rndY+map(brightness(c), 0, 255, -100, 0));
    composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, -10, 10), rndY+map(brightness(c), 0, 255, 20, 20));
    composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 10, -10), rndY+map(brightness(c), 0, 255, 20, 20));
    //for fun opposite direction line
    //composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, -30), rndY+map(brightness(c), 0, 255, -10, 0));
    composite.noFill();
    float s = map(brightness(c),0,255,0,1);
    //composite.rect(rndX,rndY,s,s);
    
}
  composite.endDraw();
  
  image(composite,0,240);
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
