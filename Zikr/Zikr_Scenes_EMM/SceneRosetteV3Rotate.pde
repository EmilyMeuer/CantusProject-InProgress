class RosetteV3Rotate extends RosetteV3Colors
{
  /*
    06/29/2016
   Emily Meuer
   
   Class that shows rosettes based on the pitch of one input
   and rotates the rosettes based on the pitch of another input.
   */

  RosetteV3Rotate(Input input, int tenorCutoff)
  {
    super(input, tenorCutoff);
    
    println("RosetteV3Rotate.constructor(int, int)");
    
    this.tenorCutoff  = tenorCutoff;
  } // RosetteV3Rotate

  void run()
  {
    if (input.getAverageAmp(this.tenorCutoff, input.numInputs) > 3) {
      super.rotateBy = (super.rotateBy + (input.getAverageFund(this.tenorCutoff, input.numInputs) / 400)) % 360;
    }
    super.run();
    /*
    background(0);
    translate(width/2, height/2);

    float pitch = this.input.getAverageFund(1, this.tenorCutoff - 1);

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
/*
    if (pitch > 160) {
      pushMatrix();
      rotate(radians(rotateBy));
      rosettePartThree(radius1, color(red, green, blue));
      popMatrix();
    }
    if (pitch > 190) {
      pushMatrix();
      rotate(radians(-rotateBy));
      rosettePartThree(radius2, color(red, green, blue));
      popMatrix();
    }
    if (pitch > 200) {
      pushMatrix();
      rotate(radians(rotateBy));
      rosettePartTwo(radius3, color(red, green, blue));
      popMatrix();
    }
    if (pitch > 225) {
      pushMatrix();
      rotate(radians(-rotateBy));
      rosettePartTwo(radius4, color(red, green, blue));
      popMatrix();
    }
    if (pitch > 255) {
      pushMatrix();
      rotate(radians(rotateBy));
      rosettePartOne(radius5, color(red, green, blue));
      popMatrix();
    }
    if (pitch > 325) {
      pushMatrix();
      rotate(radians(-rotateBy));
      rosettePartOne(radius6, color(red, green, blue));
      popMatrix();
    }
    */
  } // run()
}// RosetteV3 