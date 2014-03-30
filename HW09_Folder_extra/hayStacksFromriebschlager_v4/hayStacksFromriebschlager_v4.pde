import processing.video.*;
Capture cam;

float[][] data;
PImage src; 
PShape shape;

void setup() {
  // Change the URL in the following line to an image of your own.
  cam = new Capture(this,640,480);
  cam.start();
  src = loadImage("http://farm4.staticflickr.com/3048/2806099034_30bba78310_o.jpg");
  size(2*cam.width, 2*cam.height);
  data = new float[cam.width][cam.height];
  genNoise(data);
  background(0);
}

void genNoise(float[][] data) {
  // Increase noiseScale to get a more 'wavy' pattern.
  float noiseScale = 0.0075;
  noiseDetail(1, 0.5);
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      data[i][j] = noise(j * noiseScale, i * noiseScale);
    }
  }
}

void captureEvent(Capture c){
 c.read(); 
}

void draw() {
  scale(1.5);
  noStroke();
  background(244);
  for (int i = 0; i < 10000; i++) {
    int nX = (int) random(cam.width);
    int nY = (int) random(cam.height);
    float d = data[nX][nY];
    pushMatrix();
    int c = cam.get(nX, nY);
    float a = map(nY, 0, height, 255, 100);
    color ab = int(map(brightness(c), 0, 255, color(0,0,0), color(244,244,244)));
    fill(ab);
    //fill(map(brightness(c), 0, 255, color(244,100,0), color(150,0,0)));
    //fill(c);
    //stroke(0);
    //strokeWeight(0.25);
    translate(nX, nY);
    rotate(map(brightness(c), 0, 255, -PI/4, PI));
    // Currently, I'm using these values to make small rectangles at the top
    // and large rectangles towards the bottom.
    // Change up these values to get the size of the rectangle you like.
    float newLength = map(nY, 0, height, 10, 50);
    float newWidth = map(nY, 0, height, 0, 1);
    rectMode(CENTER);
    rect(0, 0, newLength, newWidth);
    popMatrix();
  }
  //image(cam,0,0);
}

void keyPressed() {
  // When you're happy with it, hit S to save and exit.
  if (key == 's') {
    saveFrame();
    exit();
  }
}

