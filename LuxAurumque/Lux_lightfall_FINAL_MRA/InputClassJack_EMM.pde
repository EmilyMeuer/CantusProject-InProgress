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
  size(600, 600);
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
   
   Notate bene:  getters are accessed with the mic number of each line;
   e.g., mic 1's pitch is input.getAdjustedFund(1), not input.getAdjustedFund(0).
   
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

  ShortFrameSegmenter[]  sfsArray;
  FFT[]                  fftArray;
  PowerSpectrum[]        psArray;
  FrequencyEMM[]         frequencyArray;
  float[]                fundamentalArray;
  float[]                adjustedFundArray;
  int                    numInputs;

  Input(int numInputs)
  {
    this.numInputs  = numInputs;
    this.ac = new AudioContext(new AudioServerIO.Jack(), 512, AudioContext.defaultAudioFormat(numInputs, numInputs));

    println("numInputs = " + numInputs);

    // creates an int[] of the input channel numbers - e.g., { 1, 2, 3, 4 } for a 4 channel input.
    int[]  inputNums  = new int[numInputs];
    for (int i = 0; i < numInputs; i++)
    {
      inputNums[i]  = i + 1;
    } // for

    //    this.inputsUGen = ac.getAudioInput(inputNums);
    this.inputsUGen  = ac.getAudioInput(new int[] {1, 2});

    UGen[]  uGenArray  = new UGen[numInputs];
    for(int i = 0; i < uGenArray.length; i++)
    {
      uGenArray[i]  = ac.getAudioInput(new int[] {(i + 1)});
    }
//    uGenArray[1]  = ac.getAudioInput(new int[] {2});

    // Sonifying Processing and George P. do this:
    Gain g = new Gain(this.ac, 1, 0.5);
    for(int i = 0; i < this.numInputs; i++)
    {
      g.addInput(uGenArray[i]);
    } // for
//    g.addInput(uGenArray[0]);
//    g.addInput(uGenArray[1]);
    ac.out.addInput(g); //<>//

    this.sfsArray  = new ShortFrameSegmenter[numInputs];
    for (int i = 0; i < this.sfsArray.length; i++)
    {
      this.sfsArray[i] = new ShortFrameSegmenter(ac);
      while(this.sfsArray[i] == null)  {}
      this.sfsArray[i].addInput(uGenArray[i]); //<>//
    }
    //    this.sfs.addInput(0, mic1, 0);
    //    this.sfs.addInput(1, mic2, 0);

    this.fftArray  = new FFT[numInputs];
    for (int i = 0; i < this.fftArray.length; i++)
    {
      this.fftArray[i] = new FFT();
      while(this.fftArray[i] == null)  {}
      this.sfsArray[i].addListener(this.fftArray[i]); //<>//
      //    sfs.addListener(fft);
    } // for

    // The PowerSpectrum is what will actually perform the FFT:
    this.psArray  = new PowerSpectrum[numInputs];
    for (int i = 0; i < this.psArray.length; i++)
    {
      this.psArray[i] = new PowerSpectrum();
      while(this.psArray[i] == null)  {}
      this.fftArray[i].addListener(psArray[i]); //<>//
    } // for
    //    fft.addListener(ps);

    /*    
     frequency = new Frequency(44100.0f);
     // connect the PowerSpectrum to the Frequency object
     ps.addListener(frequency);
     */
    // Using my version of the Frequency class instead to allow access to amplitude.
    this.frequencyArray  = new FrequencyEMM[numInputs];
    for (int i = 0; i < this.frequencyArray.length; i++)
    {
      this.frequencyArray[i] = new FrequencyEMM(44100);
      while(this.frequencyArray[i] == null)  {}
      this.psArray[i].addListener(frequencyArray[i]); //<>//
    } // for
    //     ps.addListener(frequency);

    for (int i = 0; i < numInputs; i++)
    {
      ac.out.addDependent(sfsArray[i]); //<>//
    } // for - addDependent

    this.sensitivity  = 3;

    this.ac.start();
    
    this.fundamentalArray = new float[this.numInputs];
    this.adjustedFundArray = new float[this.numInputs];

    this.setFund();
  } // constructor(int)

  /**
   * Constructor for creating a one (or two?)-channel Input object 
   * from the machine's default audio input device.
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

    this.sensitivity  = 1;

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
    for (int i = 0; i < this.numInputs; i++)
    {
 //     println("setFund(); this.frequencyArray[i] = " + this.frequencyArray[i].getFeatures());
      
      if (this.frequencyArray[i].getFeatures() != null) {
        println("i = " + i);
        println("setFund(); this.fundamentalArray[i] = " + this.fundamentalArray[i] + "this.frequencyArray[i].getFeatures() = " + this.frequencyArray[i].getFeatures());
        this.fundamentalArray[i] = this.frequencyArray[i].getFeatures();

        if (this.frequencyArray[i].getAmplitude() > this.sensitivity) {
          this.adjustedFundArray[i]  = this.fundamentalArray[i];
        } // if: amp > sensitivity
      } // if: features() != null
    } // if: > numInputs
  } // setFund

  /**
   *  @return  pitch of the Input, adjusted to ignore frequencies below a certain volume.
   */
  float  getAdjustedFund(int inputNum) {
    setFund();
    return this.adjustedFundArray[inputNum - 1];
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input, adjusted to ignore frequencies below a certain volume.
   */
  float  getAdjustedFundAsHz(int inputNum) {
    return this.adjustedFundArray[inputNum - 1];
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input as a MIDI note, 
   * adjusted to ignore sounds below a certain volume.
   */
  float  getAdjustedFundAsMidiNote(int inputNum) {
    return Pitch.ftom(this.adjustedFundArray[inputNum - 1]);
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input.
   */
  float  getFund(int inputNum) {
    return this.fundamentalArray[inputNum - 1];
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input.
   */
  float  getFundAsHz(int inputNum) {
    return this.fundamentalArray[inputNum - 1];
  } // getAdjustedFund()

  /**
   *  @return  pitch of the Input as a MIDI note.
   */
  float  getFundAsMidiNote(int inputNum) {
    return Pitch.ftom(this.fundamentalArray[inputNum - 1]);
  } // getAdjustedFund()

  /**
   * @return  amplitude of the Frequency instance var.
   */
  float getAmplitude(int inputNum) {
    return this.frequencyArray[inputNum - 1].getAmplitude();
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