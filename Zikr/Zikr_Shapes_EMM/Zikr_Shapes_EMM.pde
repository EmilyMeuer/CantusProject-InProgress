/*
  Emily Meuer
  06/20/2016
  
  Playing w/PShape
*/

PShape  square;

void setup()
{
  size(100,100);
  background(150,0,150);
  
  square = createShape(TRIANGLE, 0, 0, 0, 40, 40, 40);
} // setup()

void draw()
{
  shape(square, 10, 10);
} // draw()

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
} // polygon(float, float, float, int)