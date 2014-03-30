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

  }

  facade = createGraphics(webCam.width, webCam.height);
  facade.beginDraw();
  facade.strokeWeight(0.1);
  
  for (int i = 0; i<40000;i+=100) {
    int x = int(random(webCam.width));
    int y = int(random(webCam.height));
    int loc = x + y*webCam.width;
  
    facade.pushMatrix();
    int c = webCam.get(x, y);
    //fill through brightness
    //facade.fill(map(brightness(c),0,255,0,100));
    //fill with color
    facade.fill(c);
    
    facade.translate(x,y);
    facade.rotate(map(brightness(c),0,255,-PI,PI));
    
    facade.rectMode(CENTER);
    facade.rect(x, y, map(y, 0, height, 10, 60), map(y, 0, height, 0, 1));
    facade.popMatrix();
  }
  facade.endDraw();
}

