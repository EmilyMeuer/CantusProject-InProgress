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
public class BeadsJNA extends PApplet {

    AudioContext ac;
    public void settings()
    {
      size(400,400);
    } // settings()
    public void setup(){
//        ac = new AudioContext(new AudioServerIO.Jack(),512,AudioContext.defaultAudioFormat(4,2));//control number of ins(4) and outs(2)
        ac = new AudioContext(new AudioServerIO.Jack(), 44100, new IOAudioFormat(44100, 16, 4, 4));
        UGen microphoneIn = ac.getAudioInput();
        Gain g = new Gain(ac, 1, 0.5f);
        g.addInput(microphoneIn);
        ac.out.addInput(g);

        println("no. of inputs:  " + ac.getAudioInput().getOuts()); 

        ac.start();
    }
    public void draw(){
        loadPixels();
 //     Arrays.fill(pixels, color(0));

      for(int i = 0; i < width; i++)
      {
        int buffIndex = i * ac.getBufferSize() / width;
        int vOffset = (int)((1 + ac.out.getValue(0, buffIndex)) * height / 2);
        pixels[vOffset * height + i] = color(255);
      }
      updatePixels(); 
    }

    public static void main(String[] args) {
        PApplet.main(BeadsJNA.class.getSimpleName());
    }

}