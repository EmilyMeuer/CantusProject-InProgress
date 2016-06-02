import java.util.ArrayList;

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
  
 Zoom using map()?
 Color maps/ color map mode
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
ArrayList<Branch>  tree;
PVector  vector1;
PVector  vector2;

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
  angle  = PI / 2;
  //input  = new Input();
  player  = minim.loadFile("Zikr.mp3");
 // player.play();
  //player.play(150000);
  
  //beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.detectMode(BeatDetect.SOUND_ENERGY);
  
  vector1  = new PVector(width/2, height);
  vector2  = new PVector(width/2, height-100);
  Branch root  = new Branch(vector1, vector2);
  Branch rightBranch  = root.branchA();
  Branch leftBranch  = root.branchB();
  
  tree  = new ArrayList<Branch>();
  tree.add(root);
}

void draw()
{
  stroke(255);
  //translate(width/2, height);
  
  beat.detect(player.mix);
  if(beat.isOnset())  {  println("Onset at " + player.position()/60000 + ":" + player.position()%60000);  }
  //branch(100);
  
  for(int i = 0; i < tree.size(); i++)
  {
    tree.get(i).show();
  } // for
}

void mousePressed()
{
  for(int i = tree.size()-1; i >= 0; i--)
  {
    if(!tree.get(i).finished)
    {
      tree.add(tree.get(i).branchA());
      tree.add(tree.get(i).branchB());
    }
  } // for
} // mousePressed

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