void bigTri() {

  noStroke();
  if (random(1) > 0.5) { //flip a coin for upward or downward triangle
    //fill(b+100,0,a, 10);
    fill(200,0,a+50,10); //set color of Triangle
    triangle(a, b+lenTria, a+lenTria/2, b, a+lenTria, b+lenTria); //Draw upward Triangle
  }
  else {
    //fill(b, a+100, 0, 10);
    fill(1,100,a+100,10); //set color of Triangle 
    triangle(a, b, a+lenTria/2, b+lenTria, a+lenTria, b); //Draw downward Triangle
  }

  a+=lenTria; //Draw Triangle on next column
  if (a>width) { //Draw next row of triangle
    a=0;
    b+=lenTria;
  }
  if (b >= height) { //Redraw from the start!
    a=0;
    b=0;
  }
}


