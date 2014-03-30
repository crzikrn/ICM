import processing.video.*;

Capture webCam;
PGraphics facade;

void setup() {
  webCam = new Capture(this, 320, 240);
  webCam.start();

  size(webCam.width*3, webCam.height*3);
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  //PImage facade = webCam.get();
  scale(2.5);
  if (facade !=null) {
  }
  background(244);
  //fill(244, 10);
  //rect(0, 0, width, height);

  for (int i = 0; i< 30000;i+=1) {
    int x = int(random(webCam.width));
    int y = int(random(webCam.height));
    int loc = x + y*webCam.width;

    int c = webCam.get(x, y);
    strokeWeight(map(x, 0, width, 0, 0.6));
    //fill through brightness
    //fill(map(brightness(c),0,255,0,100));
    //fill stroke with camera color
    //stroke(c);

    //fill stroke with random color between
    color blue = color(14, 100, 0);
    color white = color(244, 244, 244);
    color palette = int(map(brightness(c), 0, 255, blue, white));
    println(palette);
    stroke(palette);
    //Black white gradient
    //stroke(color(int(map(brightness(c),0,255,color(0,0,0),color(255,255,255))))); 

    line(x, y, x+map(brightness(c), 0, 255, 10*cos(50), 10*sin(-10)), y+map(brightness(c), 0, 255, 10*cos(50), 10*sin(-1)));
  }
}

