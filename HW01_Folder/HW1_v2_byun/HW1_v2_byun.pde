size(720, 360);
background(30);
noStroke();
int a = width;
int b = height;
//background shapes
for (int i = 0 ; i<2800 ; i++) {
  float r = random(1, 5);
  float q = random(1, 4);
  fill(random(255));
  rect(random(0, a), random(0, b), r, q);
  fill(random(155), random(55), random(5));
  rect(random(0, a), random(0, b), r, q);
  ellipse(random(0, a), random(0, b), r, q);
}
//quadrilateral on left
fill(125, 12, 60, 200);
quad(7, 7, 150, 400, 378, 280, 120, 95);
//ellipses
noFill();
stroke(201, 80, 50);
for (int i = 300;i<900;i+=100) {
  ellipse(width/2, 100, i, 80);
  ellipse(width, 310, i+100, 90);
}
//triangle
fill(255, 25);
stroke(20, 124, 255);
triangle(200, 220, 600, 175, 400, 240);
//rectangles lining
noStroke();
for (int i = 100;i<width;i+=50) {
  fill(random(199), 100, 100);
  rect(i+150, i-100, 15, 150);
}

