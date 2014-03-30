ArrayList <Bubble> bubbleArray;

void setup() {
  size(800, 800);
  bubbleArray = new ArrayList<Bubble>();
}

void draw() {
  background(244);
  float thick = random(10);

  stroke(random(255), random(255), random(255), 50);

  if (bubbleArray.size()>1000) {
    bubbleArray.clear();
    strokeWeight(thick);
  }

  beginShape();

  fill(255, 0, 0100);

  vertex(0, height);
  vertex(width, height);

  for (int i = 0; i<bubbleArray.size();i++) {
    Bubble single = bubbleArray.get(i);
    single.update();
    vertex(single.x, single.y);
    if (single.x > width) {
      bubbleArray.add(new Bubble(0, single.y, 3)); 
      bubbleArray.remove(i);
    }
  }
  endShape();
}

void mouseDragged() {
  bubbleArray.add(new Bubble(mouseX, mouseY, 3));
}

void keyPressed() {
  bubbleArray.clear();
}

class Bubble {
  float x, y, sz;
  float offset;
  float t;

  Bubble(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
  }

  void update() {
    display();
    move();
  }

  void lnDraw(Bubble other) {
    line(x, y, other.x, other.y);
  }

  void display() {
    ellipse(x, y, sz, sz);
    if (x>width-1) {
      fill(random(255), random(255), random(50), random(255));
    }
  }

  void move() {
    y+=random(-2, 2);
    x++;
  }
}


