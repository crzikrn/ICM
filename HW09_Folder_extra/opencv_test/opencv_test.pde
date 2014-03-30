import gab.opencv.*;
import processing.video.*;

Capture cam;
OpenCV opencv;
PImage display;

void captureEvent(Capture c) {
  c.read();
}

void setup() {
  cam = new Capture(this, 320, 240);
  opencv = new OpenCV(this, cam.width, cam.height);
  
  size(cam.width,cam.height);
  cam.start();
  
}

void draw() {
  opencv.loadImage(cam);
  opencv.blur(7/3);
  opencv.findCannyEdges(350,500);
  display = opencv.getOutput();
  
  image(display,0,0);
  
}

