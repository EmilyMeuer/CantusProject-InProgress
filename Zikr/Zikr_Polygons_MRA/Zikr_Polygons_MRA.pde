Polygon myPolygon;
Polygon myPolygon2;

void setup(){
  size(600,600);
  myPolygon = new Polygon(30,5);
  myPolygon2 = new Polygon(30,5);
}

void draw(){
  background(0);
  myPolygon.show(100,100);
  myPolygon2.show(myPolygon.getSx(),myPolygon.getSy());
}


class Polygon {
  float sx, sy, radius, npoints, angle;
  Polygon(float inRadius, int inPoints){
    radius = inRadius;
    npoints = inPoints;
    angle = TWO_PI / npoints;
  }
  void show(float x, float y) {  
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      sx = x + cos(a) * radius;
      sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  float getSx() {
    return sx;
  }
  float getSy() {
    return sy;
  }
}