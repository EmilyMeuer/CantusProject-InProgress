/*
  06/22/2016
  Michaela Andrews
  - making one large geometric design
  - perhaps have the lower voices add the geometry and the higher voices add color??
  - or what if each singer controlled their own rosette?
  - use i % 2 to switch between radii every other point for more desings?
*/
float radius1 = 300;
float radius2 = 220;
float radius3 = 80;
float x1, x2, y1, y2;

void setup() {
  size(600,600);
  background(0);
}

void draw() {
  translate(width/2,height/2);
  rosettePartOne();
  rosettePartTwo();
  rosettePartThree();
}

void rosettePartOne() {
  for(int i = 0; i < 4; i++){
    x1 = radius1*cos(PI/2*i);
    x2 = radius1*cos(PI/2*(i+1));
    y1 = radius1*sin(PI/2*i);
    y2 = radius1*sin(PI/2*(i+1));
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(3);
    stroke(50,50,200);
    line(x1,y1,x2,y2);
  }
  for(int i = 0; i < 4; i++){
    x1 = radius1*cos(PI/2*i+PI/4);
    x2 = radius1*cos(PI/2*(i+1)+PI/4);
    y1 = radius1*sin(PI/2*i+PI/4);
    y2 = radius1*sin(PI/2*(i+1)+PI/4);
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(3);
    stroke(50,50,200);
    line(x1,y1,x2,y2);
  }
}

void rosettePartTwo() {
  for (int i = 0; i < 8; i++){
    x1 = radius2*cos(PI/4*3*i+PI/8);
    x2 = radius2*cos(PI/4*3*(i+1)+PI/8);
    y1 = radius2*sin(PI/4*3*i+PI/8);
    y2 = radius2*sin(PI/4*3*(i+1)+PI/8);
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(2);
    stroke(50,200,50);
    line(x1,y1,x2,y2);
  }
}

void rosettePartThree() {
  for(int i = 0; i < 16; i++){
    x1 = radius3*cos(PI/4*3*i);
    x2 = radius3*cos(PI/4*3*(i+1));
    y1 = radius3*sin(PI/4*3*i);
    y2 = radius3*sin(PI/4*3*(i+1));
    strokeWeight(1);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(.5);
    stroke(200,50,50);
    line(x1,y1,x2,y2);
  }
}