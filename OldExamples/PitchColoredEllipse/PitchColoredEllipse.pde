/*
  Emily Meuer
  Spring 2016

// Adapted from MicSignal2Ellipse (INSTINT files)
// From: 
// http://www.creativecoding.org/lesson/topics/audio/sound-in-processing

 In progress; will hopefully change color/size depending on pitch
 (currently mostly controlled by volume/doesn't work).   

*/

import ddf.minim.analysis.*;
import ddf.minim.*;
 
float x;
float y;
FFT          fft;
AudioInput  input;
Minim       minim;

void setup () 
{
  size (960, 540);
  smooth();
  stroke (255, 25);
  noFill ();

  x = 0;
   
  // Gets the audio
  minim = new Minim (this);
  
  input = minim.getLineIn (Minim.STEREO, 512);
  fft = new FFT( input.bufferSize(), input.sampleRate() );
  background (0);
} // setup()
 
void draw () 
{
  // sets the ellipse size relative to width and input volume:
  float dim = input.mix.level () * width;
  
  // changes color depending on input volume:
  x = input.mix.level () * 2000;
  //fill((255-(x)),(255-(x*2)),(255-(x*1.25)));
  fill(fft.getFreq(440)*200, fft.getFreq(554.4)*200, fft.getFreq(659.3)*200);
  ellipse (480, 270, 500, 500);

} // draw()