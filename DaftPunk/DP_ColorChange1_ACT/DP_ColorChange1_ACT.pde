import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

class Input
{
  float      amplitude;
  Minim      minim;
  FFT        fft;
  Frequency  freq;
  AudioInput in;

  //  Future: take an int that specifies the channel of this input?
  // It will have to know from what line to get the audio, so probably yes.
  Input()
  {
    this.minim  = new Minim(this);
    this.in  = minim.getLineIn();
    this.fft    = new FFT(in.bufferSize(), in.sampleRate());
    this.setFreq();
  } // constructor

  /**
   * Performs a foward transform on the AudioInput instance var,
   * uses logAverages to group near frequencies and calculate
   * their average amplitude, determines which is the dominant frequency
   * (by which has the highest amplitude), and sets the Frequency instance
   * var to be equal to this dominant/loudest frequency.
   * Also sets the amplitude instance var.
   *
   * (To produce correct results, this function needs to be called repeatedly,
   * and should only be called from the constructor or in one of the getFreq functions.)
   */
  void setFreq()
  { 
    this.fft.forward(this.in.mix);

    // each average should hopefully be about one half step,
     // since there are 11 averages and each is split into 12 parts.
     // (Could calculate smaller averages to get a closer frequency match, e.g. "this.fft.logAverages(11,48);"
    //this.fft.logAverages(11,12);

    float  loudFreq = 0;
    float  loudFreqAmp  = 0;    // amplitude of the loudestAvg average band
    int    loudAvg    = 0;      // average band w/the highest amplitude

    /*
   for(int i = 0; i < this.fft.avgSize(); i++)
     {
     float lowFreq = this.fft.getAverageCenterFrequency(i) - (this.fft.getAverageBandWidth(i) / 2);
     float hiFreq  = this.fft.getAverageCenterFrequency(i) + (this.fft.getAverageBandWidth(i) / 2);
     float avgAmp = this.fft.calcAvg(lowFreq, hiFreq);
     
     if(avgAmp > loudestFreqAmp)  
     {  
     loudestAvg  = i;
     loudestFreqAmp  = avgAmp;
     loudestFreq = this.fft.getAverageCenterFrequency(i);
     } // if
     } // for
     */

    for (int i = 0; i < this.fft.specSize(); i++)
    {
      if (this.fft.getBand(i) > loudFreqAmp)
      {
        loudFreq = this.fft.indexToFreq(i);
        loudFreqAmp = this.fft.getFreq(loudFreq);
      } // if
    } // for

    this.freq = Frequency.ofHertz((float)loudFreq);
    this.amplitude  = loudFreqAmp;
  } // setFreq

  /**
   * Calls setFreq(), then returns the Frequency instance var.
   */
  Frequency getFreq()
  {
    this.setFreq();
    return this.freq;
  } // getFreq()
  /**
   * Calls setFreq(), then returns the Frequency instance var in hertz.
   */
  float getFreqAsHz()  
  {
    this.setFreq();
    return this.freq.asHz();
  }

  /**
   * Calls setFreq(), then returns the midi note value of the Frequency instance var.
   */
  float getFreqAsMidiNote()  
  {
    this.setFreq();
    return this.freq.asMidiNote();
  }

  float getAmplitude() {
    this.setFreq();
    return this.amplitude;
  }
} // class