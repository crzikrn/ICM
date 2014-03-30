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
  int i,j = 0;
  //loop every column
  for (int x = 0; x < width; x++) {
    //loop row
    for (int y = 0; y < height; y++) {
      //use formula to find 1d location
      int loc = x + y * width;
      if(x%2 == 0){
       pixels[loc] = color(255); 
      } else {
        pixels[loc] = color(0);
      }
      
      //pixels[loc] = int(brightness(webCam.get(x,y)));
    }
   
  }
  updatePixels();
}

