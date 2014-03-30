ArrayList<PixelParticle> one;


void setup() {
  background(11);
  one = new ArrayList<PixelParticle>();
  size(1000, 500);
}

void draw() {
  fill(11, 10);
  //rect(0, 0, width, height);
  fill(random(200, 255), random(100), random(50));
  for (PixelParticle o : one) {
    o.update();
    o.display();
  }
}

void mouseDragged() {
  fill(random(200, 255), random(100), random(50));
  one.add(new PixelParticle());
}

void keyPressed() {
  background(11);
}

