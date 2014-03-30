class LinePoints {

  ArrayList <Point> linePoints;
  int size;

  LinePoints() {

    linePoints = new ArrayList <Point> ();
    size = linePoints.size();
  }

  void display() {
    beginShape();

    for (int i = 0; i < linePoints.size(); i++) {
      Point a = linePoints.get(i);
      a.move();
      vertex(a.x, a.y);

      if (linePoints.size()>100) {
        linePoints.remove(0);
      }
    }
    endShape();
  }

  void mouseDragged() {
    linePoints.add(new Point(mouseX, mouseY));
  }
  
  void autoPlay(){
    if(!linePoints.isEmpty()){
      for(int i = 0; i<linePoints.size()-1;i++){
        Point a = linePoints.get(i);
        linePoints.set(i+1,a);
        display();
      }
    }
    
  }
  
}

