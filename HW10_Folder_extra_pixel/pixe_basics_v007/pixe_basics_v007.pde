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
  background(255);

  strokeWeight(0.1);
  
  for (int i = 0; i<40000;i+=10) {
    int x = int(random(webCam.width));
    int y = int(random(webCam.height));
    int loc = x + y*webCam.width;
  
    int c = webCam.get(x, y);
    //fill through brightness
    fill(map(brightness(c),0,255,0,100));
    //fill with color
    stroke(c);
    line(x,y,x+map(brightness(c),0,255,0,60),y+map(brightness(c),0,255,-10,10));
   
  }
  
}

