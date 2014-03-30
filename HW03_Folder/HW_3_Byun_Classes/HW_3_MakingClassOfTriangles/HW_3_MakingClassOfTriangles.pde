
Tri t = new Tri();
Tri t1 = new Tri();

void setup() {
  size(748, 800);
  background(0);
}

void draw(){
  t.lines(); //Draw lines effect for small triangles var "t"
  
  fill(t.x,t.y+100,0,20); //Fill of background triangles
  t1.triPattern(100,100); //Draw big triangle pattern var "t1"
  
  fill(t.x+100,0,t.y,100); //Fill of small triangles
  t.triPattern(20,140); //Draw small triangle pattern var "t"
  
  //Don't refresh when big triangles finish first.
  //Refresh Background only when small triangle finishes its bottom row.
  
  if(t.x ==0 && t.y == 0){
    background(random(0,20));
    t1.x = 0;
    t1.y = 0;
  }
  
}

