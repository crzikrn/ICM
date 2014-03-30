class Tri {
  float x, y; //pattern starting point 
  float ln; //length of triangle sides
  float dist = 20.0; //distance between triangles
 
  Tri() {
    //set starting point of pattern
    x = 0;
    y = 0;
  }

  void triPattern(float templength, float distance) {
    //Gets user input for length of triangle and distance between triangle in the x-axis
    noStroke();
    ln = templength;
    dist = distance;

    //Draw Upward or Downward Triangle
    if (random(1) > 0.52) {
      triangle(x, y+ln, x+ln/2, y, x+ln, y+ln);
    } 
    else {
      triangle(x, y, x+ln/2, y+ln, x+ln, y);
    }

    //Draw triangle next to prior triangle
    x += distance;
    
    //Draw next row of triangles & draw new page of triangles
    if (x > width) {
      x = 0;
      y += ln;
    }
    if (y >= height) {
      x = 0;
      y = 0;
    }
  }

  //Draw lines from center point to triangles
  void lines() {
    stroke(200, 40);
    line(x, y, width/2, height/2);
  }
}

