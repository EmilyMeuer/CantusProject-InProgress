import beads.*;
import org.jaudiolibs.beads.*;

import beads.*;
import org.jaudiolibs.beads.*;
import org.jaudiolibs.jnajack.*;
import org.jaudiolibs.jnajack.JackClient;
import org.jaudiolibs.audioservers.AudioClient;
import org.jaudiolibs.audioservers.AudioConfiguration;
import org.jaudiolibs.audioservers.AudioServer;
import org.jaudiolibs.audioservers.jack.JackAudioServer;

/*
  06/22/2016
  Example copied from https://groups.google.com/forum/?hl=en&fromgroups=#!searchin/beadsproject/multiple$20inputs/beadsproject/7W-BRJnKiQA/Gben0P9XduQJ.

  Jack on OS X: http://www.jackosx.com/
*/

AudioContext ac; 

void setup() {

//  ac = new AudioContext(new AudioServerIO.Jack(), 1024, new IOAudioFormat(48000, 16, 6, 2));
ac = new AudioContext(new AudioServerIO.Jack(),512,AudioContext.defaultAudioFormat(6,6));

println("no of inputs:  " + ac.getAudioInput().getOuts()); 
println("no of outputs: " + ac.out.getIns());
}