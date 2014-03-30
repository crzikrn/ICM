class DriftC {

  float x, y, scaleC;
  // x --> position x
  // y --> position y
  // scaleC --> size of the cloud
  color c;
  // c --> color

  DriftC(float _x, float _y, float _scaleC, color _c) {
    x = _x;
    y = _y;
    c = _c;
    scaleC = random((_scaleC-0.05), (_scaleC+0.05));
    // random scale
  }

  void drawCloud() {
    drifting();
    render();
  }

  // cloud drifting
  void drifting() {
    x +=1;  // moves right
    y += random(-0.5, 0.5); // moves up and down

    if (x > width+90) {
      x = random(0-90);
    }  // once it hits wall, reappears from left again
  }

  // print cloud
  void render() {
    cloud(x, y, scaleC, c);
  }

  // cloud function
  void cloud(float x, float y, float sz, color c) {
    //cloud made by bezier curves 
    //translate(120,145);
    //cloud's width=220, height=120
    noStroke();
    fill(c);
    ellipse(x, y, sz, sz);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  color getC() {
    return c;
  }

  float getS() {
    return scaleC;
  }
}

