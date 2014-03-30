import processing.video.*;

Capture webCam;
PGraphics facade;

void setup() {
  webCam = new Capture(this, 640, 480);
  webCam.start();

  size(webCam.width, webCam.height);
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  //PImage facade = webCam.get();
  if (facade !=null) {
    image(facade, 0, 0);
  }

  facade = createGraphics(webCam.width, webCam.height);
  facade.beginDraw();
  facade.strokeWeight(0.1);
  
  for (int i = 0; i<40000;i+=10) {
    int x = int(random(webCam.width));
    int y = int(random(webCam.height));
    int loc = x + y*webCam.width;
  
    pushMatrix();
    int c = webCam.get(x, y);
    facade.fill(c);
    rectMode(CENTER);
    facade.rect(x, y, map(brightness(c), 0, 255, 10, 60), map(brightness(c), 0, 255, 0, 1));
    popMatrix();
  }
  facade.endDraw();
}

