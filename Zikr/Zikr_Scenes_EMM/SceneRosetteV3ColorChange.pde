class RosetteV3Colors extends RosetteV3
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   
   ** Color is being overridden; get rid of that.
   */

  RosetteV3Colors(Input leftInput, Input rightInput)
  {
    super(leftInput, rightInput);
  } // RosetteV3

  void run()
  {
    background(0);
    translate(width/2, height/2);

    float pitch = leftInput.getAdjustedFundAsHz();
    
    pitchColor();
    green  = 0;

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
      rosettePartThree(radius1);
      green  += 30;
    }
    if (pitch > 190) {
      rosettePartThree(radius2);
      green  += 30;
    }
    if (pitch > 200) {
      rosettePartTwo(radius3);
      green  += 30;
    }
    if (pitch > 225) {
      rosettePartTwo(radius4);
      green  += 30;
    }
    if (pitch > 255) {
      rosettePartOne(radius5);
      green  += 30;
    }
    if (pitch > 325) {
      rosettePartOne(radius6);
      green  += 30;
    }
  } // run()
}// RosetteV3 