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

void settings()
{
  size(1000, 1000);
}

void setup()
{
  testInput  = new Input();  //calls the Input_Class
}

void draw()
{
  background(0);
  //float  note = testInput.getFreqAsHz();  //I use this to easily reference frequency
  float volume = testInput.getAmplitude();  //an easy reference to amplitude

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
  while((volume%100)==0)
  {
    float i = volume/100;
    for(i=volume/100; i>-1; i--)
    {
      rect(10,800,100,10*i+800-100*i);
    }
  }
  
  
  // first rectangle parameter is (i * 100) + 110
  // in this loop: for(int i = 0; i < [someLength - numberOfRectangles, perhaps?]; i++)
  
  //ORANGE
  stroke(255);
  fill(255, 145, 0); //255 145 0
  rectMode(CORNERS);
  rect(110,800,200,800-volume);
  
  //YELLOW
  stroke(255);
  fill(250, 255, 0); //250 255 0
  rectMode(CORNERS);
  rect(210,800,300,800-volume);
  
  //ELECTRIC GREEN
  stroke(255);
  fill(41, 255, 0); //41 255 0
  rectMode(CORNERS);
  rect(310,800,400,800-volume);
  
  //CYAN
  stroke(255);
  fill(0, 255, 232); //0 255 232
  rectMode(CORNERS);
  rect(410,800,500,800-volume);
  
  //PERIWINKlE
  stroke(255);
  fill(0, 129, 255); //0 129 255
  rectMode(CORNERS);
  rect(510,800,600,800-volume);
  
  //INDIGO
  stroke(255);
  fill(45, 0, 255); //45 0 255
  rectMode(CORNERS);
  rect(610,800,700,800-volume);
  
  //PURPLE
  stroke(255);
  fill(139, 0, 255); //139 0 255
  rectMode(CORNERS);
  rect(710,800,800,800-volume);
  
  //FUCHSIA
  stroke(255);
  fill(255, 0, 222); //255 0 222
  rectMode(CORNERS);
  rect(810,800,900,800-volume);
  
}