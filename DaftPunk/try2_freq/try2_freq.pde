import ddf.minim.*; //<>//
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;
FFT fft;

void setup()
{
  size(512, 200);
  this.minim = new Minim(this);

  this.in = minim.getLineIn();
  this.fft = new FFT(in.bufferSize(), in.sampleRate());
  //this.setFreq();
}

void draw()
{
  background(0);
  float loudFreq = 0;
  float loudAmp = 0;

  for (int j=0; j<this.fft.specSize(); j++)
  {
    for (int i = 0; i<this.fft.specSize(); i++)
    {
      float freq = this.fft.indexToFreq(i);
      //float amp = this.fft.getFreq(freq);
      float amp = this.fft.getBand(i);
      if (amp>loudAmp)
      {
        println("amp is "+amp);
        loudAmp=amp;
        loudFreq=freq;
      }
    }
    if ((loudFreq>255)&&(loudFreq<270))
    {
      stroke(217, 10, 250);
      //println("Yay!");
    }
    else
    {
      stroke(255);
    }
    line(j, 50+in.left.get(j)*50, j+1, 50+in.left.get(j+1)*50);
    line(j, 150+in.right.get(j)*50, j+1, 150+in.right.get(j+1)*50);
    
  }
}