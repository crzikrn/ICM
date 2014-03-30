ArrayList <Bubble> bubbleArray;
float x, y, a, b;

void setup() {
  size(700, 700);
  bubbleArray = new ArrayList<Bubble>();
}

void draw() {
  background(244);
  int size = bubbleArray.size();
  println(size);
  if (!bubbleArray.isEmpty()) {
    for (int i = 0; i < size ; i++) {
      //maybe I have to create  a new array to collect data points.
      Bubble singleBubble = bubbleArray.get(i); 
      singleBubble.update();

      if (bubbleArray.size() > 1) {
        Bubble singleBubblePrev = bubbleArray.get(size-2);
        Bubble singleBubbleLast = bubbleArray.get(size-1);

        x = singleBubblePrev.x;
        y = singleBubblePrev.y;
        a = singleBubbleLast.x;
        b = singleBubbleLast.y;

        println("currently " + x + " and " + y);
        line(x, y, a, b);
      }
    }
  }
}

void mousePressed() {
  bubbleArray.add(new Bubble(mouseX, mouseY, 3));
}

