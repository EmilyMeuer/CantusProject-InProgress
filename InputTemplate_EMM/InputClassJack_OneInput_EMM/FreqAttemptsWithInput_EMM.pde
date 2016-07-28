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
  testInput  = new Input();
  //  input  = new Input(2);
  println("FreqAttempts.setup()");
  waitUntil  = millis() + 100;
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  background(0);
  stroke(250, 25, 250);
  fill(250, 25, 250);

  float[] features = testInput.ps.getFeatures();
    if(features != null){
      for(int x = 0; x < width; x++){
          int featureIndex = (x * features.length) / width;
          int barHeight = Math.min((int)(features[featureIndex] *
                                            height), height - 1);
          line(x, height, x, height - barHeight);
      } // for
    } // if
  
    println("testInput.getAmplitude() = " + testInput.getAmplitude());
}