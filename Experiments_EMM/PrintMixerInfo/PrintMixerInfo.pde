import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Mixer;

/*
  Emily Meuer
  06/14/2016
  
  Simple way to determine which mixer to use.
*/

void setup()
{
  Mixer.Info[] mixerInfo  = AudioSystem.getMixerInfo();

  for (int i = 0; i < mixerInfo.length; i++)
  {
    println(i + " = " + mixerInfo[i].getName());
  }
} // setup()