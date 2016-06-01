import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

void setup()
{
  size(400, 200);
  
  minim = new Minim(this);
  
  in = minim.getLineIn();
  this.fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw()
{
  background(0);
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    float freq = fft.getFreq(i);
    println("Frequency: "+freq+" Hz.");
    if((freq > 260) && (freq < 265))
    {
      stroke(217, 10, 250);
    } //<>//
    else
    {
      stroke(255);
    }
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    //line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
}