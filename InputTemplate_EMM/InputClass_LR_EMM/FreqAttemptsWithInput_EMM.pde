import processing.serial.*;

/*
  05/30/2016
 Emily Meuer
 
 To try:
  - perform an FFT on each buffer separately?
 */

Input           leftInput;
Input           rightInput;
MultipleInputs  multipleInputs;
Serial          port;

void setup()
{
  leftInput  = new Input(true, false);
  rightInput = new Input(false, true);
}

void draw()
{
  background(200);
  stroke(150, 75, 150);
  fill(150, 75, 150);

  /*
  float[]  rightVals = right.toArray();
  float[]  leftVals  = left.toArray();
  */
  
  leftInput.fft.forward(leftInput.buffer);
  
  for(int i = 0; i < leftInput.fft.specSize() - 1; i++)
  {
    line(i, 50+leftInput.fft.getBand(i)*50, i+1, 50+leftInput.fft.getBand(i)*50);
  } // for - i
  
  leftInput.source.close();
  
  rightInput.fft.forward(rightInput.buffer);
  
  for(int i = 0; i < rightInput.fft.specSize() - 1; i++)
  {
    line(i, 250+rightInput.fft.getBand(i)*50, i+1, 250+rightInput.fft.getBand(i)*50);
  } // for - i
  
  rightInput.source.close();
}