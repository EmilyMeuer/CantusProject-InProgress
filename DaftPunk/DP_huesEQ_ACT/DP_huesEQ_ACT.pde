/*
  * 6/11/2016
  * Amanda Tenhoff
  * This particular file makes an equalizer which
  * - changes hue depending on AMPLITUDE
  * - changes height depending on amplitude
  * This model focuses on changing hues.
  * I'm hoping to have each stacked shape be a different hue,
  * with the lightest shade on the top.
  * I also am considering having different stacked shapes
  * for each input, such as circles for one, rectangles for another?
  * I have yet to find out how to do this
  * with multiple inputs (as of 6/11) but we have the
  * technology so we can rebuild him.
  * The next plan is to have frequency affect hues,
  * which I started to do but decided to upload, so it is
  * a bit messy.
  *  
  * One problem with this is that some colors are just
  * really similar to other colors. Orange ends up
  * looking yellow eventually and the blues look the same too.
 */
  
Input testInput;
AudioInput in;
//InputPitch ip;

 /* Another quick note, I can't get InputPitch to work properly.
  * I keep getting a Null Pointer Exception on the line
  * this.input = minim.getLineIn();
  * :(
  */

void setup()
{
  testInput  = new Input();  //calls the Input_Class
  //ip = new InputPitch(); //calls InputClassPitch_EMM
  //minim = new Minim(this); //adding this did not help
}

void draw()
{
  background(0);
  float note = testInput.getFreqAsHz();
  float volume = 10*testInput.getAmplitude();
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
   //int pitch = round(note/7);
   int i = round(volume/20); //changed from what was previously volume%5
  
  //RED
  stroke(255);
  rectMode(CORNERS);
  int j;
  int oldj=0; //for reversing color stack (darkest on bottom;
              //stack is from bottom to top)
  for(j=i; j>0; j--)
  {
    fill(50*j, 0, 0); //255 0 0
    rect(10,800-30*oldj, 100, 780-30*oldj); //makes boxes!
    oldj++;
  }
  oldj=0;
  
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
  for(j=i; j>0; j--)
  {
    fill(50*j, 20*j, 0); //255 145 0
    rect(110,800-30*oldj,200,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //YELLOW
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(50*j, 50*j, 0); //250 255 0
    rect(210,800-30*oldj,300,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //ELECTRIC GREEN
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(10*j, 60*j, 0); //41 255 0
    rect(310,800-30*oldj,400,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //CYAN
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(0, 50*j, 45*j); //0 255 232
    rect(410,800-30*oldj,500,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //PERIWINKlE
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(0, 20*j, 40*j); //0 129 255
    rect(510,800-30*oldj,600,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //INDIGO
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(10*j, 0, 60*j); //45 0 255
    rect(610,800-30*oldj,700,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //PURPLE
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(10*j, 0, 90*j); //139 0 255
    rect(710,800-30*oldj,800,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
  //FUCHSIA
  stroke(255);
  rectMode(CORNERS);
  for(j=i; j>0; j--)
  {
    fill(50*j, 0, 40*j); //255 0 222
    rect(810,800-30*oldj,900,780-30*oldj);
    oldj++;
  }
  oldj=0;
  
}