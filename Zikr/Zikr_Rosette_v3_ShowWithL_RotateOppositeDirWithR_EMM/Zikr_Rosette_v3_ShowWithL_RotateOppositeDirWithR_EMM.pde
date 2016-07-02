/*
  Emily Meuer
 06/28/2016
 
 Modified Zikr_Rosette_v3_MRA:
 added more rosettes, which appear at higher pitches in the left input,
 and added rotation, controlled by the right input.
 
 06/22/2016
 Michaela Andrews
 - making one large geometric design
 - perhaps have the lower voices add the geometry and the higher voices add color??
 - or what if each singer controlled their own rosette?
 - use i % 2 to switch between radii every other point for more desings?
 */


float radius1;
float radius2;
float radius3;
float radius4;
float radius5;
float radius6;

float x1, x2, y1, y2;
Input  leftInput;
Input  rightInput;

float  rotateBy;

void setup() {
  background(0);
  leftInput = new Input(true, false);
  rightInput  = new Input(false, true);

  radius1 = 40;
  radius2 = 100;
  radius3 = 270;
  radius4 = radius3 * 1.4;
  radius5 = 500;
  radius6 = 725;
  
  rotateBy  = 0;
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float pitch = leftInput.getAdjustedFundAsHz();

/*
   Frequencies:
   Eb 3      -  155.56
   Fb (E) 3  -  164.81
   G 3       -  196.00
   Ab 3      -  207.65
   Bb 3      -  233.08
   C 4       -  261.63
   Fb (E) 4  -  329.63
*/

//  println("pitch = " + pitch);
  if (pitch > 160) {
    pushMatrix();
    rotate(radians(rotateBy));
    rosettePartThree(radius1);
    popMatrix();
  }
  if (pitch > 190) {
    pushMatrix();
    rotate(radians(-rotateBy));
    rosettePartThree(radius2);
    popMatrix();
  }
  if (pitch > 200) {
    pushMatrix();
    rotate(radians(rotateBy));
    rosettePartTwo(radius3);
    popMatrix();
  }
  if (pitch > 225) {
    pushMatrix();
    rotate(radians(-rotateBy));
    rosettePartTwo(radius4);
    popMatrix();
  }
  if (pitch > 255) {
    pushMatrix();
    rotate(radians(rotateBy));
    rosettePartOne(radius5);
    popMatrix();
  }
  if (pitch > 325) {
    pushMatrix();
    rotate(radians(-rotateBy));
    rosettePartOne(radius6);
    popMatrix();
  }
  
  if(rightInput.getAmplitude() > 0.001) {
    rotateBy = (rotateBy + (rightInput.getAdjustedFundAsHz() / 400)) % 360;
  }
  
  
  
  println("leftInput.getAdjustedFundAsHz() = " + leftInput.getAdjustedFundAsHz());
}

void rosettePartOne(float radius) {
  for (int i = 0; i < 4; i++) {
    x1 = radius*cos(PI/2*i);
    x2 = radius*cos(PI/2*(i+1));
    y1 = radius*sin(PI/2*i);
    y2 = radius*sin(PI/2*(i+1));
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(3);
    stroke(50, 50, 200);
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < 4; i++) {
    x1 = radius*cos(PI/2*i+PI/4);
    x2 = radius*cos(PI/2*(i+1)+PI/4);
    y1 = radius*sin(PI/2*i+PI/4);
    y2 = radius*sin(PI/2*(i+1)+PI/4);
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(3);
    stroke(50, 50, 200);
    line(x1, y1, x2, y2);
  }
}

void rosettePartTwo(float radius) {
  for (int i = 0; i < 8; i++) {
    x1 = radius*cos(PI/4*3*i+PI/8);
    x2 = radius*cos(PI/4*3*(i+1)+PI/8);
    y1 = radius*sin(PI/4*3*i+PI/8);
    y2 = radius*sin(PI/4*3*(i+1)+PI/8);
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(2);
    stroke(50, 200, 50);
    line(x1, y1, x2, y2);
  }
}

void rosettePartThree(float radius) {
  for (int i = 0; i < 16; i++) {
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
    line(x1, y1, x2, y2);
    strokeWeight(.5);
    stroke(200, 50, 50);
    line(x1, y1, x2, y2);
  }
}