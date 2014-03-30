ArrayList <bubble> bubbleArray;
ArrayList <bubble> bubbleArrayNext;
float x, y, a, b;


void setup() {
  size(1010, 1010);
  bubbleArray = new ArrayList<bubble>();
  bubbleArrayNext = new ArrayList<bubble>();
}

void draw() {
  background(244);
  int size = bubbleArray.size();
  int sizeNext = bubbleArrayNext.size();
  float thick = random(10);

  stroke(random(255), random(255), random(255), 50);

  //println(size);
  if (size>10) {
    bubbleArray.clear();
  }
  if (!bubbleArray.isEmpty()) {

    for (int i = 0; i < size ; i++) {
      //maybe I have to create  a new array to collect data points.
      bubble singleBubble = bubbleArray.get(i); 
      singleBubble.update();
      println(singleBubble.x +" "+ singleBubble.y);
    }
    ////////
    if (bubbleArray.size() > 1) {
      for (int j = 1; j < size;j++) {
        bubble singleBubbleNext = bubbleArray.get(j);
        println("previous " + singleBubbleNext.x +" "+ singleBubbleNext.y);
      }

      for (int i = 1; i < size; i++) {
        line(bubbleArray.get(i).x, bubbleArray.get(i).y, bubbleArrayNext.get(i).x, bubbleArrayNext.get(i).y);
      }
    }
    /////////
  }
}

void mousePressed() {
  bubbleArray.add(new bubble(mouseX, mouseY, 3));
}

