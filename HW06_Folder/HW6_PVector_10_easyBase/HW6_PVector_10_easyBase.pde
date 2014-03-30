Mover[] movers = new Mover[100];
PVector wind = new PVector(0.001, 0);
PVector gravity = new PVector(0, 0.1);

void setup() {
  background(255);
  size(500,500);
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(1,random(width),random(height));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < movers.length; i++)
  {

    float c = 0.01;

    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

