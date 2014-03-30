class Style {
 float x,y,z;
 float size = 10;
 float t = 0.0;
 
 
 Style(float _x, float _y, float _z){
  x =  _x;
  y =  _y;
  z =  _z;
 }
 
 void display(float _t){
  noFill();
  stroke(0,1);
  //loop();
  float n = noise(_t);
  //strokeWeight(3);
  n = map(n,0,1,0,500);
  //noStroke();
  //fill(random(10),10);
  //fill(random(255),100,0,100);
  //line(n,0,n,100);
  vertex(y+n,-x+height*.8+n,z+n);
  //vertex(y+random(-10,10),-x+height*.8+random(-10,10),z);
  //vertex(x,y,z);
  //noStroke();
  //fill(random(255),100,0);
  
  //ellipse(y,-x+height*.80,n,n);
  //ellipse(y,-x+height*.80,random(-size,size),random(-size,size));
  //rect(y,-x+height*.80,random(-size,size),random(-size,size));
  print("this is n" + n);
//  /_t+=0.01; 
 }
  
}
