import beads.AudioContext;
import beads.JavaSoundAudioIO;
import beads.UGen;

/*
  Emily Meuer
  06/22/2016
  
  Learning Beads.
  
*/

AudioContext  headsetAudioCon;
AudioContext  laptopAudioCon;
UGen          headsetMic;
UGen          laptopMic;
float[]       headsetBuffer;
float[]       laptopBuffer;

void setup()
{
  size(512, 400);
  
  JavaSoundAudioIO  headsetAudioIO = new JavaSoundAudioIO();
  JavaSoundAudioIO  laptopAudioIO = new JavaSoundAudioIO();
  
//  jsAudioIO.chooseMixerCommandLine();
  
  headsetAudioIO.selectMixer(5);
  headsetAudioCon  = new AudioContext(headsetAudioIO);
  
  laptopAudioIO.selectMixer(4);
  laptopAudioCon  = new AudioContext(laptopAudioIO);
  
  headsetMic  = headsetAudioCon.getAudioInput();
  laptopMic  = headsetAudioCon.getAudioInput();
  
  
} // setup()

void draw()
{
  background(100,0, 75);
  
  drawBuffer(laptopMic, 100);
  drawBuffer(headsetMic, 300);
  
  /*
  
  laptopMic.start();
  laptopMic.calculateBuffer();
  laptopBuffer   = laptopMic.getOutBuffer(0);

// This doesn't work:
//  laptopBuffer = laptopMic.getContext().getBuf();
  
  for (int j = 0; j < laptopBuffer.length - 1; j++)
  {
    println("laptop; " + j + ": " + laptopBuffer[j]);
    line(j, 200+laptopBuffer[j]*50, j+1, 200+laptopBuffer[j+1]*50);
  }
  laptopMic.kill();
  
  
  headsetMic.start();
  headsetMic.calculateBuffer();
  
  
  // Getting the buffer straight from the UGen
  headsetBuffer  = headsetMic.getOutBuffer(0);
  
  
//  headsetBuffer = headsetMic.getContext().getBuf();
  for (int j = 0; j < headsetBuffer.length - 1; j++)
  {
    println("headset; " + j + ": " + headsetBuffer[j]);
    line(j, 50+headsetBuffer[j]*50, j+1, 50+headsetBuffer[j+1]*50);
  }
  headsetMic.kill();
  */
  
} // draw()

void drawBuffer(UGen uGen, int distanceFromTop)
{
  uGen.start();
  uGen.calculateBuffer();
  uGen.printOutBuffers();
  
  float[] buffer   = uGen.getOutBuffer(0);
  
  for (int j = 0; j < buffer.length - 1; j++)
  {
    line(j, distanceFromTop+buffer[j]*50, j+1, distanceFromTop+buffer[j+1]*50);
  }
  uGen.kill();
} // drawBuffer()