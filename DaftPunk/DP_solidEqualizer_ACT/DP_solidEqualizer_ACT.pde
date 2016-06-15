/*
  * 6/5/2016
  * Amanda Tenhoff
  * This particular file makes an equalizer
  * which DOES NOT change shades depending on frequency
  * but DOES change height depending on amplitude.
  * It is a simple skeletal model from which
  * I will be building.
  * Next sketch ideas include:
  * - making the bars change hues depending on freq
  * - making the bars cut into stacked rectangles
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
  float volume = testInput.getAmplitude();  //an easy reference to amplitude

  // This line is an example of getting the amplitude from the first input in a MutipleInputs object
  // (I didn't make the MI object; you'll have to do that.)
  // float volume = multipleInputs.get(0).getAmplitude();

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
  rect(10,800,100,800-volume);
  
  //ORANGE
  stroke(255);
  fill(255, 145, 0); //255 145 0
  rectMode(CORNERS);
  rect(110,800, 200, 800-volume);
  
  //YELLOW
  stroke(255);
  fill(250, 255, 0); //250 255 0
  rectMode(CORNERS);
  rect(210,800, 300, 800-volume);
  
  //ELECTRIC GREEN
  stroke(255);
  fill(41, 255, 0); //41 255 0
  rectMode(CORNERS);
  rect(310,800,400, 800-volume);
  
  //CYAN
  stroke(255);
  fill(0, 255, 232); //0 255 232
  rectMode(CORNERS);
  rect(410,800, 500, 800-volume);
  
  //PERIWINKlE
  stroke(255);
  fill(0, 129, 255); //0 129 255
  rectMode(CORNERS);
  rect(510,800,600, 800-volume);
  
  //INDIGO
  stroke(255);
  fill(45, 0, 255); //45 0 255
  rectMode(CORNERS);
  rect(610,800,700, 800-volume);
  
  //PURPLE
  stroke(255);
  fill(139, 0, 255); //139 0 255
  rectMode(CORNERS);
  rect(710,800, 800, 800-volume);
  
  //FUCHSIA
  stroke(255);
  fill(255, 0, 222); //255 0 222
  rectMode(CORNERS);
  rect(810,800, 900, 800-volume);
  
}