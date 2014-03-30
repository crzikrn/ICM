
float w = 900;
float h = 500;
int num = 5000;
bubble[] b1 = new bubble[num];


void setup() {
  noStroke();
  size(900, 500);
  for (int i = 0; i < num; i++) {
    b1[i] = new bubble(random(w), random(h));
  }
}

void draw() {

  background(0);
  for (int i = 0; i < num; i++) {
    b1[i].drawBubble();
    for (int j = i+1; j < num; j++) {

      b1[i].collide(b1[j]);
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    for (int i = 0; i < num; i++) {
      b1[i].x += 10;
      b1[i].xspd++;
    }
  }
  if (keyCode == LEFT) {
    for (int i = 0; i < num; i++) {
      b1[i].x -= 10;
    }
  }
}

