XML xml;

void setup(){
 size(500,500);
 loadData(); 
 
}

void draw(){
  
}

void loadData(){
  xml = loadXML("katsu.xml");
  XML[] children = xml.getChildren("p");
  //XML x = children[1].getChild("x");
  //float X = x.getInt("x");
  //print(children[0]);
  
}
