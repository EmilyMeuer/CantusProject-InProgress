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
Input      input;

int        waitUntil;

void setup()
{
  //  testInput  = new Input();
//  input  = new Input(2);
  input  = new Input(1);
  waitUntil  = millis() + 100;
  
  input.ac.printCallChain();
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  background(0);
  stroke(225, 75, 250);
  fill(225, 75, 250);

  //scan across the pixels
  for (int i = 0; i < width - 1; i++)
  {
    // for each pixel, work out where in the current audio
    // buffer we are
    int buffIndex = i * input.ac.getBufferSize() / width;
    // then work out the pixel height of the audio data at
    // that point
    int vOffset = (int)((1 + input.ac.out.getValue(0, buffIndex)) * height / 2);
    //draw into Processing's convenient 1-D array of pixels
//    pixels[vOffset * height + i] = color(255);

/*    
    if(millis() > waitUntil)
    {
      waitUntil = millis() + 100;
      println("input: " + input + "; input.inputsUGen");
//      input.inputsUGen.update();
      println("past update - in driver");
    } // if
 */
   input.setFund();
    line(i, 50+input.ac.out.getValue(0, buffIndex)*100000, i+1, 50+input.ac.out.getValue(0, buffIndex + 1)*100000);
  }
  // paint the new pixel array to the screen
  updatePixels();
}