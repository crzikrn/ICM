//outside draw loop so it doesn't reset itself over and over
float t2 = 0;
void setup() {

  size(400, 400);
  background(0);
}


void draw() {
  background(240);
  float t1 = 0;
  
  noFill();
  beginShape();
  for (int i = 0 ;i < width; i+=3) {
    float offset = map(noise(t1,t2),0,1,-100,100);
    vertex(i,200+offset);
    t1 = t1 + 0.01;
  }
 
  endShape();
  //always after add next t1
   t2 = t2+ 0.01;
}

