class Node extends VerletParticle2D {

  Node(float _x, float _y) {
    super(_x, _y);
  } 

  void display() {
    noStroke();
    fill(255, 0, 100);
    ellipse(x, y, 2, 2);
  }
}

