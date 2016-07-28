import processing.serial.*;

/*
  07/02/2016
 Emily Meuer
 
 Driver to test InputClassJack_EMM.
 */

Input      testInput;
//MultipleInputs  multipleInputs;
Serial          port;
Input      input;

int        waitUntil;

void settings()
{
  size(600,600);
}

void setup()
{
  testInput  = new Input(4);
  waitUntil  = millis() + 100;
 
  println("testInput.getAverageFunds(new int[] { 1, 2}) = " + testInput.getAverageFund(new int[] { 1, 2}));
}

void draw()
{
  background(255);
  stroke(250, 25, 25);
  fill(250, 25, 25);
  
//  println("testInput.frequencyArray[0] = " + testInput.frequencyArray[0]);
//  println("testInput.getAverageFunds(new int[] { 1, 2}) = " + testInput.getAverageFund(new int[] { 1, 2}));

  ellipse(width/4, height - testInput.getAmplitude(1), 50, 50);
  
  stroke(150, 50, 150);
  fill(150, 50, 150);
  ellipse(width/2, height - testInput.getAverageFund(new int[] { 1, 2}), 50, 50);
  
  stroke(25, 25, 250);
  fill(25, 25, 250);
  ellipse(width - width/4, height - testInput.getAmplitude(2), 50, 50);

  
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