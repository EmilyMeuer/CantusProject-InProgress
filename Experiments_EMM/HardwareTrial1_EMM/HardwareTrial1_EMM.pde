import processing.serial.*;

/*
  05/30/2016
 Emily Meuer
 
 This is another way of going about the example in FrequencyAttempts,
 but using the Input object defined in the InputClass tab
 rather than doing all the computations by hand in draw.
 
 USB emulate serial port?
 */

Input      testInput;
MultipleInputs  multipleInputs;
Serial          port;

void setup()
{
  testInput  = new Input();
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  background(200);
  stroke(225, 75, 250);
  fill(225, 75, 250);

  // print is not necessary, but gives you a behind-the-scenes peek at the numbers:
  //  println("this.fundamental: " + testInput.getFundAsHz() + "; this.adjustedFund: " + testInput.getAdjustedFundAsHz() + "; this.amplitude: " + this.testInput.getAmplitude());

  // divide value by 5 b/c too large for a color value otherwise:
    background(testInput.getAdjustedFundAsHz() / 3, 0, 0);

  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFundAsMidiNote() * 2, 0, 0);
}