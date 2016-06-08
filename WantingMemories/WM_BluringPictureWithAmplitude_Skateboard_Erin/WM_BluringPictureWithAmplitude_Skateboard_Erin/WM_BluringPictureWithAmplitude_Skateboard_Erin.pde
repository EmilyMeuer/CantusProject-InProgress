
import ddf.minim.analysis.*;
import ddf.minim.*;

/*
  Emily Meuer
  04/15/2016
  
  Image fades and reveals a background image in response to volume.
*/

PImage      piano;
FFT         fft;
PImage      pepper;
AudioInput  input;
int         level;
Minim       minim;

void setup()
{
  size(384,640);
  
  minim  = new Minim(this);
  input = minim.getLineIn();
  
  pepper  = loadImage("blurPepper 4.04.02 PM.jpg");
  piano  = loadImage("pepper.jpg");
  pepper.resize(384,640);  
} // setup()

void draw()
{
  // volume of input:
  level  = (int)Math.floor(input.mix.level() * 1500);
  background(pepper);
  // volume used to adjust the transparency:
  tint(255,(Math.min(level,255)));
  image(piano,0,0,384,640);
} // draw() 