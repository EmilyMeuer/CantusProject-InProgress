import org.jaudiolibs.beads.AudioServerIO;
import org.jaudiolibs.beads.*;

import beads.AudioContext;
import beads.AudioIO;
import beads.IOAudioFormat;
import beads.UGen;
import beads.Gain;

import java.util.Arrays;

import org.jaudiolibs.beads.AudioServerIO;

import beads.FFT;
import beads.PowerSpectrum;
import beads.ShortFrameSegmenter;

import beads.Pitch;
import beads.Frequency;

import beads.TimeStamp;

import beads.SpectralDifference;
import beads.PeakDetector;

/*
  Original version by George Profenza
  
  Edited by Emily Meuer
  06/21/2016
  
  To run w/out Jack, uncomment these lines in setup:
    ac = new AudioContext();
    UGen microphoneIn = ac.getAudioInput();
  ...and comment out any other initializing of these same variables (e.g., "ac = new AudioContext(new AudioServerIO.Jack());").
  May get errors that the line cannot be found, but its worth a try!
  
  (This is an example from a link from this tutorial: https://groups.google.com/forum/?hl=en&fromgroups=#!topic/beadsproject/dSvxUM1l9S0,
  and sent by George P. in response to SO question.)
  
  Good discussion here:
  https://groups.google.com/forum/#!topic/beadsproject/oWEVUNHSztE/discussion
  
  Comments on FFT (they first begin in draw()):
  This float[] (i.e., features) is the FFT buffer!
  So we just need to find out what frequencies go to what place in the buffer.
  Perhaps this Pitch class will help? I kind of doubt it... 
    http://www.beadsproject.net/doc/net/beadsproject/beads/data/Pitch.html
  Otherwise FFT has methods binNumber and binFrequency that look like what we want.
    Those might not work with the PowerSpectrum?
    If they don't, can we just call calculateReal() or calculateImaginary() and not use the PS?
      ^ Don't do this!  Not necessary!  Turns out that the wheel has been invented already.
*/

public class BeadsJNA extends PApplet {

  static final long serialVersionUID = 1;

  AudioContext ac;
  ShortFrameSegmenter sfs;
  ShortFrameSegmenter sfs2;
  PowerSpectrum ps;
  PowerSpectrum ps2;
  Frequency    f;

  int  waitUntil;

  float  pitchLoc;
  Pitch  fundamental;

  void settings()
  {
    size(500, 200);
  } // settings()

  public void setup() {
    // Beads works primarily in "UGens" - unit generators - that it strings together in "chains."
    
    ac = new AudioContext();
//      ac = new AudioContext(new AudioServerIO.Jack(),512,AudioContext.defaultAudioFormat(4,4));
//    ac = new AudioContext(new AudioServerIO.Jack());
    
    
//    UGen microphoneIn = ac.getAudioInput(new int[]{1,2,3,4});
    UGen  mic1  = ac.getAudioInput(new int[] {1} );
    UGen  mic2  = ac.getAudioInput(new int[] {2} );
    //    UGen microphoneIn = ac.getAudioInput();

    // "Stringing" the mic to the gain and the gain to the AudioContext:
    Gain g = new Gain(ac, 1, 0.5f);
    //    g.addInput(microphoneIn);
    g.addInput(mic1);
    ac.out.addInput(g);

    Gain g2 = new Gain(ac, 1, 0.5f);
    g2.addInput(mic2);
    ac.out.addInput(g2);
    println("no. of inputs:  " + ac.getAudioInput().getOuts()); 

    // This splits up the frames for audio analysis - don't exactly understand why.
    sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(mic1);

    sfs2 = new ShortFrameSegmenter(ac);
    sfs2.addInput(mic2);

    FFT fft = new FFT();
    FFT fft2 = new FFT();

    // The FFT's are added as "listeners" to the ShortFrameSegmenter - like chaining, but different.
    sfs.addListener(fft);
    sfs2.addListener(fft2);

    // The PowerSpectrum is what will actually perform the FFT:
    ps = new PowerSpectrum();
    ps2  = new PowerSpectrum();

    fft.addListener(ps);

    /*
    Frequency f = new Frequency(ac.getSampleRate()) {
     public void process(TimeStamp s, TimeStamp e, float[] data) {
     super.process(s, e, data);
     System.out.println(Pitch.ftom(features));
     }
     };
     */
    f = new Frequency(44100.0f);
    // connect the PowerSpectrum to the Frequency object
    ps.addListener(f);

    
  //set up spectral difference
  SpectralDifference sd = new SpectralDifference(ac.getSampleRate());
  // sd.setFreqWindow(80.f,1100.f);
  sd.setFreqWindow(2000.f, 10000.f);
  ps.addListener(sd);

  // Peak Detector
  PeakDetector pd = new PeakDetector();
  sd.addListener(pd);    

  
    fft2.addListener(ps2);

    // Linking the ShortFrameSegmenters back to the AudioContext,
    // prob. so that they will run when it is started?
    ac.out.addDependent(sfs);
    ac.out.addDependent(sfs2);

    ac.start();
  }
  public void draw() {

    background(255);
    stroke(0);

    // This float[] is the FFT buffer!
    // So we just need to find out what frequencies go to what place in the buffer.
    float[] features = ps.getFeatures();
    //    float[] features2 = ps2.getFeatures();

    stroke(255, 50, 50);
    if (features != null) {
      for (int x = 0; x < width; x++) {
        int featureIndex = (x * features.length) / width;
        int barHeight = Math.min((int)(features[featureIndex] *
          height), height - 1);
        //         println("features[featureIndex] = " + features[featureIndex]);
        //        barHeight = barHeight * 100;
        //       println("barHeight = " + barHeight);
        line(x, height, x, height - barHeight);
      }
    } // if
    
    println("f = " + f.getFeatures());

    setFund();

    /*
    stroke(50, 50, 255);
     if(features2 != null){
     for(int x = 0; x < width; x++){
     int featureIndex = (x * features2.length) / width;
     int barHeight = Math.min((int)(features2[featureIndex] *
     height), height - 1);
     //         println("features2[featureIndex] = " + features2[featureIndex]);
     //        barHeight = barHeight * 100;
     //       println("barHeight = " + barHeight);
     line(x, height, x, height - barHeight);
     } 
     } // if
     */
  } // draw()

  void setFund()
  {
    float[]  features  = ps.getFeatures();

    // Each pitch has two attributes: a location in features, and an amplitude (value in features).
    // These are respresented by two variables: pitchLoc is the loc in features, 
    //   and fundamental is the pitch itself.

    float  findPitchLoc  = 0;
    float  findFund      = 0;
    float  findFundAmp   = 0;

    if (features != null)
    {
      for (int i = 0; i < features.length; i++)
      {
        if (features[i] > findFundAmp)
        {
          // Here's the place for the if about it being much larger than the previous i - e.g.,
          // if (this.fft.indexToFreq(i) - findFund < (findFund / 2))
          findFundAmp  = features[i];
          findPitchLoc = i;
        } // if
      } // for
    } // f (features != null)

    println("findPitchLoc = " + findPitchLoc);
  } // setFund()
} // class