/*
  06/01/2016
 Emily Meuer
 
 Using recursion to create fractal tree.
 (from this video: https://www.youtube.com/watch?v=0jjeOYMjmDU&index=1&list=PLRqwX-V7Uu6bxNsa_3SfCPyF9Md9XvXhR )
 
 First speeds up at 2:50;
 Again at (4:11) 4:19.
 
 Just use makey-makey?  
  - How will that signal come in?
  - what will trigger things before that?
 ----
 Polyphonic Interface: http://code.compartmental.net/minim/javadoc/ddf/minim/Polyphonic.html
 "object that can have multiple AudioSignals attached to it. It is 
 implemented by AudioOutput."
 */

float    angle;
BeatDetect  beat;
PShape circle;
Input  input;
AudioPlayer player;

Minim  minim;

void settings()
{
  size(400, 400);
}

void setup()
{
  minim = new Minim(this);
  beat  = new BeatDetect();
  beat.setSensitivity(500);
  background(0);
  angle  = PI / 4;
  //input  = new Input();
  player  = minim.loadFile("Daft Punk correct key reference.mp3");
 // player.play();
  player.play(150000);
  
  //beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.detectMode(BeatDetect.SOUND_ENERGY);
}

void draw()
{
  stroke(255);
  translate(width/2, height);
  
  beat.detect(player.mix);
  if(beat.isOnset())  {  println("Onset at " + player.position()/60000 + ":" + player.position()%60000);  }
  branch(100);
}

void branch(float len)
{
  line(0, 0, 0, -len); 
  translate(0, -len);
  
  if(len > 4)
  {
    pushMatrix();
    rotate(angle);
    branch(len * 0.67);
    popMatrix();
    
    pushMatrix();
    rotate(-angle);
    branch(len * 0.67);
    popMatrix();
  } // if
} // branch