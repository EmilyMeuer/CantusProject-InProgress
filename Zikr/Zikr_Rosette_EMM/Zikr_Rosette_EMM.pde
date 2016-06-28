/*
  06/27/2016
  Emily Meuer
  
  Modification of Zikr_Rosette_MRA to respond to audio input.
*/

float l = 50;
float a, b, c;
float rotateBy;

Input  leftInput;
Input  rightInput;

void setup(){
  size(600,600);
  strokeWeight(3);
  
  rotateBy = 0.5;
  
  leftInput  = new Input(true, false);
  rightInput = new Input(false, true);
} // setup()

void draw() {
  translate(height/2,width/2);
  background(0);
//  rotate(radians(360*mouseY/height));
  rotateBy = rotateBy + 0.25 + leftInput.getAmplitude() * 5;
  rotate(radians(rotateBy));
//  mouseColor();
  pitchColor();
  rosette();
  translate(0,l*6);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(-l*5.2,0);
  rosette();
  translate(-l*5.2,0);
  rosette();
  translate(0,l*6);
  rosette();
  translate(0,l*6);
  rosette();
  translate(0,l*6);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(0,-l*6);
  rosette();
}

void rosette() {
  float n = 6;
  float angle1 = radians(180-(180*(n-2))/n);
  float angle2 = radians(240);
  c = 0;
  for (int j = 0; j < n; j++){
    rotate(angle2);
    stroke(a,b,c);
    for (int i = 0; i < n; i++){ //draws one hexagon (if n = 6)
      line(0,0,0,l);
      translate(0,l);
      rotate(angle1);
      if (i == 3){
        rotate(-angle1);
        pushMatrix();
        rotate(angle1);
      }
    }//one hexagon
    popMatrix();
    c += 30;
  }
}

void mouseColor() {
  a = 255*mouseX/width;
  b = 255*mouseY/width;
}

void pitchColor() {
  a = Math.min(255 * (leftInput.getAdjustedFundAsHz() / 500), 255);
  b = Math.min(255 * (rightInput.getAdjustedFundAsHz() / 500), 255);
} // pitchColor