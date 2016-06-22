/*
  06/21/2016
  Michaela Andrews
  - starting with making a tile pattern that will later be controlled by inputs
  - perhaps have the inputs control the color/brightness of each piece of the pattern
*/

Polygon[] myTriangles;
Polygon   myCenter;
int polygons = 7;
int z = 600; //side length of square screen
             //I can't get width and height to work up here for the array...
float theta = radians(360/polygons);
float xpos[] = {z*0.5, z*0.25, z*0.25, z*0.75, z*0.75};
float ypos[] = {z*0.5, z*0.25, z*0.75, z*0.25, z*0.75};

void setup(){
  size(600,600);
  myTriangles = new Polygon[polygons];
  for (int i = 0; i < polygons; i++){
    myTriangles[i] = new Polygon(30,3,color(0,100,100));
  }
  myCenter = new Polygon(40,7,color(100,0,0));
}

void draw(){
  background(0);
  for (int j = 0; j < xpos.length; j++){
    pushMatrix(); 
    translate(xpos[j], ypos[j]);
    myCenter.show(0,0);
        for (int i = 0; i < polygons; i++){
        pushMatrix();
        rotate(i*theta);
        translate(0,70);
        myTriangles[i].show(0,0);
        popMatrix();
      }
      popMatrix();
    }
}


class Polygon {
  float sx, sy, radius, npoints, angle;
  color c;
  Polygon(float inRadius, int inPoints, color inColor){
    c = inColor;
    radius = inRadius;
    npoints = inPoints;
    angle = TWO_PI / npoints;
  }
  void show(float x, float y) {  
    beginShape();
    fill(c);
    stroke(150);
    strokeWeight(5);
    for (float a = 0; a < TWO_PI; a += angle) {
      sx = x + cos(a) * radius;
      sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}