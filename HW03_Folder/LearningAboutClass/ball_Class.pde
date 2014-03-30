class ball{
  float x;
  float y;
  float size;
  
 ball(){
   
   x=width/2;
   y=height/2;
   size = 2;
     
 } 
 
 
  void display(){
    ellipse(x,y,size,size); 
  }
  
  void move(){
   y++;
   x+=random(-1,1);
    
  }
  
  
}
