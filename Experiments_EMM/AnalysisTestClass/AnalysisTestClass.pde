
import java.io.FileOutputStream;

/*
import net.beadsproject.beads.analysis.featureextractors.BasicDataWriter;
 import net.beadsproject.beads.analysis.featureextractors.FFT;
 import net.beadsproject.beads.analysis.featureextractors.Frequency;
 import net.beadsproject.beads.analysis.featureextractors.PeakDetector;
 import net.beadsproject.beads.analysis.featureextractors.PowerSpectrum;
 import net.beadsproject.beads.analysis.featureextractors.SpectralDifference;
 import net.beadsproject.beads.analysis.segmenters.ShortFrameSegmenter;
 import net.beadsproject.beads.core.AudioContext;
 import net.beadsproject.beads.core.TimeStamp;
 import net.beadsproject.beads.data.Pitch;
 import net.beadsproject.beads.data.SampleManager;
 import net.beadsproject.beads.data.buffers.OneWindow;
 import net.beadsproject.beads.ugens.SamplePlayer;
 */

import beads.BasicDataWriter;
import beads.FFT;
import beads.Frequency;
import beads.PeakDetector;
import beads.PowerSpectrum;
import beads.SpectralDifference;
import beads.ShortFrameSegmenter;
import beads.AudioContext;
import beads.TimeStamp;
import beads.Pitch;
import beads.SampleManager;
import beads.OneWindow;
import beads.SamplePlayer;

/*
  This class from http://www.beadsproject.net/svn/beads/Branches/RefactorAudioIO/src/beads_io/net/beadsproject/beads/core/io/JavaSoundAudioIO.java
 */

//class AnalysisTest {

//  public void main(String[] args) throws Exception {
void setup() {
  size(512,200);
  AudioContext ac = new AudioContext();  
  //various sounds, switch on and off
  //jumping wave
  //    Envelope frequencyEnvelope1 = new Envelope(ac, Pitch.mtof(60));
  //    frequencyEnvelope1.addSegment(200, 200f);
  //    frequencyEnvelope1.addSegment(500, 10f);
  //    frequencyEnvelope1.addSegment(500, 200f);
  //    frequencyEnvelope1.addSegment(1000, 10f);
  //    frequencyEnvelope1.addSegment(1000, 200f);
  //    frequencyEnvelope1.addSegment(1500, 10f);
  //    frequencyEnvelope1.addSegment(1500, 200f);
  //    frequencyEnvelope1.addSegment(2000, 10f);
  //    WavePlayer wp1 = new WavePlayer(ac, frequencyEnvelope1, new SineBuffer().getDefault());
  //    ac.out.addInput(wp1);  
  //    //sliding wave
  //    Envelope frequencyEnvelope2 = new Envelope(ac, 400f);
  //    frequencyEnvelope2.addSegment(20000, 500f);
  //    frequencyEnvelope2.addSegment(5000, 500f);
  //    WavePlayer wp2 = new WavePlayer(ac, frequencyEnvelope2, new SineBuffer().getDefault());
  //    ac.out.addInput(wp2);
  //sample
  // SamplePlayer sp = new SamplePlayer(ac, SampleManager.sample("file:///C:/Users/ben/Projects/eclipse/Beads/audio/1234.aif"));

  String  dataPath = (dataPath("") + "\\Horn-54321.wav");
    println("path =  " + dataPath);
  SamplePlayer sp = new SamplePlayer(ac, SampleManager.sample(dataPath));

  ac.out.addInput(sp);
  //set up the chopper upper
  ShortFrameSegmenter sfs = new ShortFrameSegmenter(ac);
  sfs.addInput(ac.out);
  ac.out.addDependent(sfs);
  int chunkSize = 1024;
  sfs.setChunkSize(chunkSize);
  sfs.setHopSize(chunkSize/2);
  //set up the fft
  FFT fft = new FFT();
  sfs.addListener(fft);
  //set up the power spectrum
  PowerSpectrum ps = new PowerSpectrum();
  fft.addListener(ps);
  //set up the mel spectrum filterbank
  //MelSpectrum ms = new MelSpectrum(ac.getSampleRate(), 40);
  //ps.addListener(ms);
  //set up the mfcc-ifyer
  //MFCC mfcc = new MFCC(13);
  //ms.addListener(mfcc);
  //set up frequency - just prints to System.out.
  Frequency f = new Frequency(ac.getSampleRate()) {
    public void process(TimeStamp s, TimeStamp e, float[] data) {
      super.process(s, e, data);
      System.out.println(Pitch.ftom(features));
    }
  };
  ps.addListener(f);
  //set up spectral difference
  SpectralDifference sd = new SpectralDifference(ac.getSampleRate());
  // sd.setFreqWindow(80.f,1100.f);
  sd.setFreqWindow(2000.f, 10000.f);
  ps.addListener(sd);

  // Peak Detector
  PeakDetector pd = new PeakDetector();
  sd.addListener(pd);    

  //print some data
  String analysisDataOutputDir = dataPath("") + "\\output/analysis";  
  //sfs.addListener(new GnuplotDataWriter(new FileOutputStream(analysisDataOutputDir + "/sfs")));
  //    fft.addListener(new GnuplotDataWriter(new FileOutputStream(analysisDataOutputDir + "/fft")));    
  //ms.addListener(new GnuplotDataWriter(new FileOutputStream(analysisDataOutputDir + "/melspec")));
  //mfcc.addListener(new GnuplotDataWriter(new FileOutputStream(analysisDataOutputDir + "/mfcc")));

  try
  {
    ps.addListener(new BasicDataWriter<float[]>(new FileOutputStream(analysisDataOutputDir + "/ps")));
    sd.addListener(new BasicDataWriter<Float>(new FileOutputStream(analysisDataOutputDir + "/sd")));
    pd.addListener(new BasicDataWriter<Float>(new FileOutputStream(analysisDataOutputDir + "/pd")));

    // also output the waveform for comparison
    ShortFrameSegmenter basicseg = new ShortFrameSegmenter(ac);
    basicseg.setWindow(new OneWindow().getDefault());
    basicseg.setChunkSize(512);
    basicseg.setHopSize(512);
    basicseg.addInput(ac.out);
    ac.out.addDependent(basicseg);
    basicseg.addListener(new BasicDataWriter<float[]>(new FileOutputStream(analysisDataOutputDir + "/wave")));
  }  
  catch(java.io.FileNotFoundException fnfe) {
    throw new IllegalArgumentException("AnalysisTestClass.setup(): FileNotFoundException: " + fnfe.getMessage());
  } // catch
  //time the playback to 2s
  //   ac.runForNSecondsNonRealTime(2);
  
  ac.start();
} // "main" / setup()
//}