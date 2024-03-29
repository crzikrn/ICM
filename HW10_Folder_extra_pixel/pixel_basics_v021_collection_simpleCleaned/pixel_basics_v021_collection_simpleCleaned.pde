//Karam Byun, crzikrn 2013
//
//Inspiration and basic code reference from Chris Rieschabln (haystacks & sketch-portrait)
//https://github.com/riebschlager?tab=repositories
//Using Greg Borenstein's OpenCV for processing
//https://github.com/atduskgreg/opencv-processing
//

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencvFace;
Capture cam;

int w = 640;
int h = 480;
PFont font;
PImage small;
int number = 193;


void setup() {
  size(w*3/2, h*3/2, P2D);
  cam = new Capture(this, 320, 240);
  opencvFace = new OpenCV(this, w/4, h/4);
  small = createImage(w/4, h/4, RGB);
  cam.list();
  font = loadFont("AracneRegular-48.vlw");
  opencvFace.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  cam.start();
  
  textFont(font,9);
}

boolean sketchFullScreen() {
  return false;
}

void draw() {
  pushMatrix();
  scale(-1, 1);
  translate(-width, height-h/2);
  image(cam,0,0);
  popMatrix();
  scale(3);

  small.copy(cam, 0, 0, cam.width, cam.height, 0, 0, small.width, small.height);  
  small.updatePixels();

  opencvFace.loadImage(small);
  Rectangle[] faces = opencvFace.detect();
  noStroke();
  fill(0, 10);
  rect(0, 0, width, 480);
  for (int i = 0; i<faces.length; i++) {

    Rectangle faced = new Rectangle(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    int cx = 2*faces[i].x+faces[i].width/2;
    int cy = 2*faces[i].y+faces[i].height/2;

    cam.loadPixels();

    for (int z = 0; z < number; z += 1) {

      int x = int(random(faced.x*2, 2*faced.x+faced.width+50));
      int y = int(random(faced.y*2, 2*faced.y+faced.height+120));

      color b = 0;
      int c = 0;
      if (y<cam.height && x < cam.width) {
        c = cam.pixels[x+y*cam.width];
      }

      //strokeWeight(map(brightness(c), 0, 255, 0.01, 0.5));
      strokeWeight(map(brightness(c), 0, 255, 0.1, 1.8));
      color blue = color(0, 100, 0);
      color white = color(244, 244, 244);
      color palette = int(map(brightness(c), 0, 255, blue, white));
      stroke(palette, 100);
      pushMatrix();

      translate(-640, 0);
      //line(width-x-1, y, (width-x-1)+map(brightness(c), 0, 255, 4.2*cos(PI/4), random(8, 9)*cos(-PI/4)), y+map(brightness(c), 0, 255, 4.4*sin(PI/4), random(8, 9)*sin(-PI/4)));
      line(width-x-1, y, (width-x-1)+map(brightness(c), 0, 255, 7.2*cos(PI/4), random(5, 6)*cos(-PI/4)), y+map(brightness(c), 0, 255, 7.4*sin(PI/4), random(5, 6)*sin(-PI/4)));
      noFill();
      popMatrix();
    }


    if (frameRate>40) {
      for (int q = 0; q < faced.width+30 ; q+=3) {
        for (int r = 0; r < faced.width/3 ; r+=3) { 
          noStroke();
          int rx = int(random(2*faced.x, 2*faced.x+faced.width));
          int ry = int(random(2*faced.y, 2*faced.y+faced.height));
          int b = cam.pixels[int(rx)+int(ry)*cam.width];
          fill(b, 130);
          pushMatrix();
          scale(-1, 1);
          translate(-320, 0);
          rect(cx+q-15, cy+r, 3, 3);
          popMatrix();
        }
      }
    }
  }
  noStroke();
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  if (keyCode == UP && number < 1500) {
    number = number+10;
  } 
  if (keyCode ==DOWN) {
    number = number-10;
  }
}

