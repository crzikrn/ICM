
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
    drifter[i].theta = random(-2,2);
    drifter[i].radius = random(100,400);
    
    drifter2[i] = new thread(xv, yv, 1, R, true);
    xv+=5;
    yv = int(random(0, width/2));
    
    
  }
}

void draw() {
  //  background(0);
  for (int i = 0; i<num;i++) {
    drifter[i].render();
    drifter2[i].render2();
   }
}

