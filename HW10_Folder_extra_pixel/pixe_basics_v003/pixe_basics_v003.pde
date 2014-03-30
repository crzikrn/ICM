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
  //PImage facade = webCam.get();
  image(webCam, 0, 0);
  loadPixels();
  int i,j = 0;
  //loop every column
  for (int x = 0; x < width; x+=1) {
    //loop row
    for (int y = 0; y < height; y+=1) {
      //use formula to find 1d location
      int loc = x + y * width;
      
      float r = red(webCam.pixels[loc]);
      float g = green(webCam.pixels[loc]);
      float b = blue(webCam.pixels[loc]);
      
      pixels[loc] = color(r,0,g);
      //pixels[loc] = int(brightness(webCam.get(x,y)));
    }
   
  }
  updatePixels();
}

