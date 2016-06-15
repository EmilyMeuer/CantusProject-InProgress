import ddf.minim.Minim; //<>//
import ddf.minim.MultiChannelBuffer;

import java.io.ByteArrayOutputStream;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.Line;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.Mixer;
import javax.sound.sampled.TargetDataLine;

import org.tritonus.share.sampled.FloatSampleBuffer;

/*
  06/13/2016
 Emily Meuer
 
 First test of mics and Processing.
 
 (USB emulate serial port?)
 
 ** Use a MultiChannelBuffer (Minim), getting a Line from the Java Mixer?
 
 "A SourceDataLine receives audio data for playback."
 
 Can get a Line directly from AudioSystem w/out going through the Mixer; would this be a good idea?
 - no, this seems to be trickier.
 
 (Could eventually get the lines automatically by comparing the strings in their Mixer.Info objects- 
 but more typical is to let the user choose.)
 
 Ultimately, all I need for an FFT is a buffer (which is either a float[] or an AudioBuffer - an interface).
 So can I put these into a Multi-Channel Buffer and send them straight to the FFT from there?
 (AudioSource mentions AudioBuffer and StereoBuffer).
 AudioSource source: https://github.com/ddf/Minim/blob/46408dc3530572274a4e1c6d10fb756b89fdbc76/src/ddf/minim/AudioSource.java
 
 (FFT note: if not using averages, might want to call noAverages() - can still use calcAvg(), but won't create
 an average array for every forward.)
 */

Input      testInput;
Input      testInput2;
MultipleInputs  multipleInputs;

FFT           fft;
Minim         minim;
Mixer.Info[]  mixerInfo;
Mixer         mixer1;
Mixer         mixer2;

AudioInput  input1;
AudioInput  input2;

AudioOutput output;

int               numBytesRead;
TargetDataLine    line1;
TargetDataLine    line2;
byte[]            data;
AudioFormat       audioFormat1;
AudioFormat       audioFormat2;

FloatSampleBuffer  floatSampBuf1;
FloatSampleBuffer  floatSampBuf2;

void setup()
{
  testInput  = new Input();
  testInput2 = new Input();

//  minim = new Minim(this);
  this.mixerInfo  = AudioSystem.getMixerInfo();

  for (int i = 0; i < mixerInfo.length; i++)
  {
    println(i + " = " + mixerInfo[i].getName());
  }
  
  testInput.getLineFromMixer(6);
  testInput2.getLineFromMixer(7);
/*
  mixer1  = AudioSystem.getMixer(mixerInfo[4]);
  Line.Info[] tli1 = mixer1.getTargetLineInfo();
  println("sourceLineInfo.length: " + tli1.length);

  mixer2  = AudioSystem.getMixer(mixerInfo[5]);
  Line.Info[] tli2 = mixer2.getTargetLineInfo();
  println("sourceLineInfo.length: " + tli2.length);

  floatSampBuf1 = new FloatSampleBuffer();
  floatSampBuf2 = new FloatSampleBuffer();

  // try avoids problem of line1 not being initialized.
  try {
    if (tli1.length < 1) {
      throw new IllegalArgumentException("HardwareTrial1.setup(): tli1 " + tli1 + " has length of " + tli1.length);
    } else {
      line1 = (TargetDataLine)mixer1.getLine(tli1[0]);
      line2 = (TargetDataLine)mixer1.getLine(tli2[0]);
    } // else
    // Assume that the TargetDataLine, line, has already
    // been obtained and opened.
    numBytesRead = 0;
    data = new byte[line1.getBufferSize() / 5];

    //  making this fft is the correct idea, but should use the float[]:
    //   this.fft = new FFT(data.length, 44100);

    audioFormat1 = line1.getFormat();

    audioFormat2 = line2.getFormat();

    int channelCount = floatSampBuf1.getChannelCount();
    println("channelCount: " + channelCount);
    // might want to mixDownChannels() to get it all to 1?
  } // try
  catch(LineUnavailableException lnae) {
    throw new IllegalArgumentException("HardwareTrial1.setup(): mixer1 - line not available.");
  } // catch     

  //1024 = typical sample rate?  8192 used somewhere else, I think.
  
  */
} // setup()

void draw()
{
  testInput.fillBuffer();
  println("amplitude: " + testInput2.getAmplitude());
  background(testInput.getAmplitude() * 1000, 0, testInput2.getAmplitude() * 1000);
  /*
  background(200);
  stroke(225, 75, 255);
  fill(225, 75, 255);

  float[] buffer1;
  float[] buffer2;

  try {
    line1.open(audioFormat1);
//    println("line1: " + line1);
    line1.start();
    numBytesRead =  line1.read(data, 0, data.length);
    floatSampBuf1.initFromByteArray(data, 0, numBytesRead, audioFormat1);
    buffer1 = floatSampBuf1.getChannel(0);
    
    line1.stop();
    line1.close();

    for (int j = 0; j < buffer1.length - 1; j++)
    {
      line(j, 100+buffer1[j]*40, j+1, 100+buffer1[j+1]*40);
//      line(j, 300+buffer2[j]*40, j+1, 300+buffer2[j+1]*40);
//      println("[" + j + "] buffer1: " + buffer1[j] + "; buffer2: " + buffer2[j]);
    } // for


    line2.open(audioFormat2);
//    println("line2: " + line2);
    line2.start();
    numBytesRead =  line2.read(data, 0, data.length);
    floatSampBuf2.initFromByteArray(data, 0, numBytesRead, audioFormat2);
    buffer2 = floatSampBuf2.getChannel(0);
    line2.stop();
    line2.close();
    
    for (int j = 0; j < buffer2.length - 1; j++)
    {
//      line(j, 100+buffer1[j]*40, j+1, 100+buffer1[j+1]*40);
      line(j, 300+buffer2[j]*40, j+1, 300+buffer2[j+1]*40);
//      println("[" + j + "] buffer1: " + buffer1[j] + "; buffer2: " + buffer2[j]);
    } // for
  }  // try
  catch(LineUnavailableException lue) {
  }
  */
}