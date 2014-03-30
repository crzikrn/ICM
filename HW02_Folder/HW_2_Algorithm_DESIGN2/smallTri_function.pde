
void smallTri() {
  //Draw lines from center to triangles
  stroke(200, 40);
  line(x, y, width/2, height/2);
  //Small Triangle Draw
  noStroke();
  if (random(1) > 0.52) { //52% of drawing Triangle upward
    fill(x+100, 0, y, 100); //set color of Triangle
    triangle(x, y+lenTri, x+lenTri/2, y, x+lenTri, y+lenTri); //draw upward Triangle
  }
  else {
    fill(x, y+100, 0, 50); //set color of Triangle
    triangle(x, y, x+lenTri/2, y+lenTri, x+lenTri, y); //draw downward Triangle
  }
  
  x+=lenTri+lenTri*6; //draw triangle on next column where distnace is length of Triangle times 6
  if (x>width) { //draw next row of triangle
    x=0;
    y+=lenTri;
  }
  if (y >= height) { //draw new set of triangles for the page
    background(random(0, 25)); //change background color
    x=0;
    y=0;
  }
}
