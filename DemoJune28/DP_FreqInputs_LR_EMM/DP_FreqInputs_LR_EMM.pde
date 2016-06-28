/*
  * Updated 06/27/2016
  * Emily Meuer
  *
  * Added left/right channel audio input functionality.
  * Problem: boxes corresponding to left channel show up; boxes for right only occasionally there.
  *
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
  
Input  left;
Input  right;

void setup()
{
  //size can be found in the InputClass_EMM
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
 
  
  left   = new Input(true, false);
  right  = new Input(false, true);
  
  float rfvol = 100*left.getAmplitude();  //'volume' of bass1, used for columns RED and FUCHSIA
  float rfpit = left.getAdjustedFundAsHz();  //'pitch' of bass1, used for columns RED and FUCHSIA
  
  float opvol = 100*right.getAmplitude();
  float oppit = right.getAdjustedFundAsHz();
  
  float yivol = 100*left.getAmplitude();
  float yipit = left.getAdjustedFundAsHz();
  
  float gpvol = 100*right.getAmplitude();
  float gppit = right.getAdjustedFundAsHz();
  
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
  int pitchb1 = round(rfpit/10);
  int volb1 = round(rfvol);
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
  
}