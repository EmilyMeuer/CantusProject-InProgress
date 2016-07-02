class RosetteV3Rotate extends RosetteV3
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   */

  RosetteV3Rotate(Input leftInput, Input rightInput)
  {
    super(leftInput, rightInput);
  } // RosetteV3Rotate

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