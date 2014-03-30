int num = 100;
ball [] barray = new ball[num];

void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i< num; i++) {
    barray[i] = new ball();
     barray[i].radius = random(10,300);
  }
}

void draw() {
  fill(0, 10);
  rect (0, 0, width, height);
  fill (0,255,0,100);
  noStroke();
  for (int i = 0; i< num; i++) {
   
    barray[i].render();
    barray[i].rota();
  }
}

