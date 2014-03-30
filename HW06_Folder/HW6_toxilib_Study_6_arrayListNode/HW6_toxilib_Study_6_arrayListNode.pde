import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
NodeGraph a;

ArrayList<NodeGraph> all;

void setup() {
  frameRate(5000);
  stroke(244, 0, 100);
  noFill();
  size(1500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));

  all = new ArrayList<NodeGraph>();
  //a = new NodeGraph();
}

void draw() {
  if(all.size()>5){
   all.clear(); 
  }
  background(244);
  physics.update();
  for (NodeGraph a :all) {
    a.update();
    a.display();
  }
}


void mousePressed() {
  all.add(new NodeGraph());
}

void mouseDragged() {
  for(NodeGraph a:  all){
    stroke(random(255));
    a.mouseDragged();
  }
}


