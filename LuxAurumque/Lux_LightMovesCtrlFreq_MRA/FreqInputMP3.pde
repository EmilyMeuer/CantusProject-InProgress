import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

class freqInput
{
  /*
    Emily Meuer
    05/28/2016
    Wrapper class to make pitch of a particular input easily accessible.
    
    ed Michaela Andrews
    6/3/2016
    for use with mp3s  
  */
   
  Minim      minim;
  FFT        fft;
  Frequency  freq;
  //AudioInput input;
  AudioPlayer  player;
  
  //  Future: take an int that specifies the channel of this input?
  // It will have to know from what line to get the audio, so probably yes.
  freqInput()
  {
    minim = new Minim(this);
    player = minim.loadFile("LuxAurumque.mp3");
    this.fft    = new FFT(player.bufferSize(), player.sampleRate());
    this.setFreq();
  } // constructor
   
  /**
   * Performs a foward transform on the AudioInput instance var,
   * uses logAverages to group near frequencies and calculate
   * their average amplitude, determines which is the dominant frequency
   * (by which has the highest amplitude), and sets the Frequency instance
   * var to be equal to this dominant/loudest frequency.
   *
   * (To produce correct results, this function needs to be called repeatedly,
   * and should only be called from the constructor or in one of the getFreq functions.)
   */
  void setFreq()
  { 
    this.fft.forward(this.player.mix);
    
    // each average should hopefully be about one half step,
    // since there are 11 averages and each is split into 12 parts.
    // (Could calculate smaller averages to get a closer frequency match, e.g. "this.fft.logAverages(11,48);"
    this.fft.logAverages(11,12);
    
   float  loudestFreq = 0;
   float  loudestFreqAmp  = 0;    // amplitude of the loudestAvg average band
   int    loudestAvg    = 0;      // average band w/the highest amplitude
   
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

    this.freq = Frequency.ofHertz((float)loudestFreq);
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
} // class