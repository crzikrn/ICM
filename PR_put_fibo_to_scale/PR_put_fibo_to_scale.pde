//Fibonacci Numbers Musical Remainder Viewer
int num = 10;
int j = 0;
String[] scale = {
  "C", "D", "E", "F", "G", "A", "B"
};
String[] melody = new String[num];
String[] temp;

void setup() {
  size(500, 500);
  background(0);
  for (int i = 0; i < num; i++) {
    println(i);
    println(j);
    if (j==7) {
      j = 0;
    }
    melody[i] = scale[j];
    j++;
  }
}


void draw() {
  for (int i = 0; i < num; i++) {
    String a = melody[i];  
    println(a);
  }
}

