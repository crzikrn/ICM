ArrayList<PixelParticle> one;
PVector wind = new PVector(0, 0);
float t = 0;
void setup() {
  background(11);
  one = new ArrayList<PixelParticle>();
  size(1000, 500);
}

void draw() {
  //fill(11, 10);
  //rect(0, 0, width, height);
  background(11);
  float n = noise(t);
  n = map(n, 0, 1, -0.05 , 0.05);
  wind.x = n;
  wind.y = n;
  for (PixelParticle o : one) {

    o.update();
    o.display();
    o.applyForce(wind);
  }
  t+=0.01;
}

void mouseDragged() {
}

void keyPressed() {
  fill(random(200, 255), random(100), random(50), 100);
  one.add(new PixelParticle());
}

