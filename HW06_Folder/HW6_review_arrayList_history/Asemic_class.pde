class Asemic {

  ArrayList<PVector> asemic;

  Asemic() {
    asemic = new ArrayList<PVector> ();
  }

  void display() {
    noStroke();
    beginShape(QUAD_STRIP);

    move();
    for (int i = 0; i< asemic.size();i++) {
      PVector instance = asemic.get(i);

      vertex(instance.x, instance.y);

      if (asemic.size() > 100) {
        asemic.remove(0);
      }
    }
    endShape();
  }

  void move() {
    for (int i = 0; i< asemic.size();i++) {
      PVector instance = asemic.get(i);
      instance.y = instance.y + random(-1, 1);
    }
  }

  void advance() {
    //delay(100);
    if (asemic.size() > 0) { 
      Asemic old = new Asemic();
      
      //for (int i = asemic.size(); i > 0; i--) {
      for(int i = 0; i < asemic.size()-1; i++){
         old.asemic.add(asemic.get(i+1));
              
        //asemic.add(i, previous);
        //instance = previous;
        //asemic.add(asemic.size(), asemic.get(0));
      }
      old.asemic.add(asemic.get(0));
      //asemic.clear();
      old.display();
      
      
//     for(int i = 0; i < asemic.size(); i++){
//
//       asemic.addAll(0,asemic);
//       
//     }
      
    }
  }
}

