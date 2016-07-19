class RosetteV3Rotate extends RosetteV3Colors
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   */
   
   // Calibrate:
   int  amp  = 3;  // pitches with amplitudes below this will not change rotation.
   int  changeInRotation  = 400;  // higher number = slower rotation
                                  // (pitch is divided by this number, and the resulting decimal value is added to rotateBy).

  RosetteV3Rotate(Input input, int tenorCutoff)
  {
    super(input, tenorCutoff);
    
    this.tenorCutoff  = tenorCutoff;
  } // RosetteV3Rotate

  void run()
  {
    if (input.getAverageAmp(this.tenorCutoff, input.numInputs) > amp) {
      super.rotateBy = (super.rotateBy + (input.getAverageFund(this.tenorCutoff, input.numInputs) / changeInRotation)) % 360;
    }
    
    super.run();
  } // run()
}// RosetteV3 