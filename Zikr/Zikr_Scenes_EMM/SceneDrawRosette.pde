class DrawRosette implements Scene
{
  /*
    06/29/2016
   Emily Meuer
   
   This scene draws a rosette, either on a timer or on an audio-input-triggered event.
   
   Will need to integrate multiple inputs later.
   */

  Input  input;
  int    stroke;
  int[]  freqThresholds  = new int[] { 
    150, 
    160, 
    190, 
    205, 
    230, 
    255, 
    325  };
  float  thresholdFreq;
  float  time  = 100;
  int    waitUntil;

  /*
   Frequencies:
   Eb 3      -  155.56
   Fb (E) 3  -  164.81
   G 3       -  196.00
   Ab 3      -  207.65
   Bb 3      -  233.08
   C 4       -  261.63
   Fb (E) 4  -  329.63
   */

  DrawRosette(Input input)
  {
    this.input  = input;
    this.stroke = 0;
    
    this.thresholdFreq = 100;
    waitUntil  = millis();
  } // constructor
  
  public void run()
  {
    translate(width/2, height/2);
    drawAndRaiseThreshold(500);
  } // run()
  
  void drawAndRaiseThreshold(float radius) 
  {
    // Draws a line each time the pitch crosses a frequency threshold, and ups the threshold each time:
    if ( (stroke < 16) && (input.getAdjustedFundAsHz() > freqThresholds[stroke/3]) && millis() > waitUntil ) {
      waitUntil  = millis() + 300;
      drawRosetteThree(radius, stroke);
  
      println("i = " + stroke + "; input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz() + "; thresholdFreq = " + thresholdFreq);
  
      thresholdFreq += 100;
      stroke++;
    } // if
  } // drawAndRaiseThreshold(float)
  
  void drawOnDelay(float radius)
  {
    // draws a line every second:
    if ( millis() > time  && stroke < 16) {
      drawRosetteThree(radius, stroke);
  
      println("stroke = " + stroke + "; time = " + time + "; millis() = " + millis());
  
      time = millis() + 1000;
      stroke++;
    } // if
  } // drawOnDelay
  
  void drawPastThreshold(float radius, float thresholdFreq)
  {
    // Add some sort of delay?  So only draws once for each time it is crossed?
  
    // Draws a line each time the pitch crossed a frequency threshold:
    if ( (input.getAdjustedFundAsHz() > thresholdFreq)  && (stroke < 16) ) {
      drawRosetteThree(radius, stroke);
  
      println("stroke = " + stroke + "; input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz() + "; thresholdFreq = " + thresholdFreq);
  
      stroke++;
    } // if
  } // drawPastThreshold(float)
  
  void drawRosetteThree(float radius, int whichStroke) {
    if (whichStroke > 15) {
      throw new IllegalArgumentException("Zikr_Rosette_v3_Draw_EMM.drawRosetteThree: int parameter " + whichStroke + " is greater than the number of lines in the rosette.");
    }
  
    float x1 = radius*cos(PI/4*3*whichStroke);
    float x2 = radius*cos(PI/4*3*(whichStroke+1));
    float y1 = radius*sin(PI/4*3*whichStroke);
    float y2 = radius*sin(PI/4*3*(whichStroke+1));
    strokeWeight(3);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(2.5);
    stroke(200, 50, 50);
    line(x1, y1, x2, y2);
  } // drawRosetteThree
} // DrawRosette