import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Node> graph;

void setup() {
  stroke(0);
  size(500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));


  graph = new ArrayList<Node>();

  for (int i = 0; i < graph.size(); i++) {
    Node single = graph.get(i);
    physics.addParticle(single);
  }
}


void draw() {
  background(244);
  physics.update();
  for (int i = 0; i < graph.size();i++) {
    Node single = graph.get(i);
    if(i != 0){
    Node previous = graph.get(i-1);
    single.display();
    //next.display();
    beginShape();
    stroke(244,0,100);
    fill(244,0,100);
    vertex(single.x,single.y);
    physics.addSpring(new VerletSpring2D(previous, single, 50, 0.05));
        
    endShape();
    }
  }
  
}

void mousePressed() {

  graph.add(new Node(mouseX, mouseY));
}

