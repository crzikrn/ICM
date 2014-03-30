
String[] headlines = {
  "New study shows computer programming lowers cholestrol.",
  "Processing proceeding to new download",
};

PFont f;
float x;
int index = 0;

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
  text(headlines[index], x, 180);
  x-=3;

  // If x is less than the negative width, then it is completely off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width;
    index = (index + 1) % headlines.length;
  }
}

