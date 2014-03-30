import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
NodeGraph a;

void setup() {
  //frameRate(5000);
  stroke(0);
  size(1500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  
  a = new NodeGraph();

 
}

void draw() {
  background(244);
  physics.update();
  a.update();
  a.display();

}

void mouseDragged(){
 a.mouseDragged(); 
}

void mouseReleased() {
   fill(random(244), 0, 100);
}
