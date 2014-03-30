Asemic writing;

void setup() {
  writing = new Asemic();
  size(600, 600);
  
}

void draw() {
 background(244);
 fill(244,0,100);
 writing.display(); 

 
 }

void mouseDragged(){
 writing.asemic.add(new PVector(mouseX,mouseY)); 
}

void mouseReleased(){
 writing.advance(); 
}
