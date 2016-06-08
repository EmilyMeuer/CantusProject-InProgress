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

void setup()
{
   testInput  = new Input();
}

void draw()
{
  // print is not necessary, but gives you a behind-the-scenes peek at the numbers:
  println("this.freq: " + testInput.getFreqAsHz() + "; this.adjustedFreq: " + testInput.getAdjustedFreqAsHz() + "; this.amplitude: " + this.testInput.getAmplitude());
  
  // divide value by 5 b/c too large for a color value otherwise:
  background(testInput.getAdjustedFreqAsHz() / 5, 0, 0);
  
  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFreqAsMidiNote() * 2, 0, 0);
}