import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencv;
Capture webCam;
Rectangle[] faces;
PGraphics facade;

void setup() {
  webCam = new Capture(this, 320, 240);
  webCam.start();
  opencv = new OpenCV(this,320,240);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  size(webCam.width*3, webCam.height*3);
  
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  //PImage facade = webCam.get();
  scale(2.5);
  
  opencv.loadImage(webCam);
  faces = opencv.detect();
  if (facade !=null) {
  }
  background(244);
  //fill(170,250,200, 50);
  //rect(0, 0, width, height);

  for (int i = 0; i< 30000;i+=1) {
    int x = int(random(webCam.width));
    int y = int(random(webCam.height));
    
    int loc = x + y*webCam.width;

    int c = webCam.get(x, y);
    strokeWeight(map(x, 0, width, 0, 0.6));

    color blue = color(244, 100, 0);
    color white = color(244, 244, 244);
    color palette = int(map(brightness(c), 0, 255, blue, white));
    println(palette);
    stroke(palette);

    line(x, y, x+map(brightness(c), 0, 255, 10*cos(50), 10*sin(-10)), y+map(brightness(c), 0, 255, 10*cos(50), 10*sin(-1)));
  }
}

