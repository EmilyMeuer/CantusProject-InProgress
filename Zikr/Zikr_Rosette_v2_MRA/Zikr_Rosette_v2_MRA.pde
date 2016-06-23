/*
  06/22/2016
  Michaela Andrews
  - making a rosette pattern using shapes instead of lines
*/

float radius = 30;

void setup(){
  background(0);
  size(600,600);
  strokeWeight(3);
  stroke(50,50,200);
  fill(200);
}

void draw() {
  background(0);
  translate(50,50);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(6.1*radius,0);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(6.1*radius,0);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(0,5.35*radius);
  rosette();
  translate(6.1*radius,0);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
  translate(0,-5.35*radius);
  rosette();
}

void rosette() {
  float n = 6;
  float x, y;
  float angle1 = radians(180-(180*(n-2))/n);
  float angle2 = radians(-60);
  for (int j = 0; j < n; j++){
    beginShape();
    for (int i = 0; i < n; i++){
    x = cos(angle1*i)*radius;
    y = sin(angle1*i)*radius;
    vertex(x,y);
    }
    endShape(CLOSE);
    rotate(angle2);
    translate(radius,radius*1.8);
    
  }
}