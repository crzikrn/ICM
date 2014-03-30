JSONObject json;

void setup(){
  size(500,500);
  loadData();
}

void draw(){
  
  
}

void loadData(){
 
 json = loadJSONObject("data.json");
 JSONArray grafiData = json.getJSONArray("gml/tag/drawing"); 
  
}
