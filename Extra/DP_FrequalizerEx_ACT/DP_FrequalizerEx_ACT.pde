/*
  * 6/11/2016
  * Amanda Tenhoff
  * This particular file makes an equalizer which
  * - changes hue depending on frequency
  * - changes height depending on amplitude
  * This model focuses on changing hues.
  * I'm hoping to have each stacked shape be a different hue,
  * with the lightest shade on the top.
  * I also am considering having different stacked shapes
  * for each input, such as circles for one, rectangles for another?
  * I have yet to find out how to do this
  * with multiple inputs (as of 6/11) but we have the
  * technology so we can rebuild him.
  * :)
  * One problem with this is that some colors are just
  * really similar to other colors. Orange ends up
  * looking yellow eventually and the blues look the same too.
 */
  
Input testInput;
AudioInput in;

int VolAdjust = 20;
int PitAdjust = 10;

int colorDecay = 2;

void setup()
{
  testInput  = new Input();  //calls the Input_Class
}

void draw()
{
  background(0);
  float note = testInput.getFreqAsHz();
  float volume = testInput.getAmplitude();
  //float  note = ip.getFundAsHz();  //I use this to easily reference frequency
  //float volume = 10*ip.getAmplitude();  //an easy reference to amplitude

  /*the following code creates rectangles which represent
   *the 9 different voices/inputs.
   *The rectangle needs the y-parameter to have the volume
   *subtracted by a given height since the y-axis starts
   *from the upper left-hand corner and is positive down.
   *Additionally, rectMode(CORNERS) lets me set the parameters
   *for each corner of the rectangle.
   */
   int pitch = round(note/PitAdjust);
   int i = round(volume/VolAdjust); //changed from what was previously volume%5
  
  int refy = round(3*height/4);
  println("refy is "+refy);
  int refx = round(width/11);
  int space = round(height/100);  //for universally determing the space between stacks
  int w = refx-space;  //for universally determining the width of the bars
  println("w is "+w);
  int h = round(height/30);  //for universally determining the height of the stacks
  println("h is "+h);
  //int off = space/2;
  int crefx = width/2;
  int halfwmin = crefx - w/2;
  int halfwplus = crefx + w/2;
  
  //RED
  stroke(255);
  rectMode(CORNERS);
  int oldj=0; //for reversing color stack (darkest on bottom;
              //stack is from bottom to top)
  int oldpitch=pitch/(i+1); //have to add 1 because sometimes i is zero
  for(oldj=0; oldj<i; oldj++)
  {
    fill(255-colorDecay*oldpitch, 0, 0); //255 0 0
    rect(halfwmin-4*space-4*w,refy-(space+h)*oldj, halfwmin-4*space-3*w, (refy-h)-(space+h)*oldj); //makes boxes!
    oldpitch = oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
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
  * would have 800-2-30*j, which simplifies to 780-30*j.
  * Knowing this, we can now make consecutive boxes and shapes of
  * all sizes! :)
  */
  
  //ORANGE
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(255-colorDecay*oldpitch, 145-colorDecay*oldpitch, 0); //255 145 0
    rect(halfwmin-3*space-3*w,refy-(space+h)*oldj,halfwmin-3*space-2*w,(refy-h)-(space+h)*oldj);
    oldpitch = oldpitch + pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //YELLOW
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(250-colorDecay*oldpitch, 255-colorDecay*oldpitch, 0); //250 255 0
    rect(halfwmin-2*space-2*w,refy-(space+h)*oldj,halfwmin-2*space-w,(refy-h)-(space+h)*oldj);
    oldpitch = oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //ELECTRIC GREEN
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(41-colorDecay*oldpitch, 255-colorDecay*oldpitch, 0); //41 255 0
    rect(halfwmin - space - w,refy-(space+h)*oldj,halfwmin - space,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //CYAN
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(0, 255-colorDecay*oldpitch, 232-colorDecay*oldpitch); //0 255 232
    rect(halfwmin,refy-(space+h)*oldj, halfwplus,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //PERIWINKlE
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(0, 129-colorDecay*oldpitch, 255-colorDecay*oldpitch); //0 129 255
    rect(halfwplus+space,refy-(space+h)*oldj,halfwplus+space+w,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //INDIGO
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(45-colorDecay*oldpitch, 0, 255-colorDecay*oldpitch); //45 0 255
    rect(halfwplus+2*space+w,refy-(space+h)*oldj,halfwplus+2*space+2*w,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //PURPLE
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(139-colorDecay*oldpitch, 0, 255-colorDecay*oldpitch); //139 0 255
    rect(halfwplus+3*space+2*w,refy-(space+h)*oldj,halfwplus+3*space+3*w,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
  //FUCHSIA
  stroke(255);
  rectMode(CORNERS);
  for(oldj=0; oldj<i; oldj++)
  {
    fill(255-colorDecay*oldpitch, 0, 222-colorDecay*oldpitch); //255 0 222
    rect(halfwplus+4*space+3*w,refy-(space+h)*oldj,halfwplus+4*space+4*w,(refy-h)-(space+h)*oldj);
    oldpitch=oldpitch+pitch/(i+1);
  }
  oldpitch=pitch/(i+1);
  
}