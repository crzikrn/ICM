ArrayList<PixelParticle> one;
PVector  wind = new PVector(0.1, 0);  
PVector gravity = new PVector(0, 1);

void setup() {
  background(11);
  one = new ArrayList<PixelParticle>();
  size(1000, 500);
}

void draw() {
  //fill(11, 10);
  //rect(0, 0, width, height);
  background(11);

  for (PixelParticle o : one) {

    o.applyForce(wind);
    o.applyForce(gravity);

    o.update();
    o.display();
    o.checkEdges();
  }
}

void mouseDragged() {
  fill(random(200, 255), random(100), random(50), 100);
  one.add(new PixelParticle(3,0,0));
}

void keyPressed() {
}

