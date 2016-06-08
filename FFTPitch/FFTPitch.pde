/*
  Emily Meuer
  3/23/2016
  
  Experiments with FFT, bandwith, and *AVERAGES*!
*/

import ddf.minim.*;
import ddf.minim.analysis.*;

AudioInput   audioInput;
AudioPlayer  audioPlayer;
FFT          fft;
Minim        minim;
  
void setup()
{
  size(600,600, P3D);
  
  this.minim       = new Minim(this);
  this.audioPlayer = this.minim.loadFile("Rodeo.mp3", 4096);
  //this.audioInput  = minim.getLineIn(Minim.STEREO, 4096);
  this.audioPlayer.loop();
  this.fft         = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
  
  delay(500);
  
  this.fft.forward(audioPlayer.mix);
  //this.fft.logAverages(11,1);
  
  println("Bandwidth: " + this.fft.getBand(440) + "\nGetBand:\n");
  /*
  for(int i = 0; i < this.fft.specSize(); i++)
  {
    println(i + ": " + this.fft.getBand(i));
  } // for - i
  */
} // setup()

void draw()
{
} // draw()