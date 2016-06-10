import processing.serial.*;

/*
  05/30/2016
  Emily Meuer
  
  This is another way of going about the example in FrequencyAttempts,
  but using the Input object defined in the InputClass tab
  rather than doing all the computations by hand in draw.
  
  USB emulate serial port?
*/

InputPitch      testInput;
MultipleInputs  multipleInputs;
Serial          port;

void settings()
{
   size(500, 500);
}

void setup()
{
  // minim must be initialized outside of Input in order to pass the correct value of "this" to its constructor.
  this.minim  = new Minim(this);
  testInput  = new InputPitch();
  
  // Creating a new MultipleInputs object from an array of Strings of filenames:
  String[] names = { "Horn-ChordsPart1.wav", "Horn-ChordsPart2.wav" };
  this.multipleInputs  = new MultipleInputs(names);
  
  // Adding an InputPitch to the MultipleInputs object:
  InputPitch  input3  = new InputPitch("Horn-ChordsPart3.wav");
  this.multipleInputs.add(input3);
  
  // Adding an input by providing the name of an audio file:
  this.multipleInputs.add("Horn-54321.wav");
  
//  printArray(Serial.list());
  
//  port  = new Serial(this, Serial.list()[0], 9600);
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  background(200);
  stroke(225, 75, 250);
  fill(225, 75, 250);
  
  for(int i = 0; i < this.multipleInputs.size(); i ++)
  {
    InputPitch cur = this.multipleInputs.get(i);
    ellipse((i + 1) * 100, (height - cur.getAdjustedFundAsHz()), 100, 100);
  } // for
  
  // print is not necessary, but gives you a behind-the-scenes peek at the numbers:
//  println("this.fundamental: " + testInput.getFundAsHz() + "; this.adjustedFund: " + testInput.getAdjustedFundAsHz() + "; this.amplitude: " + this.testInput.getAmplitude());
  
  // divide value by 5 b/c too large for a color value otherwise:
//  background(testInput.getAdjustedFundAsHz() / 3, 0, 0);
  
  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFundAsMidiNote() * 2, 0, 0);
}