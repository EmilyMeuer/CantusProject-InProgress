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

float  rotateBy;
float  rotateRate;
float  changeInRotateRate;

void setup() {
  background(0);
  input = new Input();
  
  radius1 = 80;
  radius2 = 220;
  radius3 = 330;
  
  rotateBy           = 0;
  rotateRate         = 1;
  changeInRotateRate = 1;
}

void draw() {
  background(0);
  translate(width/2,height/2);
  
//  println("input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz());
//  println("rotateBy = " + rotateBy);
  
  pushMatrix();
  rotate(radians(rotateBy));
  rosettePartThree(radius1);
  popMatrix();
  
  pushMatrix();
  rotate(radians(-rotateBy));
  rosettePartTwo(radius2);
  popMatrix();
  
  pushMatrix();
  rotate(radians(rotateBy));
  rosettePartOne(radius3);
  popMatrix();
  
  changeInRotateRate = input.getAdjustedFundAsHz() - input.getAdjustedPrevFundAsHz();
  println("rotateRate = " + rotateRate);
//  changeInRotateRate = input.getAdjustedFundAsHz() - 400;
  rotateRate = rotateRate * (changeInRotateRate + 1);
  rotateBy = (rotateBy + rotateRate) % 360;
  println("changeInRotateRate = " + changeInRotateRate + ";  rotateRate = " + rotateRate + ";  rotateBy = " + rotateBy);
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