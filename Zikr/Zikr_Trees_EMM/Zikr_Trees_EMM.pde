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
InputPitch         input;
//AudioPlayer        player;
ArrayList<Branch>  tree1;
ArrayList<Branch>  tree2;
ArrayList<Branch>  tree3;
ArrayList<ArrayList<Branch>> allTrees;
PVector  vector1;
PVector  vector2;

MultipleInputs    multipleInputs;

void setup()
{
//  minim = new Minim(this);
  beat  = new BeatDetect();
  beat.setSensitivity(500);
  background(0);

  this.multipleInputs = new MultipleInputs(new String[] { "Zikr - parts - Bass.mp3", "Zikr - parts - Baritone.mp3", "Zikr - parts - Tenor 1.mp3", "Zikr - parts - Tenor 2.mp3" });
  //  input  = new InputPitch("Zikr.mp3");
  //  input.player.play();
  //this.input.player.play(35000);

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

  // Build a huge tree in setup(), and show as necessary in the draw?
  for (int j = 0; j < allTrees.size(); j++)
  {
    ArrayList<Branch> curTree = allTrees.get(j);
    // this level is important...
    for (int i = 0; i < 31; i++)
    {
      curTree.add(curTree.get(i).branchA());
      curTree.add(curTree.get(i).branchB());
      //        curTree.get(i).finished = true;
    } // for - i
  } // for - j
}


void draw()
{
  background(0);
  stroke(color(255, 0, 255));
  strokeWeight(3);
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
  }
  
  float bassNote = this.multipleInputs.get(0).getAdjustedFundAsMidiNote();
  float bariNote = this.multipleInputs.get(1).getAdjustedFundAsMidiNote();
  bassNote = round(bassNote);
  bariNote = round(bariNote);
  
  // converts the baritone note into a level between 1 and 31,
  // to be used as the current level of the tree:
  int level = (int)map((float)bassNote, 17, 68, 1, 31);
  level = Math.max(1, level);
  level = Math.min(level, 31);
  
  int red    = (int)(map(bariNote, 38, 68, 204, 51));
  int green  = 51;
  int blue   = (int)(map(bariNote, 38, 68, 0, 255));
  
  println("bassNote = " + bassNote + "; level = " + level);
  println("bariNote = " + bariNote + "; red = " + red + "; green = " + green + "; blue: " + blue);
  
  for (int j = 0; j < allTrees.size(); j++)
  {
    ArrayList<Branch> curTree = allTrees.get(j);
    for (int i = 0; i < Math.min(level, 31); i++)
    {
      stroke(red, green, blue);

      curTree.get(i).show();
      curTree.get(i).show();

      //        if(strokeWeight > 5)  {  strokeWeight = strokeWeight - 5;  }
    } // for - i
  } // for - j

//  println("this.multipleInputs.get(0).getAdjustedFundAsHz(): " + (this.multipleInputs.get(0).getAdjustedFundAsHz()) +
//    "\nthis.multipleInputs.get(1).getAdjustedFundAsHz(): " + (this.multipleInputs.get(1).getAdjustedFundAsHz()) + "\n");
  //   "\nthis.multipleInputs.get(2).getAdjustedFundAsHz(): " + (this.multipleInputs.get(2).getAdjustedFundAsHz()) +
  //   "\nthis.multipleInputs.get(3).getAdjustedFundAsHz(): " + (this.multipleInputs.get(3).getAdjustedFundAsHz()) + "\n");
} // draw()

double round(double num)
{
  double result;
  
  // check = number in tenth's place:
  int check = (int)(num * 10) % 10;
  
  if(check < 5)  {  result = Math.floor(num);  }
  else           {  result = Math.ceil(num);   }
  
  return result;
} // round

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

/*
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
 */