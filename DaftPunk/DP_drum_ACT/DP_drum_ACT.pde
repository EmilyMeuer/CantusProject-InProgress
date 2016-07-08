/**
  * Amanda Tenhoff
  * 7/7/2016
  * add border for drum input
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
  * This model focuses on working with any screen size.
  * I also am considering having different stacked shapes
  * for each input, such as circles for one, rectangles for another?
  * Another step for the progression of this code is to write
  * all of it in a loop, which will significantly reduce its length.
  * Pushed on 6/15
 */
  
//AudioInput in;
MultipleInputs ins;

// variables for balls:
Input  in;
float amplify = 1000;
float speed = 1;
LeadBall myLeadBall;

Ball[] myBall;
//how many balls across the screen
int balls = 30;

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
  
  int refy = round(3*height/4);
  //println("refy is "+refy);
  int refx = round(width/11);
  int space = round(height/100);  //for universally determing the space between stacks
  int w = refx-space;  //for universally determining the width of the bars
  //println("w is "+w);
  int h = round(height/30);  //for universally determining the height of the stacks
  //println("h is "+h);
  int off = space/2;
  int crefx = width/2;
  int halfwmin = crefx - w/2;
  int halfwplus = crefx + w/2;
  
  /* rf = red and fuchsia
   * op = orange and purple
   * yi = yellow and indigo
   * gp = green and periwinkle
   */
  
  Input bass1 = ins.get(0);
  float rfvol = 100*bass1.getAmplitude();  //'volume' of bass1, used for columns RED and FUCHSIA
  float rfpit = bass1.getAdjustedFundAsHz();  //'pitch' of bass1, used for columns RED and FUCHSIA
  
  Input bass2 = ins.get(1);
  float opvol = 100*bass2.getAmplitude();
  float oppit = bass2.getAdjustedFundAsHz();
  
  Input tenor1 = ins.get(2);
  float yivol = 100*tenor1.getAmplitude();
  float yipit = tenor1.getAdjustedFundAsHz();
  
  Input tenor2 = ins.get(3);
  float gpvol = 100*tenor2.getAmplitude();
  float gppit = tenor2.getAdjustedFundAsHz();
  
  /*the following code creates rectangles which represent
   *the 9 different voices/inputs.
   *The rectangle needs the y-parameter to have the volume
   *subtracted by a given height since the y-axis starts
   *from the upper left-hand corner and is positive down.
   *Additionally, rectMode(CORNERS) lets me set the parameters
   *for each corner of the rectangle.
   */
   
  //DRUM BOX
  //right now this takes input from bass1 for testing
  //but it will take input from the drum
    int volb1 = round(rfvol);
  if(volb1>3)
  {
    stroke(255);    
  }
  else
  {
    stroke(155,155,155);
    //println("volb1 is "+volb1);
  }
  fill(0);
  rectMode(CORNERS);
  for(int pix = 7; pix>0; pix--)
  {
    rect(width/20-pix,height*0.95+pix,width-width/20+pix,height-height*0.95-pix);
  }
  
    // drawing the balls in the background:
  myLeadBall.move();
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move();
  }//for
  
  //RED
  stroke(255);
  rectMode(CORNERS);
  int pitchb1 = round(rfpit/10);
  //int volb1 = round(rfvol);
  int j=0;                  //stack is from bottom to top
  int oldb1=pitchb1/(volb1+1); //have to add 1 because sometimes volume is zero
  for(j=0; j<volb1; j++)
  {
    fill(255-5*oldb1, 0, 0); //255 0 0
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
  int pitchb2 = round(oppit/10);
  int volb2 = round(opvol);
  int oldb2 = pitchb2/(volb2+1);
  for(j=0; j<volb2; j++)
  {
    fill(255-5*oldb2, 145-5*oldb2, 0); //255 145 0
    //rect(width-8*refx-w,refy-(space+h)*j,width-7*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin-3*space-3*w,refy-(space+h)*j,halfwmin-3*space-2*w,(refy-h)-(space+h)*j);
    oldb2 = oldb2 + pitchb2/(volb2+1);
  }
  oldb2=pitchb2/(volb2+1);
  
  //YELLOW
  stroke(255);
  rectMode(CORNERS);
  int pitcht1 = round(yipit/10);
  int volt1 = round(yivol);
  int oldt1 = pitcht1/(volt1+1);
  for(j=0; j<volt1; j++)
  {
    fill(250-5*oldt1, 255-5*oldt1, 0); //250 255 0
    //rect(width-7*refx-w,refy-(space+h)*j,width-6*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin-2*space-2*w,refy-(space+h)*j,halfwmin-2*space-w,(refy-h)-(space+h)*j);
    oldt1 = oldt1+pitcht1/(volt1+1);
  }
  oldt1=pitcht1/(volt1+1);
  
  //ELECTRIC GREEN
  stroke(255);
  rectMode(CORNERS);
  int pitcht2 = round(gppit/10);
  int volt2 = round(gpvol);
  int oldt2 = pitcht2/(volt2+1);
  for(j=0; j<volt2; j++)
  {
    fill(41-5*oldt2, 255-5*oldt2, 0); //41 255 0
    //rect(width-6*refx-w,refy-(space+h)*j,width-5*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwmin - space - w,refy-(space+h)*j,halfwmin - space,(refy-h)-(space+h)*j);
    oldt2=oldt2+pitcht2/(volt2+1);
  }
  oldt2=pitcht2/(volt2+1);
  
  //CYAN
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volt2; j++)
  {
    fill(0, 255-5*oldt2, 232-5*oldt2); //0 255 232
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
    fill(0, 129-5*oldt2, 255-5*oldt2); //0 129 255
    //rect(width-4*refx-w,refy-(space+h)*j,width-3*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+space,refy-(space+h)*j,halfwplus+space+w,(refy-h)-(space+h)*j);
    oldt2=oldt2+pitcht2/(volt2+1);
  }
  oldt2=pitcht2/(volt2+1);
  
  //INDIGO
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volt1; j++)
  {
    fill(45-5*oldt1, 0, 255-5*oldt1); //45 0 255
    //rect(width-3*refx-w,refy-(space+h)*j,width-2*refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+2*space+w,refy-(space+h)*j,halfwplus+2*space+2*w,(refy-h)-(space+h)*j);
    oldt1=oldt1+pitcht1/(volt1+1);
  }
  oldt1=pitcht1/(volt1+1);
  
  //PURPLE
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volb2; j++)
  {
    fill(139-5*oldb2, 0, 255-5*oldb2); //139 0 255
    //rect(width-2*refx-w,refy-(space+h)*j,width-refx-w-off,(refy-h)-(space+h)*j);
    rect(halfwplus+3*space+2*w,refy-(space+h)*j,halfwplus+3*space+3*w,(refy-h)-(space+h)*j);
    oldb2=oldb2+pitchb2/(volb2+1);
  }
  oldb2=pitchb2/(volb2+1);
  
  //FUCHSIA
  stroke(255);
  rectMode(CORNERS);
  for(j=0; j<volb1; j++)
  {
    fill(255-5*oldb1, 0, 222-5*oldb1); //255 0 222
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
    xLead = width/15;
    yLead = height*0.9;
  }
  void move (){
    xLead = xLead - speed*in.getAmplitude()*amplify;
//    xLead = xLead - in.getAdjustedFundAsHz()/10;
//    println("xLead = " + xLead + "; yLead = " + yLead);
  if (xLead < width/15){
//      yLead = height*0.9-in.getAdjustedFundAsHz();
      yLead = (height * 0.9) - in.getAdjustedFundAsHz();
      println("  set yLead to " + yLead);
      xLead = width-width/15;
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
      x = (myLeadBall.getXpos() + ballNumber*(width-width/15)/balls) % (width-width/15);
        if ((x < width/20)) {
          x = width-width/15;
        y = height*0.9-in.getAdjustedFundAsHz();
          //y = in.getAdjustedFundAsHz();
       // println("  y = " + y);
        }
    }
  }//move
}//Ball