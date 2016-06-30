import org.jaudiolibs.beads.AudioServerIO;
import org.jaudiolibs.beads.*;

import beads.AudioContext;
import beads.AudioIO;
import beads.IOAudioFormat;
import beads.UGen;
import beads.Gain;

// This import probably not necessary - I just did it to try it:
//import org.jaudiolibs.jnajack.*;

/*
import net.beadsproject.beads.core.AudioContext;
import net.beadsproject.beads.core.AudioIO;
import net.beadsproject.beads.core.UGen;
import net.beadsproject.beads.ugens.Gain;
import processing.core.PApplet;
*/

/*
  Emily Meuer
  06/21/2016
  
  This is an example from a link from this tutorial: https://groups.google.com/forum/?hl=en&fromgroups=#!topic/beadsproject/dSvxUM1l9S0
  
  Trying to figure it all out...
  
  Good discussion here:
  https://groups.google.com/forum/#!topic/beadsproject/oWEVUNHSztE/discussion
*/

// This is actually Java code?  No, it doesn't recognise all the pixel functions...
import java.util.Arrays;

import org.jaudiolibs.beads.AudioServerIO;

import beads.FFT;
import beads.PowerSpectrum;
import beads.ShortFrameSegmenter;
/*
import net.beadsproject.beads.analysis.featureextractors.FFT;
import net.beadsproject.beads.analysis.featureextractors.PowerSpectrum;
import net.beadsproject.beads.analysis.segmenters.ShortFrameSegmenter;
import net.beadsproject.beads.core.AudioContext;
import net.beadsproject.beads.core.AudioIO;
import net.beadsproject.beads.core.UGen;
import net.beadsproject.beads.ugens.Gain;
import processing.core.PApplet;
*/
// Shouldn't need these:
//import org.jaudiolibs.jnajack.*;
//import org.jaudiolibs.audioservers.jack.*;


public class BeadsJNA extends PApplet {
  
  static final long serialVersionUID = 1;
  
  AudioContext ac;
  ShortFrameSegmenter sfs;
  ShortFrameSegmenter sfs2;
  PowerSpectrum ps;
  PowerSpectrum ps2;
  
  int  waitUntil;
  
  void settings()
  {
    size(500, 200);
  } // settings()
  
  public void setup(){
//    ac = new AudioContext();
      ac = new AudioContext(new AudioServerIO.Jack(),512,AudioContext.defaultAudioFormat(2,2));
//    ac = new AudioContext(new AudioServerIO.Jack());
    
//    UGen microphoneIn = ac.getAudioInput(new int[]{1,2,3,4});
    UGen  mic1  = ac.getAudioInput(new int[] {1} );
    UGen  mic2  = ac.getAudioInput(new int[] {2} );
    
//    UGen microphoneIn = ac.getAudioInput();
    Gain g = new Gain(ac, 1, 0.5f);
//    g.addInput(microphoneIn);
    g.addInput(mic1);
    ac.out.addInput(g);
    
    Gain g2 = new Gain(ac, 1, 0.5f);
    g2.addInput(mic2);
    ac.out.addInput(g2);
    // even need to add them to ac.out for this?
    
    println("no. of inputs:  " + ac.getAudioInput().getOuts()); 
 
    sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(mic1);
    
    sfs2 = new ShortFrameSegmenter(ac);
    sfs2.addInput(mic2);
    
    FFT fft = new FFT();
    FFT fft2 = new FFT();
    
    sfs.addListener(fft);
    sfs2.addListener(fft2);
    
    ps = new PowerSpectrum();
    ps2  = new PowerSpectrum();
    
    fft.addListener(ps);
    fft2.addListener(ps2);
    
    ac.out.addDependent(sfs);
    ac.out.addDependent(sfs2);
 
    ac.start();
  }
  public void draw(){
    /*
    loadPixels();
      Arrays.fill(pixels, color(0));
      
      for(int i = 0; i < width; i++)
      {
        int buffIndex = i * ac.getBufferSize() / width;
        int vOffset = (int)((1 + ac.out.getValue(0, buffIndex)) * height / 2);
        pixels[vOffset * height + i] = color(255);
      }
      updatePixels();
      //*/
    background(255);
    stroke(0);
    
    
    float[] features = ps.getFeatures();
 //   if(features != null)  {  println("features.length = " + features.length);  }
    float[] features2 = ps2.getFeatures();
 //   if(features2 != null)  {  println("features2.length = " + features2.length);  }
    
    stroke(255, 50, 50);
    if(features != null){
      for(int x = 0; x < width; x++){
          int featureIndex = (x * features.length) / width;
          int barHeight = Math.min((int)(features[featureIndex] *
                                            height), height - 1);
 //         println("features[featureIndex] = " + features[featureIndex]);
  //        barHeight = barHeight * 100;
 //       println("barHeight = " + barHeight);
          line(x, height, x, height - barHeight);
      } 
    } // if
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
  /*
  public static void main(String[] args) {
    PApplet.main(BeadsJNA.class.getSimpleName());
  }
*/
} // class