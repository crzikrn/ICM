LinePoints line;
LinePoints historyLine;

void setup() {
  size(700, 700);
  noFill();

  line = new LinePoints();
  historyLine = new LinePoints();
}

void draw() {
  background(244);
  stroke(255, 0, 100);
  strokeWeight(5);
  line.display();
  //line.sz();
  stroke(0, 255, 100);
  //historyLine.display();
}

void mouseDragged() {
  line.mouseDragged();
  historyLine.mouseDragged();
}
void mouseReleased() {
  line.linePoints.clear();
  historyLine.autoPlay();
  
}

