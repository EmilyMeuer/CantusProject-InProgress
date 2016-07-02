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
  testInput  = new Input(2);
  waitUntil  = millis() + 100;
}

// The setup() function is called in the InputClass tab;
// put all necessary setup code there.

void draw()
{
  background(255);
  stroke(150, 25, 150);
  fill(150, 25, 150);
  
//  println("testInput.frequencyArray[0] = " + testInput.frequencyArray[0]);
  
  ellipse(width/4, height - testInput.getAdjustedFund(0), 50, 50);
  
  stroke(25, 150, 25);
  fill(25, 150, 25);
  ellipse(width - width/4, height - testInput.getAdjustedFund(1), 50, 50);
  
//  println("testInput.getFund(0) = " + testInput.getFund(0));
//  println("testInput.getFund(1) = " + testInput.getFund(1));
//  println();
  
  /*

  float[] features = testInput.psArray[0].getFeatures();
    if(features != null){
      for(int x = 0; x < width; x++){
          int featureIndex = (x * features.length) / width;
          int barHeight = Math.min((int)(features[featureIndex] *
                                            height), height - 1);
          line(x, height, x, height - barHeight);
      } // for
    } // if
    
    stroke(25, 150, 25);
    float[] features2 = testInput.psArray[1].getFeatures();
    if(features != null){
      for(int x = 0; x < width; x++){
          int featureIndex = (x * features2.length) / width;
          int barHeight = Math.min((int)(features2[featureIndex] *
                                            height), height - 1);
          line(x, height, x, height - barHeight);
      } // for
    } // if
    */
  
//    println("testInput.getAmplitude() = " + testInput.getAmplitude());
}