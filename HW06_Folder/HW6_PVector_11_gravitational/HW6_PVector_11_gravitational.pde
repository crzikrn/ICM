Mover m;
Attractor a;

void setup() {

  size(500, 500);
  m = new Mover(10, width/2, 200);
  a = new Attractor();
}

void draw() {
  background(0);

  PVector f = a.attract(m);
    
  m.update();
  m.applyForce(f);
  
  a.display();
  
  m.display();
  m.checkEdges();
}

