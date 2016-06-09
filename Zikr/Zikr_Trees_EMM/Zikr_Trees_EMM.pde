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
 Color maps / color map mode
 ----
 Polyphonic Interface: http://code.compartmental.net/minim/javadoc/ddf/minim/Polyphonic.html
 "object that can have multiple AudioSignals attached to it. It is 
 implemented by AudioOutput."
 */

float              angle;
BeatDetect         beat;
PShape             circle;
Input              input;
AudioPlayer        player;
ArrayList<Branch>  tree1;
ArrayList<Branch>  tree2;
ArrayList<Branch>  tree3;
ArrayList<ArrayList<Branch>> allTrees;
PVector  vector1;
PVector  vector2;
Minim  minim;

void settings()
{
  size(800, 800);
}

void setup()
{
  minim = new Minim(this);
  beat  = new BeatDetect();
  beat.setSensitivity(500);
  background(0);
  //input  = new Input();
  player  = minim.loadFile("Zikr.mp3");
  // player.play();
  //player.play(150000);

  //beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.detectMode(BeatDetect.SOUND_ENERGY);

  vector1  = new PVector(width/2, height/2);
  vector2  = new PVector(width/2, height/2-150);
  Branch root1  = new Branch(vector1, vector2);

  PVector  dir  = PVector.sub(root1.begin, root1.end);
  dir.rotate(radians(60));
  PVector  end2  = PVector.add(root1.begin, dir);
  Branch root2  = new Branch(root1.begin, end2);

  PVector dir2  = PVector.sub(root2.begin, root2.end);
  dir2.rotate(radians(60));
  PVector  end3  = PVector.add(root2.begin, dir2);
  Branch root3  = new Branch(root2.begin, end3);

  tree1  = new ArrayList<Branch>();
  tree1.add(root1);

  tree2 = new ArrayList<Branch>();
  tree2.add(root2);

  tree3 = new ArrayList<Branch>();
  tree3.add(root3);

  allTrees = new ArrayList<ArrayList<Branch>>();
  allTrees.add(tree1);
  allTrees.add(tree2);
  allTrees.add(tree3);
}

void draw()
{
  stroke(color(255, 0, 255));
  //translate(width/2, height);

  //  beat.detect(player.mix);
  //  if (beat.isOnset()) {  
  //    println("Onset at " + player.position()/60000 + ":" + player.position()%60000);
  //  }

  //branch(100);

  color[] colors = { color(255, 0, 0), color(255, 150, 0), color(255, 255, 0), color(0, 255, 0), 
    color(0, 0, 255), color(150, 0, 255), color(250, 0, 250) };
  for (int i = 0; i < colors.length; i++)
  {
    stroke(colors[i]);
    fill(colors[i]);
    ellipse(i * 100 + 100, height - 50, 100, 100);
    //    stroke(0);
    //    text((char[])i, i * 100 + 100, height - 50, 100, 100);
  }

  for (int j = 0; j < allTrees.size(); j++)
  {
    ArrayList<Branch> curTree = allTrees.get(j);
    // this level is important...
    for (int i = 0; i < 7; i++)
    {
      curTree.add(curTree.get(i).branchA());
      curTree.add(curTree.get(i).branchB());
      //        curTree.get(i).finished = true;
    } // for - i
  } // for - j


  float strokeWeight = 100;
  for (int j = 0; j < allTrees.size(); j++)
  {
    ArrayList<Branch> curTree = allTrees.get(j);
    for (int i = 0; i < curTree.size(); i++)
    {
      if (!curTree.get(i).finished)
      {
        stroke(colors[i % colors.length]);
        strokeWeight(strokeWeight);
        
        curTree.get(i).show();
        curTree.get(i).show();
        
        curTree.get(i).finished = true;
        if(strokeWeight > 5)  {  strokeWeight = strokeWeight - 5;  }
      } // if
    } // for - i
  } // for - j
}

void mousePressed()
{
  for (int j = 0; j < allTrees.size(); j++)
  {
    ArrayList<Branch> curTree = allTrees.get(j);
    for (int i = curTree.size()-1; i >= 0; i--)
    {
      if (!curTree.get(i).finished)
      {
        curTree.add(curTree.get(i).branchA());
        //        curTree.get(i).show();
        curTree.add(curTree.get(i).branchB());
        //        curTree.get(i).show();
        curTree.get(i).finished = true;
      } // if
    } // for - i
  } // for - j
} // mousePressed

void branch(float len)
{
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 4)
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