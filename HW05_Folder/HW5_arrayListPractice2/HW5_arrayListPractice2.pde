ArrayList <Bubble> bubbleArray;


void setup() {
  size(600, 600);
  bubbleArray = new ArrayList<Bubble>();
}

void draw() {
  
  background(244);
  
  fill(255,0,0);
  beginShape(TRIANGLE_STRIP);
    for (Bubble b : bubbleArray) {
     vertex(b.x,b.y);
  }
  endShape();
  
  
  for (int i = 0; i < bubbleArray.size()-1 ; i++) {
    //maybe I have to create  a new array to collect data points.
    Bubble singleBubble = bubbleArray.get(i); 
    singleBubble.update();
    singleBubble.display();
    
    Bubble nextBubble = bubbleArray.get(i+1);
    line(singleBubble.x,singleBubble.y,nextBubble.x,nextBubble.y);
    
  }
}


void mouseDragged() {
  bubbleArray.add(new Bubble(mouseX, mouseY, 3));
}

