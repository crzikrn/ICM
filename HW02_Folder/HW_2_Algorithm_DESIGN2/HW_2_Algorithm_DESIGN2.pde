//Karam Byun 09.16.2013
//Daniel Shiffman Tuesday Class
//Ordered Patterns & mouse Drag for messiness

int x = 0;
int y = 0;
int a = 0;
int b = 0;
int lenTri = 20; // Length of small Triangle sides
int lenTria = 120; // Length of Big Triangle sides

void setup() {
  size(748, 800);
  background(0);
  stroke(255);
  //Original line for slide location, now it's just for looks  
  line(0, height/2, width, height/2);
  noStroke();
}

void draw() {
  
  stroke(255);
  line(0, height/2, width, height/2);
  noStroke();
    
  //background drawing of Triangles
  smallTri();
  bigTri();
  
}

void mouseDragged() {
  
  //moves small triangle alignment depending on mouse location
  //fill(200,0,0,50);
  //ellipse(mouseX,height/2,20,20);
  x+=lenTri*map(mouseX, 0, width, 0, 10); //small Triangles are moved from their ordered columns!
}


