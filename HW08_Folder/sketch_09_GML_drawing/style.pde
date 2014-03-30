class Style {
 float x,y,z;
 
 float size = 10;
 
 Style(float _x, float _y, float _z){
  x =  _x;
  y =  _y;
  z =  _z;
 }
 
 void display(){
//  /noFill();
  //stroke(0);
  noStroke();
  //fill(random(10),10);
  fill(random(255),100,0,100);
  vertex(y+random(-10,10),-x+height*.8+random(-1,1),z);
  //vertex(x,y,z);
  //noStroke();
  fill(random(255),100,0);
  //ellipse(y,-x+height*.80,size,size);
  //ellipse(y,-x+height*.80,random(-size,size),random(-size,size));
  //rect(y,-x+height*.80,random(-size,size),random(-size,size));
 
 
 }
  
}
