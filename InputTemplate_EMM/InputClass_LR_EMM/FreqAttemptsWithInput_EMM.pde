import processing.serial.*;

/*
  05/30/2016
 Emily Meuer
 
 To try:
  - perform an FFT on each buffer separately?
 */

Input      testInput;
MultipleInputs  multipleInputs;
Serial          port;

void setup()
{
  testInput  = new Input();
}

void draw()
{
  background(200);
  stroke(150, 75, 150);
  fill(150, 75, 150);

  AudioBuffer right = testInput.source.right;
  AudioBuffer left  = testInput.source.left;
  
  /*
  float[]  rightVals = right.toArray();
  float[]  leftVals  = left.toArray();
  */
  
  testInput.fft.forward(right);
  
  for(int i = 0; i < testInput.fft.specSize() - 1; i++)
  {
    line(i, 50+testInput.fft.getBand(i)*50, i+1, 50+testInput.fft.getBand(i)*50);
  } // for - i
  
  testInput.fft.forward(left);
  
  for(int i = 0; i < testInput.fft.specSize() - 1; i++)
  {
    line(i, 250+testInput.fft.getBand(i)*50, i+1, 250+testInput.fft.getBand(i)*50);
  } // for - i
}