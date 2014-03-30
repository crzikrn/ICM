//variables for Drifting Colors
color R = color(255,0,0);
color G = color(0,255,0);
color B = color(0,0,255);
color Y = color(255,240,0);
color GG = color(0,245,230);
color PN = color(255,77,163);
color PR = color(164,0,247);

float xRectR, xRectG, xRectB, xRectY, xRectGG, xRectPN, xRectPR;
float yRectR, yRectG, yRectB, yRectY, yRectGG, yRectPN, yRectPR;
float sizeRect;

//variables for StrokeWeight
float sw1, sw3, sw6, sw10;
float x1, x3, x6, x10, y, h;
float penX, penY, ppenX, ppenY;

//declare arrays for drifting colors
DriftC[] driftingColor = new DriftC[7];

void setup() {
  size(640,320);
  smooth();
  background(255);
  
  //for stroke
  sw1 = 1;
  sw3 = 3;
  sw6 = 6;
  sw10 = 10;
  x1 = 33;
  x3 = 43;
  x6 = 56;
  x10 = 73;
  y = 205;
  h = 70;
  
  pushStyle();
  fill(0);
  noStroke();
  rect(x1,y,sw1,h);
  rect(x3,y,sw3,h);
  rect(x6,y,sw6,h);
  rect(x10,y,sw10,h);
  popStyle();
  
  //for color
  xRectR = 30;
  xRectG = 170;
  xRectB = 270;
  xRectY = 350;
  xRectGG = 470;
  xRectPN = 600;
  xRectPR = 700;
  
  yRectR = 50;
  yRectG = 60;
  yRectB = 90;
  yRectY = 60;
  yRectGG = 75;
  yRectPN = 85;
  yRectPR = 65;
  sizeRect = 0.5;

  driftingColor[0] = new DriftC(xRectR, yRectR, sizeRect, R);
  driftingColor[1] = new DriftC(xRectG, yRectG, sizeRect, G);
  driftingColor[2] = new DriftC(xRectB, yRectB, sizeRect, B);
  driftingColor[3] = new DriftC(xRectY, yRectY, sizeRect, Y);
  driftingColor[4] = new DriftC(xRectGG, yRectGG, sizeRect, GG);
  driftingColor[5] = new DriftC(xRectPN, yRectPN, sizeRect, PN);
  driftingColor[6] = new DriftC(xRectPR, yRectPR, sizeRect, PR);
}

void draw() {
  
  //stroke & newPaper
  pushStyle();
  //BG
  noStroke();
  fill(200);
  rect(0,160,120,160);
  rect(520,160,120,160);
  fill(255);
  rect(10,175,97,130);
  ellipse(580,250,70,70);
  //Bars
  fill(0);  
  rect(x1,y,sw1,h);
  rect(x3,y,sw3,h);
  rect(x6,y,sw6,h);
  rect(x10,y,sw10,h);
  popStyle();
  
  //color
  //BG
  pushStyle();
  noStroke();
  fill(200);
  rect(0,0,width,175);
  fill(255);
  rect(0,0,width,155);
  popStyle();
  //Drifting Colors
  for(int i=0; i<driftingColor.length; i++) {
    driftingColor[i].drawCloud();
  }
}

void mousePressed() {
  for(int i=0; i<driftingColor.length; i++) {
    if(mouseX>(driftingColor[i].getX()-driftingColor[i].getS()*115) && mouseX<(driftingColor[i].getX()+driftingColor[i].getS()*115) && 
        mouseY>(driftingColor[i].getY()-driftingColor[i].getS()*65) && mouseY<(driftingColor[i].getY()+driftingColor[i].getS()*65)) {
      stroke(driftingColor[i].getC());
    }
  }
  
  if(mouseX>(x1-2) && mouseX<(x1+sw1+2) && mouseY>y && mouseY<(y+h)) {
    strokeWeight(1);
  }
  if(mouseX>(x3-2) && mouseX<(x3+sw3+2) && mouseY>y && mouseY<(y+h)) {
    strokeWeight(3);
  }
  if(mouseX>x6 && mouseX<(x6+sw6) && mouseY>y && mouseY<(y+h)) {
    strokeWeight(6);
  }
  if(mouseX>x10 && mouseX<(x10+sw10) && mouseY>y && mouseY<(y+h)) {
    strokeWeight(10);
  }
  
  if(mouseX>545 && mouseX<615 && mouseY>215 && mouseY<285) {
    background(255);
  
    fill(0);
    noStroke();
    rect(x1,y,sw1,h);
    rect(x3,y,sw3,h);
    rect(x6,y,sw6,h);
    rect(x10,y,sw10,h);
  }
}

void mouseDragged() {
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  stroke(255);
}
