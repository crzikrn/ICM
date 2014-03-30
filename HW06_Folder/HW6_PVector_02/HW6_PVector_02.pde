
int num = 500;
Mover[] mover = new Mover[1000];
Mover[] moverA = new Mover[1000];
PVector a;

void setup() {
  size(1500, 500);

  for (int i = 0;i<num;i++) {
    //PVector a = new PVector(random(width),random(height));
    mover[i] = new Mover(100,100);
    mover[i].location = new PVector(random(width), random(height));
  }

  for (int i = 0;i<num;i++) {
    //PVector a = new PVector(random(width),random(height));
    moverA[i] = new Mover(width/2, height/2);
    moverA[i].size = 4;
    moverA[i].location = new PVector(random(width), random(height));
  }
}

void draw() {
  background(244);
  for (int i = 0;i<num;i++) {
     fill(244,0,100);
    mover[i].update();
    mover[i].display();
    mover[i].checkEdges();
    mover[i].x = mouseX;
    mover[i].y = mouseY;

    for (int j=0;j<num;j++) {
      if (j!=i) {
        mover[i].collision(mover[j]);
      }
    }
  }

  for (int i = 0;i<num;i++) {
    fill(11);
    moverA[i].update();
    moverA[i].display();
    moverA[i].checkEdges();

    for (int j=0;j<num;j++) {
      if (j!=i) {
        moverA[i].collision(moverA[j]);
      }
    }
  }
}

void mouseDragged() {
  //mover.mouseDragged();
}

void mouseReleased() {
  //mover.mouseReleased();
}

