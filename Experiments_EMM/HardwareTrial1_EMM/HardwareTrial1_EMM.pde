import ddf.minim.Minim;
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

/*
  06/13/2016
 Emily Meuer
 
 First test of mics and Processing.
 
 (USB emulate serial port?)
 
 ** Use a MultiChannelBuffer (Minim), getting a Line from the Java Mixer?
 
 On AudioFormat:
 "In the Java Sound API, a data format is represented by an AudioFormat object, which includes the following attributes:
 
 Encoding technique, usually pulse code modulation (PCM)
 Number of channels (1 for mono, 2 for stereo, etc.)
 Sample rate (number of samples per second, per channel)
 Number of bits per sample (per channel)
 Frame rate
 Frame size in bytes
 Byte order (big-endian or little-endian)"
 
 Use a DataLine to get AudioFormat;
 
 "A SourceDataLine receives audio data for playback."
 
 Can get a Line directly from AudioSystem w/out going through the Mixer; would this be a good idea?
  - no, this seems to be trickier.
 
 (Could eventually get the lines automatically by comparing the strings in their Mixer.Info objects- 
 but more typical is to let the user choose.)
 
 Ultimately, all I need for an FFT is a buffer (which is either a float[] or an AudioBuffer - an interface).
 So can I put these into a Multi-Channel Buffer and send them straight to the FFT from there?
 (AudioSource mentions AudioBuffer and StereoBuffer).
AudioSource source: https://github.com/ddf/Minim/blob/46408dc3530572274a4e1c6d10fb756b89fdbc76/src/ddf/minim/AudioSource.java
 */

Input      testInput;
MultipleInputs  multipleInputs;

Minim         minim;
Mixer.Info[]  mixerInfo;
Mixer         mixer1;
Mixer         mixer2;

AudioInput  input1;
AudioInput  input2;

AudioOutput output;

AudioFormat       audioFormat;
AudioInputStream  inputStream;

void setup()
{
  testInput  = new Input();

  minim = new Minim(this);
  mixerInfo  = AudioSystem.getMixerInfo();

  for (int i = 0; i < mixerInfo.length; i++)
  {
    println(i + " = " + mixerInfo[i].getName());
  }

  mixer1  = AudioSystem.getMixer(mixerInfo[4]);
  Line.Info[] tli1 = mixer1.getTargetLineInfo();
  println("sourceLineInfo.length: " + tli1.length);
  
  mixer2  = AudioSystem.getMixer(mixerInfo[6]);

  // try avoids problem of line1 not being initialized.
  try {
    TargetDataLine line1;
    if (tli1.length < 1) {
      throw new IllegalArgumentException("HardwareTrial1.setup(): tli1 " + tli1 + " has length of " + tli1.length);
    } else {
      line1 = (TargetDataLine)mixer1.getLine(tli1[0]);
      //      this.inputStream = new AudioInputStream(line1);
      //    } // for
    } // else

    // Assume that the TargetDataLine, line, has already
    // been obtained and opened.
    ByteArrayOutputStream out  = new ByteArrayOutputStream();
    int numBytesRead;
    byte[] data = new byte[line1.getBufferSize() / 5];

    audioFormat = line1.getFormat();
    // Begin audio capture.
    line1.open(audioFormat);
    line1.start();

    while (millis() < 10000) {
      // Read the next chunk of data from the TargetDataLine.
      numBytesRead =  line1.read(data, 0, data.length);
      // Save this chunk of data.
      out.write(data, 0, numBytesRead);
    } // while
  } 
  catch(LineUnavailableException lnae) {
    throw new IllegalArgumentException("HardwareTrial1.setup(): mixer1 - line not available.");
  } // catch     

  //1024 = typical sample rate?  8192 used somewhere else, I think.
  audioFormat = new AudioFormat(1024, 8, 1, true, true);
  //public AudioFormat(float sampleRate, int sampleSizeInBits, int channels, boolean signed, boolean bigEndian)

} // setup()

void draw()
{
  background(200);
  stroke(225, 75, 250);
  fill(225, 75, 250);

  //  println("this.amplitude: " + this.testInput.getAmplitude());

  // divide value by 5 b/c too large for a color value otherwise:
  background(testInput.getAdjustedFundAsHz() / 3, 0, 0);

  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFundAsMidiNote() * 2, 0, 0);
}