public abstract class Scene
{
  /*
    06/29/2016
   Emily Meuer
   
   Interface to allow a sketch to cycle through different scenes.
   
   (Could have a next and previous capability.)
   */

  float  red;      // red and blue are set in pitchColor;
  float  green;    // green must be set to 0 and += 30 each time something is drawn.
  float  blue;
  
  color  strokeColor;
  
  color  originalOne    = color(50, 50, 200);
  color  originalTwo    = color(50, 200, 50);
  color  originalThree  = color(200, 50, 50);
  // Original colors:
  //  one:    (50, 50, 200);
  //  two:    (50, 200, 50);
  //  three:  (200, 50, 50);

  float  x1, x2, y1, y2;  // Used for drawing the lines that make up each rosette

  Input  leftInput;
  Input  rightInput;
  
  Input  input;
  int    tenorCutoff;

  void run() {
  }

  void pitchColor() {
    red   = Math.min(255 * (input.getAverageFund(1, this.tenorCutoff - 1) / 800), 255);
    blue  = Math.min(255 * (input.getAverageFund(this.tenorCutoff, input.numInputs) / 800), 255);
  } // pitchColor

  void rosettePartOne(float radius, color strokeColor) {
    for (int i = 0; i < 4; i++) {
      x1 = radius*cos(PI/2*i);
      x2 = radius*cos(PI/2*(i+1));
      y1 = radius*sin(PI/2*i);
      y2 = radius*sin(PI/2*(i+1));
      strokeWeight(4);
      stroke(220);
      line(x1, y1, x2, y2);
      strokeWeight(3);
      stroke(strokeColor);
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
      stroke(strokeColor);
      line(x1, y1, x2, y2);
    }
  } // rosettePartOne

  void rosettePartTwo(float radius, color strokeColor) {
    for (int i = 0; i < 8; i++) {
      x1 = radius*cos(PI/4*3*i+PI/8);
      x2 = radius*cos(PI/4*3*(i+1)+PI/8);
      y1 = radius*sin(PI/4*3*i+PI/8);
      y2 = radius*sin(PI/4*3*(i+1)+PI/8);
      strokeWeight(4);
      stroke(220);
      line(x1, y1, x2, y2);
      strokeWeight(2);
      stroke(strokeColor);
      line(x1, y1, x2, y2);
    }
  } // rosettePartTwo

  void rosettePartThree(float radius, color strokeColor) {
    for (int i = 0; i < 16; i++) {
      x1 = radius*cos(PI/4*3*i);
      x2 = radius*cos(PI/4*3*(i+1));
      y1 = radius*sin(PI/4*3*i);
      y2 = radius*sin(PI/4*3*(i+1));
      strokeWeight(1);
      stroke(220);
      line(x1, y1, x2, y2);
      strokeWeight(.5);
      stroke(strokeColor);
      line(x1, y1, x2, y2);
    } // for
  } // rosettePartThree
} // Scene