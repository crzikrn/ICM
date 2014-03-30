size(720,360);
background(20);
noStroke();
int a = width;
int b = height;
for(int i = 0 ; i<100 ; i++){
  float r = random(1,50);
  float q = random(1,50);
  fill(random(255));
  rect(random(0,a),random(0,b),r,q);
  fill(random(155),random(55),random(5));
  rect(random(0,a),random(0,b),r,q);
  
}

