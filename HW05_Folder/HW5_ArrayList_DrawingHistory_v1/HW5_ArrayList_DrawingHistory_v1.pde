ArrayList <Point> lines;
ArrayList <Point> historyLine;

void setup() {
  size(700, 700);
  background(244);
  fill(255, 0, 0100);
  lines = new ArrayList <Point> ();
  historyLine = new ArrayList <Point> ();
}

void draw() {
  background(244);
  stroke(255, 0, 100);

  beginShape(QUAD_STRIP);

  for (int i = 0; i < lines.size(); i++) {
    Point a = lines.get(i);
    a.move();
    vertex(a.x, a.y);
    if (lines.size() > 0) {
      historyLine.add(new Point(a.x, a.y));
      println(historyLine.size());
    }
    if (lines.size()>100) {
      lines.remove(0);
    }
  }
  endShape();
    beginShape(QUAD_STRIP);

  for (int i = 0; i < historyLine.size(); i++) {
    historyLine.get(i).move();
    vertex(historyLine.get(i).x, historyLine.get(i).y);
    if (historyLine.size()>100) {
      historyLine.remove(0);
    }
  }

  endShape();
  
}

void mouseDragged() {
  lines.add(new Point(mouseX, mouseY));
}
void mouseReleased() {

  lines.clear();
  println(historyLine.size());

}

