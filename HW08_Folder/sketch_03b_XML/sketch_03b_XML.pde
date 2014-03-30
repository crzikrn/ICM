XML xml;

void setup() {
  size(500, 500);
  xml = loadXML("data.xml");
  XML[] children = xml.getChildren("bubble");
}

void draw() {
}

void loadData() {

  //XML x = children[1].getChild("x");
  //float X = x.getInt("x");
  //print(children[0]);
}

