/*
  06/27/2016
  Emily Meuer

  Example of creating an Input object from either the right or left channel of an audio input.
 */

Input           leftInput;
Input           rightInput;
MultipleInputs  multipleInputs;

void setup()
{
  // The parameters specify (left, right).
  // To create an Input from the left channel, give (true, false) as parameters:
  leftInput  = new Input(true, false);
  // And to create one from only the right channel, give (false, true):
  rightInput = new Input(false, true);
}

void draw()
{
  background(200);
  stroke(150, 75, 150);

 // The only difference with the Input class now is that all objects have an AudioBuffer variable
 // (previously, this line would have been drawn with either leftInput.left, leftInput.right, or leftInput.mix,
 // but now we call leftInput.getBuffer()).
 // It still has the same functionality of the previous Input class -- getAmplitude(), getAdjustedFreqAsHz(), etc.
  for(int i = 0; i < leftInput.getBuffer().size() - 1; i++)
  {
    line(i, 50+leftInput.getBuffer().get(i)*50, i+1, 50+leftInput.getBuffer().get(i + 1)*50);
  } // for - i

  stroke(75, 100, 200);
  
  for(int i = 0; i < rightInput.getBuffer().size() - 1; i++)
  {
    line(i, 150+rightInput.getBuffer().get(i)*50, i+1, 150+rightInput.getBuffer().get(i + 1)*50);
  } // for - i
}