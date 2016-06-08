/*
  05/30/2016
  Emily Meuer
  
  This is another way of going about the example in FrequencyAttempts,
  but using the Input object defined in the InputPitch tab
  rather than doing all the computations by hand in draw.
*/

Input testInput;

void settings()
{
   size(512, 200);
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  // print is not necessary, but gives you a behind-the-scenes peek at the numbers:
  println("this.fundamental: " + testInput.getFundAsHz() + "; this.adjustedFund: " + testInput.getAdjustedFundAsHz() + "; this.amplitude: " + this.testInput.getAmplitude());
  
  // divide value by 5 b/c too large for a color value otherwise:
  background(testInput.getAdjustedFundAsHz() / 3, 0, 0);
  
  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFundAsMidiNote() * 2, 0, 0);
}