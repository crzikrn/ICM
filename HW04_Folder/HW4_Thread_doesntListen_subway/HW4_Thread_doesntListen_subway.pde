color R = color(230, 230, 230, 50);
color G = color(100, 123, 175, 50);
color[] subway = {
  color(230, 100, 200, 50), color(255, 255, 0, 50), color(100, 100, 200, 50), color(0, 188, 65, 50), color(255, 166, 82, 50)
};
//int n;
int xv, yv, xh, yh = 0;
int count = 0;
int number = 0;

int num = 30;
thread[] drifter = new thread[num];
thread[] drifter2 = new thread[num];
thread[] drifter3 = new thread[num];
thread[] drifter4 = new thread[num];
thread[] drifter5 = new thread[num];
thread[] drifter6 = new thread[num];

PFont font;


void setup() {
  frameRate(1000);
  size(1100, 600);
  background(11);
  font = loadFont("TheSecretFontOfMonkeyIsland1991-48.vlw");
  textFont(font, 21);

  for (int i = 0 ; i < num ; i++) {
    drifter[i] = new thread(xh, yh, 1, subway[0], true);
    yh+=1;
    xh = int(random(0, width));

    drifter2[i] = new thread(xv, yv, 1, R, false);
    xv+=15;
    yv = int(random(0, height));

    drifter3[i] = new thread(xh, yh, 1, subway[1], true);
    yh+=15;
    xh = int(random(0, width));

    drifter4[i] = new thread(xv, yv, 1, subway[2], false);
    xv+=15;
    yv = int(random(0, height));

    drifter5[i] = new thread(xh, yh, 1, subway[3], true);
    yh+=15;
    xh = int(random(0, width));

    drifter6[i] = new thread(xv, yv, 1, subway[4], false);
    xv+=15;
    yv = int(random(0, height));
  }
}

void draw() {
  fill(11);
  rect(0, height-100, 500, 40);
  fill(230);
  text("RANDOMIZED SUBWAY No. "+number, 50, 530);


  if (count >= 60000) {
    number = int(random(0, 500));
    background(11);
    count = 0;
  }
  for (int i = 0; i<num;i++) {
    drifter[i].render();
    drifter2[i].render();
    drifter3[i].render();
    drifter4[i].render();
    drifter5[i].render();
    drifter6[i].render();

    count++;
    println(count);
    for (int q = i+1;q<num;q++) {
      drifter[q].collisionChange(drifter2[i]);
      drifter3[q].collisionChange(drifter4[i]);
      drifter5[q].collisionChange(drifter6[i]);
    }
    for (int j = 0;j<num;j++) {
      drifter[i].collisionChange(drifter2[j]);
      drifter3[i].collisionChange(drifter4[j]);
      drifter5[i].collisionChange(drifter6[j]);
    }
  }
}

void keyPressed() {
  background(11);
}

