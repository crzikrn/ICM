class PixelParticle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector dir;
  
  PixelParticle(){
   location = new PVector(width/2,height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(0.1,0.1); 
        
  }
  
  void update(){
    
    target = new PVector(mouseX,mouseY);
    dir = PVector.sub(target,location);
    dir.setMag(0.5);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
      
  }
  
  void display(){
    noStroke();
    rect(location.x,location.y, random(1),random(10));
    
  }
  
  void checkEdges(){
    
    
  }
  
  
}
