import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

import org.jaudiolibs.beads.AudioServerIO;
import org.jaudiolibs.beads.*;

import beads.AudioContext;
import beads.AudioIO;
import beads.IOAudioFormat;
import beads.UGen;
import beads.Gain;

import beads.ShortFrameSegmenter;
//import beads.FFT;
import beads.PowerSpectrum;

import javax.sound.sampled.AudioFormat;

Minim  minimForAll;

void settings()
{
  size(512, 200);
  // minim must be initialized outside of Input in order to pass the correct value of "this" to its constructor.
  minimForAll = new Minim(this);
}


class Input
{
  /*
    Emily Meuer
   06/29/2016
   
   Updating InputClass_EMM to communicate with Jack;
   based on BeadsJNA.
   */

  // May delete some of these:
  Frequency  adjustedFund;      // disregards values below a certain amplitude level
  Frequency  adjustedPrevFund;
  float      amplitude;
  FFT        fft;
  float      findFund;
  Frequency  fundamental;
  float      fundamentalAmp;
  AudioInput input;
  Minim      minim;
  Frequency  prevFund;
  AudioPlayer player;
  float      sensitivity;  // amplitude below which adjustedFreq will not be reset
  AudioSource source;
  float[][]    buffers;

  // New additions:
  AudioContext  ac;
  UGen          inputsUGen;
  int           waitUntil;
  ShortFrameSegmenter  sfs;
  PowerSpectrum  ps;

  Input(int numInputs)
  {
    this.ac = new AudioContext(new AudioServerIO.Jack(), 512, AudioContext.defaultAudioFormat(numInputs, numInputs));

    // creates an int[] of the input channel numbers - e.g., { 1, 2, 3, 4 } for a 4 channel input.
    int[]  inputNums  = new int[numInputs];
    for (int i = 0; i < numInputs; i++)
    {
      inputNums[i]  = i + 1;
    } // for

//    this.inputsUGen = ac.getAudioInput(inputNums);
    this.inputsUGen  = ac.getAudioInput();
    println("inputsUGen = " + inputsUGen);
    
    // Sonifying Processing and George P. do this:
    Gain g = new Gain(this.ac, 1, 0.5);
    g.addInput(inputsUGen);
    ac.out.addInput(g);

    for (int i = 0; i < inputNums.length; i++)
    {
      println("inputNums[i] = " + inputNums[i]);
    } // for
    
//    this.inputsUGen.calculateBuffer();
    
    this.buffers  = new float[inputNums.length][this.ac.getBufferSize()];
    for(int i = 0; i < buffers.length; i++)
    {
      buffers[i]  = inputsUGen.getOutBuffer(i);
      for(int j = 0; j < buffers[i].length; j++)
      {
        println("buffers[" + i + "][" + j + "]  = " + buffers[i][j]);
      } // for - j
    } // for

    this.findFund     = 120;
    this.input        = minimForAll.getLineIn();     
//    this.fft          = new FFT(input.bufferSize(), input.sampleRate());
    this.fft          = new FFT(this.ac.getBufferSize(), (int)this.ac.getSampleRate());
    this.sensitivity  = 3;
    this.source = this.input;
    
    this.ac.start();
    
    waitUntil  = millis();
    this.setFund();
  } // constructor(int)

  /**
   * Constructor for creating an Input object from line in.
   */
  Input()
  {
    IOAudioFormat jsaf = new IOAudioFormat(44100, 16, 2, 2, true, false);
    this.ac    = new AudioContext(new beads.JavaSoundAudioIO(), 512, jsaf);
    
    this.inputsUGen  = ac.getAudioInput();
    println("inputsUGen = " + inputsUGen);
    
    // Sonifying Processing and George P. do this:
    Gain g = new Gain(this.ac, 1, 0.5);
    g.addInput(inputsUGen);
    ac.out.addInput(g);
 
    sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(ac.out);
    println("added ac.out to sfs");
    beads.FFT fft = new beads.FFT();
    println("fft is " + fft);
    sfs.addListener(fft);
    println("added fft as listener to sfs");
    ps = new PowerSpectrum();
    fft.addListener(ps);
    println("added ps as listener to fft");
    ac.out.addDependent(sfs);

    this.findFund     = 120;
    this.input        = minimForAll.getLineIn();     
    this.fft          = new FFT(input.bufferSize(), input.sampleRate());
    this.sensitivity  = 3;
    this.source = this.input;
    
    println("this.ac.getBufferSize() = " + this.ac.getBufferSize());
    this.buffers  = new float[1][this.ac.getBufferSize()];
    
    this.ac.start();
    println("is the error after this?");
    
    for (int i = 0; i < this.buffers[0].length; i++)
    {
//      this.buffers[0][i]  = this.inputsUGen.getValue(0, i);
    } // for - i
//    this.setFund();
  } // constructor()

  /**
   * Constructor for creating an Input object from an audio file.
   *
   * @param  filename  String specifying the audio file.
   */
  Input(String filename)
  {
    // Can update to use Beads: SamplePlayer
    
    if (filename == null) {
      throw new IllegalArgumentException("InputClassPitch.constructor(String): String parameter " + filename + " is null.");
    }

    this.findFund     = 120;

    try {
      this.player  = minimForAll.loadFile(filename);
    } 
    catch (NullPointerException npe) {
      throw new IllegalArgumentException("Input.constructor(String): there was an error loading the file \"" + filename + "\" with the Minim " + minimForAll + 
        " (this minim initialized in settings()).");
    }
    this.fft          = new FFT(player.bufferSize(), player.sampleRate());
    this.player.loop(); 

    this.sensitivity  = 0.01;
    this.source = this.player;
    this.setFund();
  } // constructor(String)

  /**
   * The following comments from InputClassFreq; this no longer uses averages:
   *
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
  void setFund()
  { 
    println("in setFund()");
    if(millis() > waitUntil)
    {
      waitUntil = millis() + 100;
//      this.inputsUGen.update();
      println("called update - in Input class");
    } // if
    
    println("buffers = " + buffers);
    
    for(int i = 0; i < this.buffers.length; i++)
    {
      for(int j = 0; j < this.buffers[i].length; j++)
      {
        println("this.inputsUGen.getValue(" + i + ", " + j + ")  = " + this.inputsUGen.getValue(i, j));
      } // for - j
    } // for
 
 //   this.inputsUGen.printOutBuffers();
//    println("this.inputsUGen = " + this.inputsUGen);
//    this.inputsUGen.calculateBuffer();
    
//    println("this.buffers = " + this.buffers);
    for (float[] curBuffer : this.buffers)
    {
      this.fft.forward(curBuffer);

      for (int i = 4; i < fft.specSize(); i++)
      {
        if (this.fft.getBand(i) > this.fft.getFreq(findFund))
        {     
          if (this.fft.indexToFreq(i) - findFund < (findFund / 2))
          {
            this.findFund = this.fft.indexToFreq(i);
          } // if
        } // if
      } // for

      // set the prevFund to be equal to the current fundamental,
      // unless the current fundamental has not been set,
      // in which case, set it to be the newly-found fundamental.
      if (this.fundamental == null) {  
        this.prevFund = Frequency.ofHertz(findFund);
      } else {  
        this.prevFund = this.fundamental;
      }

      // take the same precautions with setting adjustPrevFreq as when setting prevFreq
      if (this.adjustedFund == null) {  
        this.adjustedPrevFund = Frequency.ofHertz(findFund);
      } else {  
        this.adjustedPrevFund = this.adjustedFund;
      }

      this.fundamental = Frequency.ofHertz(findFund);
      // if adjustedFreq has not yet been initialized, set it to the
      // loudest frequency regardless of its amlitude and sensitivity.
      if (this.adjustedFund == null)
      {
        this.adjustedFund  = Frequency.ofHertz(findFund);
      }
      // in all other cases, only reset adjustedFreq to frequencies higher than the sensitivity:
      if (this.fft.getFreq(findFund) > this.sensitivity)    
      {  
        this.adjustedFund = Frequency.ofHertz(findFund);
      }

      this.amplitude  = this.fft.getFreq(findFund);
    } // for - buffers
  } // setFund

  /**
   * Calls setFund(), then returns the freq Frequency instance var.
   */
  Frequency getFund()
  {
    this.setFund();
    return this.fundamental;
  } // getFund()

  /**
   * Calls setFund(), then returns the fundamental Frequency instance var in hertz.
   */
  float getFundAsHz()  
  {
    this.setFund();
    return this.fundamental.asHz();
  }

  /**
   * Calls setFund(), then returns the midi note value of the fundamental Frequency instance var.
   */
  float getFundAsMidiNote()  
  {
    this.setFund();
    return this.fundamental.asMidiNote();
  }

  /**
   * Calls setFund(), then returns the adjustedFund Frequency instance var.
   */
  Frequency getAdjustedFund()
  {
    this.setFund();
    return this.adjustedFund;
  } // getFund()

  /**
   * Calls setFund(), then returns the adjustedFund Frequency instance var in hertz.
   */
  float getAdjustedFundAsHz()  
  {
    this.setFund();
    return this.adjustedFund.asHz();
  }

  /**
   * Calls setFund(), then returns the midi note value of the adjustedFund Frequency instance var.
   */
  float getAdjustedFundAsMidiNote()  
  {
    this.setFund();
    return this.adjustedFund.asMidiNote();
  }

  /**
   * Calls setFund() before returning the amplitude ("level()") of the AudioInput instance var.
   * If you want only the amplitude of the particular frequency in quesion,
   * access the float instance var "amplitude" directly.
   *
   * @return  amplitude of the AudioInput instance var.
   */
  float getAmplitude() {
    this.setFund();
    return this.source.mix.level();
  }

  void setSensitivity(float newSensitivity)
  {
    this.sensitivity = newSensitivity;
  }
} // class