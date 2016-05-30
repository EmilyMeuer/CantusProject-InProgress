import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

class Input
{
  /*
    Emily Meuer
    05/28/2016
    
    Wrapper class to make pitch and amplitude of a 
    particular input easily accessible.
  */
   
  Minim      minim;
  FFT        fft;
  Frequency  freq;
  AudioInput input;
  //AudioPlayer player;
  
  //  Future: take an int that specifies the channel of this input?
  //  ^ No; when dealing w/multiple channels, make an Input[] 
  // (maybe even make wrapper class for that)
  // ^^ No to the no: it will have to know from what line to get the audio,
  // so this class will need to be able to get a channel.
  Input()
  {
    this.minim  = new Minim(this);
    this.input  = minim.getLineIn();
    this.fft    = new FFT(input.bufferSize(), input.sampleRate());
    this.setFreq();
  } // constructor
   
  void setFreq()
  {
    // ought I to do this in a while loop?  It will need to be called repeatedly to work,
    // but maybe it would be better to do that wherever it is that I'll be using it.
//    int  loudestFreq    = 0;
    
       this.fft.logAverages(11,12);
   
    int j = 0;
    
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
    j = i;
    /*
//  float  loudestFreqAmp = 0;
    this.fft.forward(this.input.mix);
    
    for(int i = 0; i < this.fft.specSize(); i++)
    {
      if(this.fft.getBand(i) > this.fft.getBand(loudestFreq))
      {
        loudestFreq  = i;
//        loudestFreqAmp  = this.fft.getBand(loudestFreq);
      } // if
      j = i;
    } // for
    */
  } // for
    
    println("in setFreq(), hz: " + loudestFreq + "; i = " + j);
    this.freq = Frequency.ofHertz((float)loudestFreq);
  } // setFreq
  
  Frequency getFreq()
  {
    this.setFreq();
    return this.freq;
  } // getFreq()
  
  float getFreqAsHz()  
  {
    this.setFreq();
    return this.freq.asHz();  
  }
  
  float getFreqAsMidiNote()  
  {
    this.setFreq();
    return this.freq.asMidiNote();  
  }

 /*
  void draw()
  {
    this.fft.forward(this.input.mix);
    //this.fft.forward(this.player.mix);
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
      
      //this.freq  = Frequency.ofHertz(this.fft.getAverageCenterFrequency(i));
      //println("centerFreq = " + this.fft.getAverageCenterFrequency(i) + "; Frequency, as midi note: " + freq.asMidiNote());
      //text("Frequency, as MIDI note: " + freq.asMidiNote(), 5, 30);
      
      //background(loudestAvg * 2, 0, 0);
      background(loudestFreq/5, 0, 0);
    } // for - i
    
    //println("loudestAvg = " + loudestAvg + "; getAvgCenterFreq() = " + this.fft.getAverageCenterFrequency(loudestAvg));// + "; amp = " + loudestFreqAmp);
  
    // this.fft.getAverageCenterFrequency(loudestAvg)) returns the center frequency
    // in the loudest average band (calculated above).
   } // draw
}
   */
} // class