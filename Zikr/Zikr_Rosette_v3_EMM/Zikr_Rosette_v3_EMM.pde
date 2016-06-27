/*
  Emily Meuer
  06/25/2016
  
  06/22/2016
  Michaela Andrews
  - making one large geometric design
  - perhaps have the lower voices add the geometry and the higher voices add color??
  - or what if each singer controlled their own rosette?
  - use i % 2 to switch between radii every other point for more desings?
*/

/*
//  Original values:
float radius1 = 300;
float radius2 = 220;
float radius3 = 80;
float radius4 = 460;
*/

float radius1;
float radius2;
float radius3;
float radius4;
float radius5;
float radius6;

float x1, x2, y1, y2;
Input  input;

float rotateBy;

void setup() {
  background(0);
  input = new Input();
  
  radius1 = 40;
  radius2 = 100;
  radius3 = 270;
  radius4 = radius3 * 1.4;
  radius5 = 500;
  radius6 = 725;
  
  rotateBy = 0;
}

void draw() {
  background(0);
  translate(width/2,height/2);
  /*
  radius1 = input.getAdjustedFundAsHz() / 1;
  radius2 = input.getAdjustedFundAsHz() / 1.2;
  radius3 = input.getAdjustedFundAsHz() / 7;
  */
  float rotateBy = 360 * (input.getAmplitude());
 // float rotateBy = 360 * (input.getAdjustedFundAsHz() / 360);
//  println("input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz());
//  println("rotateBy = " + rotateBy);
  
  rosettePartThree(radius1);
  rosettePartThree(radius2);
//  rotate(radians(rotateBy));
  rosettePartTwo(radius3);
  rosettePartTwo(radius4);
  rosettePartOne(radius5);
  rosettePartOne(radius6);
//  rotate(radians(360 - rotateBy));
//  rotate(radians(rotateBy));
}

void rosettePartOne(float radius) {
  for(int i = 0; i < 4; i++){
    x1 = radius*cos(PI/2*i);
    x2 = radius*cos(PI/2*(i+1));
    y1 = radius*sin(PI/2*i);
    y2 = radius*sin(PI/2*(i+1));
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(3);
    stroke(50,50,200);
    line(x1,y1,x2,y2);
  }
  for(int i = 0; i < 4; i++){
    x1 = radius*cos(PI/2*i+PI/4);
    x2 = radius*cos(PI/2*(i+1)+PI/4);
    y1 = radius*sin(PI/2*i+PI/4);
    y2 = radius*sin(PI/2*(i+1)+PI/4);
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(3);
    stroke(50,50,200);
    line(x1,y1,x2,y2);
  }
}

void rosettePartTwo(float radius) {
  for (int i = 0; i < 8; i++){
    x1 = radius*cos(PI/4*3*i+PI/8);
    x2 = radius*cos(PI/4*3*(i+1)+PI/8);
    y1 = radius*sin(PI/4*3*i+PI/8);
    y2 = radius*sin(PI/4*3*(i+1)+PI/8);
    strokeWeight(4);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(2);
    stroke(50,200,50);
    line(x1,y1,x2,y2);
  }
}

void rosettePartThree(float radius) {
  for(int i = 0; i < 16; i++){
/*
    println("cos(PI/4*3* " + i + ") = " + cos(PI/4*3*i));
    println("radius*cos(PI/4*3*(" + i + "+1)) = " + radius*cos(PI/4*3*(i+1)));
    println("radius*sin(PI/4*3*" + i + ") = " + radius*sin(PI/4*3*i));
    println("radius*sin(PI/4*3*(" + i + "+1)) = " + radius*sin(PI/4*3*(i+1)));
*/
    x1 = radius*cos(PI/4*3*i);
    x2 = radius*cos(PI/4*3*(i+1));
    y1 = radius*sin(PI/4*3*i);
    y2 = radius*sin(PI/4*3*(i+1));
    strokeWeight(1);
    stroke(220);
    line(x1,y1,x2,y2);
    strokeWeight(.5);
    stroke(200,50,50);
    line(x1,y1,x2,y2);
  }
}