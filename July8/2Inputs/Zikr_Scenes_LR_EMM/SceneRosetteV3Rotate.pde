class RosetteV3Rotate extends RosetteV3Colors
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   */
   
   // Calibrate:
   float  amp             = 0.01;  // pitches with amplitudes below this will not change rotation.
   int  changeInRotation  = 250;  // higher number = slower rotation
                                  // (pitch is divided by this number, and the resulting decimal value is added to rotateBy).

  RosetteV3Rotate(Input leftInput, Input rightInput, int tenorCutoff)
  {
    super(leftInput, rightInput, tenorCutoff);
    
    this.tenorCutoff  = tenorCutoff;
  } // RosetteV3Rotate

  void run()
  {
    if (rightInput.getAmplitude() > amp) {
      super.rotateBy = (super.rotateBy + (rightInput.getAdjustedFundAsHz() / changeInRotation)) % 360;
    }
    
    super.run();
  } // run()
}// RosetteV3 