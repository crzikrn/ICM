ArrayList<Grapp> grappArray;
PVector mouse = new PVector(mouseX, mouseY);

void setup() {
  size(800, 800);
  //noFill();
  fill(225,0,100);
  //noStroke();
  stroke(255, 0, 100);
  grappArray = new ArrayList<Grapp>();
}

void draw() {
  background(244); 
  if (grappArray.size()>300) {
    grappArray.clear();
  } 
  
 beginShape();
  vertex(0,0);
  vertex(800,0);
  for (Grapp g : grappArray) {
    g.update();
    println(g.velocity.y);
    g.display();
  }
  endShape();
}

void mouseDragged() {
  
  grappArray.add(new Grapp(mouseX, mouseY,0));
  //grappArray.add(new Grapp(cos(mouseX)+400, cos(mouseY)+400,0));
}

