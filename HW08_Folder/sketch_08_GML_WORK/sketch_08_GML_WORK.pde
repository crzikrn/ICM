XML xml = loadXML("http://000000book.com/data/47118.gml");
float ax;
XML drawing = xml.getChild("tag/drawing");
XML[] strokes = drawing.getChildren("stroke");
for (XML s : strokes) {
  XML[] pts = s.getChildren("pt");
  for (XML pt : pts) {
    XML[] xValue = pt.getChildren("x"); 
    XML[] yValue = pt.getChildren("y");
    println(pt);
    for(XML x : xValue){
     
     ax = x.getFloatContent();
     println(ax);
     
    }
  }
}


