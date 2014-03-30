//source from
//https://github.com/riebschlager/sketch-portrait

import gab.opencv.*;
import processing.video.*;

PGraphics composite;
PImage source;

Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  
  video.start();
}

void draw() {
  //image(video,0,0); 
  if(composite!=null){
    image(composite, 0, 0); 
  }
  //video.filter(GRAY);
  composite = createGraphics(video.width, video.height);
  composite.beginDraw();
  composite.background(0);
  composite.smooth();
  composite.strokeWeight(10);

  for (int i=0; i<video.pixels.length; i+=100) {
    int rndX = (int) random(video.width);
    int rndY = (int) random(video.height);
    int c = video.get(rndX, rndY);
    composite.stroke(red(c), green(c), blue(c), /*map(brightness(c), 0, 255, 0, 200)*/40);
    //composite.strokeWeight(map(brightness(c),0,255,0,3));
    //composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, 100), rndY+map(brightness(c), 0, 255, -100, 0));
    composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, 60), rndY+map(brightness(c), 0, 255, -100, 30));
    //for fun opposite direction line
    //composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, -30), rndY+map(brightness(c), 0, 255, -10, 0));
    composite.noFill();
    float s = map(brightness(c),0,255,0,4);
    //composite.rect(rndX,rndY,s,s);
}
  composite.fill(255,10);
  composite.rect(0,0,width,height);
  composite.endDraw();
  //composite.filter(GRAY);
  //image(composite, 0, 0);
  //blend(fade(video, 10), 0, 0, width, height, 0, 0, width, height, MULTIPLY);
  //fill(255,50);
  //rect(0,0,width/2,height);
}

PGraphics fade(PImage img, float percentage) {
  PGraphics tmpImg = createGraphics(img.width, img.height);
  tmpImg.beginDraw();
  tmpImg.image(img, 0, 0);
  tmpImg.loadPixels();
  for (int i = 0; i < tmpImg.pixels.length; i++) {
    int p = tmpImg.pixels[i];
    float a = alpha(p) * (percentage / 100);
    tmpImg.pixels[i] = color(red(p), green(p), blue(p), a);
  }
  tmpImg.updatePixels();
  tmpImg.endDraw();
  return tmpImg;
}

void captureEvent(Capture c) {
  c.read();
}

