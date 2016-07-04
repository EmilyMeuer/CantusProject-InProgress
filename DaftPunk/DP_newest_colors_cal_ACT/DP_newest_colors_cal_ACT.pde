/**
  * Amanda Tenhoff
  * 7/1/2016
  * adjusting colors and creating universal calibration constants
  * fixed: color names and associated variable names
  * added: easy-to-find calibration constants
  *
  * Emily Meuer
  * 6/25/2016
  * Adds balls from DP_PitchAcrossScreenBall_SpeedChanges_EMM to DP_FreqInputs_ACT.
  *
  * Comments from DP_FreqInputs_ACT:
  * 6/12/2016
  * Amanda Tenhoff
  * This particular file makes an equalizer which
  * - changes hue depending on frequency
  * - changes height depending on amplitude
  * - responds to multiple inputs
  * - adjusts for any screen size
 */
  
//AudioInput in;
MultipleInputs ins;

// variables for balls:
Input  in;
LeadBall myLeadBall;

Ball[] myBall;
//how many balls across the screen
int balls = 30;

//calibration constants:
float amplify = 1000;
float speed = 1;

int b1VolAdjust = 100;
int b2VolAdjust = 100;
int t1VolAdjust = 100;
int t2VolAdjust = 100;

int b1PitAdjust = 10;
int b2PitAdjust = 10;
int t1PitAdjust = 10;
int t2PitAdjust = 10;

int colorDecay = 5; //adjusting constant for color decay of bars

void setup()
{
  //size can be found in the InputClassPitch_EMM
  this.ins = new MultipleInputs(new String[] {"DP parts - Bass 1.mp3", 
                                              "DP parts - Bass 2.mp3", 
                                              "DP parts - Tenor 1.mp3", 
                                              "DP parts - Tenor 2.mp3"});
  // last Input in ins is audio in:
  this.ins.add(new Input());
  
  // setup for background balls:
  in = this.ins.get(4);
  myLeadBall = new LeadBall();
  myBall = new Ball[balls];
  for(int i = 0; i < balls; i++) {
    myBall[i] = new Ball(i);
  }//for
}

void draw()
{
  background(0);
  
  // drawing the balls in the background:
  myLeadBall.move();
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move();
  }//for
  
  int refy = round(3*height/4);
  //println("refy is "+refy);
  int refx = round(width/11);
  int space = round(height/100);  //for universally determing the space between stacks
  int w = refx-space;  //for universally determining the width of the bars
  //println("w is "+w);
  int h = round(height/30);  //for universally determining the height of the stacks
  //println("h is "+h);
  //int off = space/2;
  int crefx = width/2;
  int halfwmin = crefx - w/2;
  int halfwplus = crefx + w/2;
  
  /* rp = red and pink
   * of = orange and fuchsia
   * yp = yellow and purple
   * ggp = light green, forest green, and periwinkle
   */
  
  Input bass1 = ins.get(0);
  float rpvol = b1VolAdjust*bass1.getAmplitude();  //'volume' of bass1, used for columns RED and PINK
  float rppit = bass1.getAdjustedFundAsHz();  //'pitch' of bass1, used for columns RED and PINK
  
  Input bass2 = ins.get(1);
  float ofvol = b2VolAdjust*bass2.getAmplitude();
  float ofpit = bass2.getAdjustedFundAsHz();
  
  Input tenor1 = ins.get(2);
  float ypvol = t1VolAdjust*tenor1.getAmplitude();
  float yppit = tenor1.getAdjustedFundAsHz();
  
  Input tenor2 = ins.get(3);
  float ggpvol = t2VolAdjust*tenor2.getAmplitude();
  float ggppit = tenor2.getAdjustedFundAsHz();
  
  /*the following code creates rectangles which represent
   *the 9 different voices/inputs.
   *The rectangle needs the y-parameter to have the volume
   *subtracted by a given height since the y-axis starts
   *from the upper left-hand corner and is positive down.
   *Additionally, rectMode(CORNERS) lets me set the parameters
   *for each corner of the rectangle.
   */
  
  //RED
  stroke(255);
  rectMode(CORNERS);
  int pitchb1 = round(rppit/b1PitAdjust);
  int volb1 = round(rpvol);
  int j=0;                  //stack is from bottom to top
  int oldb1=pitchb1/(volb1+1); //have to add 1 because sometimes volume is zero
  for(j=0; j<volb1; j++)
  {
    fill(224-colorDecay*oldb1, 36-colorDecay*oldb1, 71-colorDecay*oldb1); //224 36 71 (255 0 0)
    //rect(width-9*refx-w,refy-(space+h)*j, width-8*refx-w-off, (refy-h)-(space+h)*j); //makes boxes!
    rect(halfwmin-4*space-4*w,refy-(space+h)*j, halfwmin-4*space-3*w, (refy-h)-(space+h)*j);
    oldb1 = oldb1+pitchb1/(volb1+1);
  }
  oldb1 = pitchb1/(volb1+1);
  
 /* The magic formula here for the boxes is
  * rect([1], [2], [3], [4]) where:
  * [1] = starting x pixel, lower left corner
  * [2] = starting y pixel, lower left corner
  * [3] = ending x pixel, upper right corner
  * [4] = ending y pixel, upper right corner
  * Additonal information regarding these parameters:
  * [3] - [1] = width of the boxes/bars
  * [2] should be the starting bottom line (constant) subtracted by
  * the product of the difference in consecutive [2] values
  * and the count j. This is a lot of words. Addressing 'RED' above,
  * the boxes are meant to be 20 pixels tall and 10 pixels apart,
  * which means the first box [2] value is 0 and the second box [2]
  * value is 30. Thus, the [2] parameter is 800-30*j.
  * [4] is kind of the same deal but is at the top of your first
  * box, so in this case (knowing I want a height of 20 pixels)
  * would have 800-20-30*j, which simplifies to 780-30*j.
  * Knowing this, we can now make consecutive boxes and shapes of
  * all sizes! :)
  */
  
  //ORANGE
  stroke(255);
  rectMode(CORNERS);
  int pitchb2 = round(ofpit/b2PitAdjust);
  int volb2 = round(ofvol);
  int oldb2 = pitchb2/(volb2+1);
  for(j=0; j<volb2; j++)
  {
    fill(255-colorDecay*oldb2, 90-colorDecay*oldb2, 8); //255 90 8 (255 145 0)
    //rect(width-8*refx-w,refy-(space+h)*j,width-7*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin-3*space-3*w,refy-(space+h)*j,halfwmin-3*space-2*w,(refy-h)-(space+h)*j);
    oldb2 = oldb2 + pitchb2/(volb2+1);
  }
  oldb2=pitchb2/(volb2+1);
  
  //YELLOW
  stroke(255);
  rectMode(CORNERS);
  int pitcht1 = round(yppit/t1PitAdjust);
  int volt1 = round(ypvol);
  int oldt1 = pitcht1/(volt1+1);
  for(j=0; j<volt1; j++)
  {
    fill(255-colorDecay*oldt1, 234-colorDecay*oldt1, 44-colorDecay*oldt1); //255 234 44 good how it is probably
    //rect(width-7*refx-w,refy-(space+h)*j,width-6*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin-2*space-2*w,refy-(space+h)*j,halfwmin-2*space-w,(refy-h)-(space+h)*j);
    oldt1 = oldt1+pitcht1/(volt1+1);
  }
  oldt1=pitcht1/(volt1+1);
  
  //LIGHT GREEN
  stroke(255);
  rectMode(CORNERS);
  int pitcht2 = round(ggppit/t2PitAdjust);
  int volt2 = round(ggpvol);
  int oldt2 = pitcht2/(volt2+1);
  for(j=0; j<volt2; j++)
  {
    fill(162-colorDecay*oldt2, 211-colorDecay*oldt2, 2); //162 211 2 (41 255 0)
    //rect(width-6*refx-w,refy-(space+h)*j,width-5*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin - space - w,refy-(space+h)*j,halfwmin - space,(refy-h)-(space+h)*j);
    oldt2=oldt2+pitcht2/(volt2+1);
  }
  oldt2=pitcht2/(volt2+1);
  
  //FOREST GREEN
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volt2; j++)
  {
    fill(1, 100-colorDecay*oldt2, 65-colorDecay*oldt2); //1 100 65 (0 255 232 was CYAN)
    //rect(width-5*refx-w,refy-(space+h)*j, width-4*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin,refy-(space+h)*j, halfwplus,(refy-h)-(space+h)*j);
    oldt2=oldt2+pitcht2/(volt2+1);
  }
  oldt2=pitcht2/(volt2+1);
  
  //PERIWINKlE
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volt2; j++)
  {
    fill(149-colorDecay*oldt2, 176-colorDecay*oldt2, 250-colorDecay*oldt2); //149 176 250 (0 129 255)
    //rect(width-4*refx-w,refy-(space+h)*j,width-3*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+space,refy-(space+h)*j,halfwplus+space+w,(refy-h)-(space+h)*j);
    oldt2=oldt2+pitcht2/(volt2+1);
  }
  oldt2=pitcht2/(volt2+1);
  
  //VIOLET
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volt1; j++)
  {
    fill(122-colorDecay*oldt1, 73-colorDecay*oldt1, 155-colorDecay*oldt1); //122 73 155 (45 0 255 was indigo)
    //rect(width-3*refx-w,refy-(space+h)*j,width-2*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+2*space+w,refy-(space+h)*j,halfwplus+2*space+2*w,(refy-h)-(space+h)*j);
    oldt1=oldt1+pitcht1/(volt1+1);
  }
  oldt1=pitcht1/(volt1+1);
  
  //FUCHSIA
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volb2; j++)
  {
    fill(247-colorDecay*oldb2, 3, 222-colorDecay*oldb2); //247 3 222 (139 0 255 was purple)
    //rect(width-2*refx-w,refy-(space+h)*j,width-refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+3*space+2*w,refy-(space+h)*j,halfwplus+3*space+3*w,(refy-h)-(space+h)*j);
    oldb2=oldb2+pitchb2/(volb2+1);
  }
  oldb2=pitchb2/(volb2+1);
  
  //PINK
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volb1; j++)
  {
    fill(255-colorDecay*oldb1, 175-colorDecay*oldb1, 210-colorDecay*oldb1); //255 130 180 (255 0 222 was fuchsia)
    //rect(width-refx-w,refy-(space+h)*j,width-refx,(refy-h)-(space+h)*j);
    rect(halfwplus+4*space+3*w,refy-(space+h)*j,halfwplus+4*space+4*w,(refy-h)-(space+h)*j);
    oldb1=oldb1+pitchb1/(volb1+1);
  }
  oldb1=pitchb1/(volb1+1);
  
} // draw()

// The following classes copied from DP_PitchAcrossScreenBall_SpeechChanges_EMM:
class LeadBall {
  float xLead;
  float yLead;
  LeadBall() {
    xLead = width;
    yLead = height*0.9;
  }
  void move (){
    xLead = xLead - speed*in.getAmplitude()*amplify;
//    xLead = xLead - in.getAdjustedFundAsHz()/10;
//    println("xLead = " + xLead + "; yLead = " + yLead);
  if (xLead < 0){
//      yLead = height*0.9-in.getAdjustedFundAsHz();
      yLead = (height * 0.9) - in.getAdjustedFundAsHz();
      println("  set yLead to " + yLead);
      xLead = width;
    }//if x<0
  fill(200,100,200);
  ellipse(xLead,yLead,10,10);
  }  
 float getXpos() {
  return xLead;
  }
}

//makes a ball y=amp that will move across the screen
//once across screen, ball goes back to "start" and receives a new y=amp
class Ball{
  float x;
  float y;
  float speed;
  int ballNumber;
  int c;
  Ball(int inBallNumber){
    ballNumber = inBallNumber;
    y = height*0.9;
    c = ballNumber*10;
    constrain(c,0,255);
  }
  void move(){
    fill(c,100,100); 
    ellipse(x,y,10,10);
    if (ballNumber != 0){
      x = (myLeadBall.getXpos() + ballNumber*width/balls) % width;
        if ((x < 1) && (x > -1)) {
//        y = height*0.9-in.getAdjustedFundAsHz();
          y = in.getAdjustedFundAsHz();
        println("  y = " + y);
        }
    }
  }//move
}//Ball