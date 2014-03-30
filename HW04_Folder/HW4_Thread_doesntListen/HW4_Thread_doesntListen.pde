
color R = color(230, 230, 230,50);
color G = color(100, 123, 175,50);
//int n;
int xv,yv,xh,yh = 0;
int count = 0;

int num = 100;
thread[] drifter = new thread[num];
thread[] drifter2 = new thread[num];

void setup() {
frameRate(1000);
  size(1100, 600);
  background(20);
  for (int i = 0 ; i < num ; i++) {
    drifter[i] = new thread(xh, yh, 1, G, true);
    yh+=5;
    xh = int(random(0, width/2));

    drifter2[i] = new thread(xv, yv, 1, R, false);
    xv+=5;
    yv = int(random(0, height/2));
  }
}

void draw() {
  //  background(0);
  for (int i = 0; i<num;i++) {
    drifter[i].render();
    drifter2[i].render();
    for(int q = i+1;q<num;q++){
      drifter[q].collisionChange(drifter2[i]);
    }
    for (int j = 0;j<num;j++) {
      drifter[i].collisionChange(drifter2[j]);
    }
  }
}

