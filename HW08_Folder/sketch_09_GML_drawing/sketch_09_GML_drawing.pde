import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

XML xml;
XML drawing;
XML[] strokes;
int num = 22115;
float ax;
Style[] graff;

PeasyCam cam;
int in =0;

void setup() {
  frameRate(500);
  size(800, 800, P3D);
  background(244);
  //cam = new PeasyCam(this, 500, 0, 2000, 800);
  cam = new PeasyCam(this, 300, 0, 1500, 200);
  //cam = new PeasyCam(this, 500, 0, 800, 100);
}


void draw() {
  
  //background(244);
  xml = loadXML("http://000000book.com/data/"+num+".gml");
  drawing = xml.getChild("tag/drawing");
  strokes = drawing.getChildren("stroke");
  rotateY(radians(in));
  beginShape(TRIANGLE_STRIP);
  for (XML s : strokes) {
    XML[] pts = s.getChildren("pt");
    graff = new Style[pts.length];

    for (int i = 0; i < graff.length; i+=1) {
      //get each element in pts and asign x,y,z value
      XML xElement = pts[i].getChild("x");
      float tempX = xElement.getFloatContent();
      float x = tempX*1000; 
      print(x);
      XML yElement = pts[i].getChild("y");
      float tempY = yElement.getFloatContent();
      float y = tempY*1000;
      print(", "  +y); 
      println();
      XML zElement = pts[i].getChild("z");
      float tempZ = zElement.getFloatContent();
      float z = tempZ*1; 
      println(z);

      graff[i] = new Style(x, y, z);
      graff[i].display();
    }
  }
  endShape();
  in++;
}

void mousePressed() {
  num+=1;
}

