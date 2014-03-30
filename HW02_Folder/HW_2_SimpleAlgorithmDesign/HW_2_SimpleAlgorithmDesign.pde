int x = 0;
int y = 0;

void setup() {
  size(800, 800);
  background(9);
  colorMode(HSB);
}

void draw() {
  if (random(1)>0.5) {
    fill(y,40,y);
    stroke(10);
    if(random(1)>0.5){
      noStroke();
    }
    rect(x, y, x+20, y+40);
    
  }
  else {
    rect(x+10, y+30, x+20, y+40);
  }
  x+=20;
  if ( x >width) {
    x=0;
    y+=20;
  }
}

