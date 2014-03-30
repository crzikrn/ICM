color R = color(255, 255, 255);
color G = color(100,160,175,50);
//int n;
int x = 0;
int y = 0;
int count = 0;

int num = 300;
DriftC[] drifter = new DriftC[num];


void setup() {

  size(800, 450);
  background(0);
  for (int i = 0 ; i < num ; i++) {
    drifter[i] = new DriftC(x, y, 1, G);
    y+=1;
    x = int(random(0, width/2));
    
  }
}


void draw() {
  
  for (int i = 0; i<num;i++) {
    drifter[i].drawCloud();
    count++;
    
    //    float a = drifter[i].x+20;
    //    float b = drifter[i].y;
    //    strokeWeight(1);
    //    stroke(200,100,0,50);
    //    line(drifter[i].x,drifter[i].y,a,b);
  }
}

