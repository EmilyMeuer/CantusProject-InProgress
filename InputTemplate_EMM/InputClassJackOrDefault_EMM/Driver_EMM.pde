/*
  07/06/2016
  Emily Meuer
  
  Sketch to test which mic routes to which input line.
*/

Input  input;
int    wide;
int    high;

void settings()
{
  size(400,400);
} // settings()

void setup()
{
  size(400, 400);
  
//  input  = new Input(12, new AudioContext());
  input  = new Input();
  wide   = 4;
  high   = 4;
} // setup()

void draw()
{
//  background(100);
  background(input.getAdjustedFund(1) / 2, 50, input.getAdjustedFund(1) / 2);
  color  curColor;
  
  for(int i = 1; i < input.getNumInputs(); i++)
  {
    curColor  = color(i * 18, i * 10, i * 18);
    fill(curColor);
    
//    println("input.getAmplitude(" + i + ") = " + input.getAmplitude(i));
    if(input.getAmplitude(i) > 3.5)
    {
      int x  = ((i-1) % wide) * (width / wide);
      int y  = ((i-1) / wide) * (height / high);
      rect(x, y, 100, 100);
      
      textSize(32);
      fill(255);
      text(i, (x+25), (y+50));
    } // if - amplitude
  } // for
} // draw()