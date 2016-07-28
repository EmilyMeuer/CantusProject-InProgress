import ddf.minim.*;
//import ddf.minim.analysis.*;
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
import beads.FFT;
import beads.PowerSpectrum;
import beads.Frequency;
import beads.Pitch;

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
   
   TODO:  Make a folder in lib for this - can it then be imported?
   */

  // May delete some of these:
  //  Frequency  adjustedFund;      // disregards values below a certain amplitude level
  Frequency  adjustedPrevFund;
  float      amplitude;
  FFT        fft;
  float      findFund;
  //  Frequency  fundamental;
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
  //  Frequency     frequency;
  float         pitch;
  float         fundamental;
  float         adjustedFund;

  FrequencyEMM  frequency;

  Input(int numInputs)
  {
    this.ac = new AudioContext(new AudioServerIO.Jack(), 512, AudioContext.defaultAudioFormat(numInputs, numInputs));

    // creates an int[] of the input channel numbers - e.g., { 1, 2, 3, 4 } for a 4 channel input.
    int[]  inputNums  = new int[numInputs];
    for (int i = 0; i < numInputs; i++)
    {
      inputNums[i]  = i + 1;
    } // for

    this.inputsUGen = ac.getAudioInput(inputNums);
    println("inputsUGen = " + inputsUGen);

    // Sonifying Processing and George P. do this:
    Gain g = new Gain(this.ac, 1, 0.5);
    g.addInput(inputsUGen);
    ac.out.addInput(g);

    sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(ac.out);

    this.fft = new FFT();
    sfs.addListener(fft);

    // The PowerSpectrum is what will actually perform the FFT:
    ps = new PowerSpectrum();

    fft.addListener(ps);
    
    /*    
     frequency = new Frequency(44100.0f);
     // connect the PowerSpectrum to the Frequency object
     ps.addListener(frequency);
     */
    // Using my version of the Frequency class instead to allow access to amplitude.
    frequency  = new FrequencyEMM(44100);
    ps.addListener(frequency);

    ac.out.addDependent(sfs);
    
    this.sensitivity  = 3;

    this.ac.start();
    
    this.setFund();
  } // constructor(int)

  /**
   * Constructor for creating an Input object from line in.
   */
  Input()
  {
    //    IOAudioFormat jsaf = new IOAudioFormat(44100, 16, 2, 2, true, false);
    //    this.ac    = new AudioContext(new beads.JavaSoundAudioIO(), 512, jsaf);

    //    this.ac  = new AudioContext(new AudioServerIO.Jack());
    this.ac  = new AudioContext();

    this.inputsUGen  = ac.getAudioInput();

    // Sonifying Processing and George P. do this:
    Gain g = new Gain(this.ac, 1, 0.5);
    g.addInput(inputsUGen);
    ac.out.addInput(g);

    sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(ac.out);

    this.fft = new FFT();
    sfs.addListener(fft);

    // The PowerSpectrum is what will actually perform the FFT:
    ps = new PowerSpectrum();

    fft.addListener(ps);
    
    /*    
     frequency = new Frequency(44100.0f);
     // connect the PowerSpectrum to the Frequency object
     ps.addListener(frequency);
     */
    // Using my version of the Frequency class instead to allow access to amplitude.
    frequency  = new FrequencyEMM(44100);
    ps.addListener(frequency);

    ac.out.addDependent(sfs);
    
    this.sensitivity  = 3;

    this.ac.start();
    
    this.setFund();
  } // constructor()

  /**
   *  TODO:  add Beads functionality
   * Constructor for creating an Input object from an audio file.
   *
   * @param  filename  String specifying the audio file.
   */
  Input(String filename)
  {
    this();
    println("InputClassJack_EMM: the constructor Input(String) is undergoing construction.  Your Input object will take audio from the default audio device.");
  } // constructor(String)

  /**
   * 
   */
  void setFund()
  { 
    // Just need to find amplitude and set adjustedFund (call it adjustedPitch?).
    if (this.frequency.getFeatures() != null) {
      this.fundamental = this.frequency.getFeatures();

      if (this.frequency.getAmplitude() > this.sensitivity) {
        this.adjustedFund  = this.fundamental;
      } // if: amp > sensitivity
    } // if: features() != null
  } // setFund

  /**
   *  @return  pitch of the Input, adjusted to ignore frequencies below a certain volume.
   */
  float  getAdjustedFund() {
    return this.adjustedFund;
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input, adjusted to ignore frequencies below a certain volume.
   */
  float  getAdjustedFundAsHz() {
    return this.adjustedFund;
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input as a MIDI note, 
   * adjusted to ignore sounds below a certain volume.
   */
  float  getAdjustedFundAsMidiNote() {
    return Pitch.ftom(this.adjustedFund);
  } // getAdjustedFund()
  
  /**
   *  @return  pitch of the Input.
   */
  float  getFund() {
    return this.fundamental;
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input.
   */
  float  getFundAsHz() {
    return this.fundamental;
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input as a MIDI note.
   */
  float  getFundAsMidiNote() {
    return Pitch.ftom(this.fundamental);
  } // getAdjustedFund()

  /**
   * @return  amplitude of the Frequency instance var.
   */
  double getAmplitude() {
    return this.frequency.getAmplitude();
  }

  /**
   *  Setter for sensitivity float instance var.
   *
   *  @param  newSensitivity  float with the value to which sensitivity is to be set.
   */
  void setSensitivity(float newSensitivity)
  {
    this.sensitivity = newSensitivity;
  }
} // class