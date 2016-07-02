abstract class RosetteV3 extends Scene
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   */

  float radius1;
  float radius2;
  float radius3;
  float radius4;
  float radius5;
  float radius6;

  float  rotateBy;

  RosetteV3(Input leftInput, Input rightInput)
  {
    this.leftInput  = leftInput;
    this.rightInput = rightInput;

    this.rotateBy  = 0;

    this.radius1 = 40;
    this.radius2 = 100;
    this.radius3 = 270;
    this.radius4 = radius3 * 1.4;
    this.radius5 = 500;
    this.radius6 = 725;
  } // RosetteV3

  void run()
  {
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

    if (rightInput.getAmplitude() > 0.001) {
      rotateBy = (rotateBy + (rightInput.getAdjustedFundAsHz() / 400)) % 360;
    }
  } // run()
}// RosetteV3 