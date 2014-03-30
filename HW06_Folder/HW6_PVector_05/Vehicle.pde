class PixelParticle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector dir;
  
  PixelParticle(){
   location = new PVector(width/2,height);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0); 
        
  }
  
  void update(){
    
//    target = new PVector(mouseX,mouseY);
//    dir = PVector.sub(target,location);
//    dir.setMag(0.5);
//    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
      
  }
  
  void applyForce(PVector force){
   acceleration.add(force); 
  }
  
  void display(){
    noStroke();
    rect(location.x,location.y, 20,20);
    
  }
  
  void checkEdges(){
    
    
  }
  
  
}
