/*
  * 6/8/2016
  * Amanda Tenhoff
  * This particular file makes an equalizer
  * which DOES NOT change shades depending on frequency
  * but DOES change height depending on amplitude.
  * This model focuses on splitting the bars into
  * stacked rectangles depending on amplitude.
  * I have yet to find out how to do this
  * with multiple inputs (as of 6/8)
 */
  
Input testInput;
AudioInput in;
//Minim minim;

void setup()
{
  testInput  = new Input();  //calls the Input_Class
}

void draw()
{
  background(0);
  //float  note = testInput.getFreqAsHz();  //I use this to easily reference frequency
  float volume = 10*testInput.getAmplitude();  //an easy reference to amplitude

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
  fill(255, 0, 0); //255 0 0
  rectMode(CORNERS);
  float i = volume%5;
  int j=0;
  for(j=0; j<i; j++)
  {
    rect(10,800-30*j, 100, 780-30*j); //makes boxes!
  }
  
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
  fill(255, 145, 0); //255 145 0
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(110,800-20*j,200,790-20*j); //smaller boxes
  }
  
  //YELLOW
  stroke(255);
  fill(250, 255, 0); //250 255 0
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(210,800-20*j,300,790-20*j);
  }
  
  //ELECTRIC GREEN
  stroke(255);
  fill(41, 255, 0); //41 255 0
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(310,800-30*j,400,780-30*j);
  }
  
  //CYAN
  stroke(255);
  fill(0, 255, 232); //0 255 232
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(410,800-30*j,500,780-30*j);
  }
  
  //PERIWINKlE
  stroke(255);
  fill(0, 129, 255); //0 129 255
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(510,800-30*j,600,780-30*j);
  }
  
  //INDIGO
  stroke(255);
  fill(45, 0, 255); //45 0 255
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(610,800-30*j,700,780-30*j);
  }
  
  //PURPLE
  stroke(255);
  fill(139, 0, 255); //139 0 255
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(710,800-30*j,800,780-30*j);
  }
  
  //FUCHSIA
  stroke(255);
  fill(255, 0, 222); //255 0 222
  rectMode(CORNERS);
  for(j=0; j<i; j++)
  {
    rect(810,800-30*j,900,780-30*j);
  }
  
}