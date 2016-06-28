/*
  Emily Meuer
 06/25/2016
 
 06/22/2016
 Michaela Andrews
 - making one large geometric design
 - perhaps have the lower voices add the geometry and the higher voices add color??
 - or what if each singer controlled their own rosette?
 - use i % 2 to switch between radii every other point for more desings?
 
 Struggling to pause during draw.  Suggestion from forum (https://processing.org/discourse/beta/num_1264463285.html):
 boolean cont = false;
 
 void setup(){
 size(256, 256);  // Stage size
 }
 
 void draw(){
 // use a condition not a loop
 if(cont == true){
 // I don't want this to happen yet
 println("mouse was pressed");
 }
 
 if(mousePressed){
 cont=true;
 }
 
 }
 
 // the separate methods approach has some advantages
 // e.g. separates user input from draw = potentially greater 
 // clarity of code; and also handles more events
 void mouseReleased() {
 cont = false; 
 }  
 
 */

/*
//  Original values:
 float radius1 = 300;
 float radius2 = 220;
 float radius3 = 80;
 float radius4 = 460;
 */

float radius1;
float radius2;
float radius3;
float radius4;
float radius5;
float radius6;

float x1, x2, y1, y2;
Input  input;

float rotateBy;
float  time;
int    i;
float  thresholdFreq;

void setup() {
  background(0);
  input = new Input();

  radius1 = 40;
  radius2 = 100;
  radius3 = 270;
  radius4 = radius3 * 1.4;
  radius5 = 500;
  radius6 = 725;

  rotateBy = 0;

  time = 1000;
  i    = 0;
  thresholdFreq  = 100;
}

void draw() {
  //  background(0);
  translate(width/2, height/2);

  drawPastThreshold(radius5, 500);
} // draw()

void drawOnDelay(float radius)
{
    // draws a line every second:
   if ( millis() > time  && i < 16) {
   drawRosetteThree(radius, i);
   
   println("i = " + i + "; time = " + time + "; millis() = " + millis());
   
   time = millis() + 1000;
   i++;
   } // if
} // drawOnDelay

void drawPastThreshold(float radius, float thresholdFreq)
{
  // Add some sort of delay?  So only draws once for each time it is crossed?
  
  // Draws a line each time the pitch crossed a frequency threshold:
  if ( (input.getAdjustedFundAsHz() > thresholdFreq)  && (i < 16) ) {
    drawRosetteThree(radius, i);

    println("i = " + i + "; input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz() + "; thresholdFreq = " + thresholdFreq);

    i++;
  } // if
} // drawPastThreshold(float)

void drawAndRaiseThreshold(float radius) 
{
   // Draws a line each time the pitch crosses a frequency threshold, and ups the threshold each time:
  if ( (input.getAdjustedFundAsHz() > thresholdFreq)  && (i < 16) ) {
    drawRosetteThree(radius, i);

    println("i = " + i + "; input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz() + "; thresholdFreq = " + thresholdFreq);

    thresholdFreq += 100;
    i++;
  } // if
} // drawAndRaiseThreshold(float)

void drawRosetteThree(float radius, int whichStroke) {
  if (whichStroke > 15) {
    throw new IllegalArgumentException("Zikr_Rosette_v3_Draw_EMM.drawRosetteThree: int parameter " + whichStroke + " is greater than the number of lines in the rosette.");
  }

  x1 = radius*cos(PI/4*3*whichStroke);
  x2 = radius*cos(PI/4*3*(whichStroke+1));
  y1 = radius*sin(PI/4*3*whichStroke);
  y2 = radius*sin(PI/4*3*(whichStroke+1));
  strokeWeight(3);
  stroke(220);
  line(x1, y1, x2, y2);
  strokeWeight(2.5);
  stroke(200, 50, 50);
  line(x1, y1, x2, y2);
} // drawRosetteThree

void rosettePartThree(float radius) {
  for (int i = 0; i < 16; i++) {
    /*
    println("cos(PI/4*3* " + i + ") = " + cos(PI/4*3*i));
     println("radius*cos(PI/4*3*(" + i + "+1)) = " + radius*cos(PI/4*3*(i+1)));
     println("radius*sin(PI/4*3*" + i + ") = " + radius*sin(PI/4*3*i));
     println("radius*sin(PI/4*3*(" + i + "+1)) = " + radius*sin(PI/4*3*(i+1)));
     */
    x1 = radius*cos(PI/4*3*i);
    x2 = radius*cos(PI/4*3*(i+1));
    y1 = radius*sin(PI/4*3*i);
    y2 = radius*sin(PI/4*3*(i+1));
    strokeWeight(1);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(.5);
    stroke(200, 50, 50);
    line(x1, y1, x2, y2);
  }
} // rosettePartThree(float)

void rosettePartOne(float radius) {
  for (int i = 0; i < 4; i++) {
    x1 = radius*cos(PI/2*i);
    x2 = radius*cos(PI/2*(i+1));
    y1 = radius*sin(PI/2*i);
    y2 = radius*sin(PI/2*(i+1));
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(3);
    stroke(50, 50, 200);
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < 4; i++) {
    x1 = radius*cos(PI/2*i+PI/4);
    x2 = radius*cos(PI/2*(i+1)+PI/4);
    y1 = radius*sin(PI/2*i+PI/4);
    y2 = radius*sin(PI/2*(i+1)+PI/4);
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(3);
    stroke(50, 50, 200);
    line(x1, y1, x2, y2);
  }
}

void rosettePartTwo(float radius) {
  for (int i = 0; i < 8; i++) {
    x1 = radius*cos(PI/4*3*i+PI/8);
    x2 = radius*cos(PI/4*3*(i+1)+PI/8);
    y1 = radius*sin(PI/4*3*i+PI/8);
    y2 = radius*sin(PI/4*3*(i+1)+PI/8);
    strokeWeight(4);
    stroke(220);
    line(x1, y1, x2, y2);
    strokeWeight(2);
    stroke(50, 200, 50);
    line(x1, y1, x2, y2);
  }
} // rosettePartTwo