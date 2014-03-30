//crizkrn 2013
//Exploring physics, charts, and living digital entities

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
NodeGraph a;

ArrayList<NodeGraph> all;

void setup() {

  noStroke();
  size(1500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));

  //declare ArrayList that contains all smaller paperGraphs
  all = new ArrayList<NodeGraph>();
}

void draw() {
  //Erase over 30
  if (all.size()>30) {
    all.clear();
  }
  background(244);
  physics.update();

  //update each paperGraph
  for (NodeGraph a :all) {
    a.update();
    a.display();
  }
}


void mousePressed() {
  //add new paperGraph in the ArrayList of paperGraph
  all.add(new NodeGraph());
}

void mouseDragged() {
  //if ArrayList is not empty, let added NodeGraph be a new element
  if (all.size()>0) {
    NodeGraph a = all.get(all.size()-1);
    a.mouseDragged();
  }
}

