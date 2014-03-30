
String headline = "New study shows computer programming lowers cholestrol.";
PFont f;
float x;


void setup() {
  size(400, 200);
  f = createFont("Arial", 16, true);
  x = width;
}

void draw() {
  background(255);
  textFont(f, 16);
  fill(11);
  textAlign(LEFT);
  text(headline, x, 180);
  x-=3;

  // If x is less than the negative width, then it is completely off the screen
  float w = textWidth(headline);
  if (x < -w) {
    x = width;
  }
}

