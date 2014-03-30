import processing.video.*;

Capture webCam;

void setup() {
  webCam = new Capture(this, 640, 480);
  webCam.start();
  size(webCam.width, webCam.height);
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  image(webCam, 0, 0);
  loadPixels();
  int x = 0;
  int y = 0;
  for (int i = 0; i < pixels.length; i++) {
    float rand = random(255);
    color c = color(rand);
    pixels[i] = c;
  }
  updatePixels();
}

