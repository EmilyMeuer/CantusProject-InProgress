/*
  Started: 06/29/2016
  MRA
  Lux Aurumque
    - press space bar to change to next scene 
    - labels for when to chance scene are in draw (text and measure number)
    P.S. I know I could use loops, but am not using them for now in case they don't play nicely with the live input class
    
  Edit 07/02/2016 by Emily Meuer:
    - adjusting calibration for new Input class.
*/

Input  myInput;
PImage  img;
Candle myCandle[];
int orbs = 9; //number of glowing orbs
int scene = 0;
int waitUntil;
// changed fallThreshold from 0.01 to 10
float fallThreshold = 10;

void setup()
{
  myInput = new Input(9);
  myCandle = new Candle[orbs];
  myCandle[0] = new Candle(100, 70, 30, width/10*9, 1); //yellow/gold
  myCandle[1] = new Candle(100, 60, 60, width/10*1, 1); //rose
  myCandle[2] = new Candle(100, 50, 30, width/10*2, 1); //red
  myCandle[3] = new Candle(90, 90, 50, width/10*3, 1);  //orange
  myCandle[4] = new Candle(50, 100, 70, width/10*4, 1); //light green
  myCandle[5] = new Candle(20, 90, 80, width/10*5, 1); //forest green
  myCandle[6] = new Candle(20, 40, 100, width/10*6, 1); //periwinkle
  myCandle[7] = new Candle(80, 50, 80, width/10*7, 1); //violet
  myCandle[8] = new Candle(100, 20, 90, width/10*8, 1); //fuchsia
// Candle(redTint, greenTint, blueTint, xLocation for even spacing, sizeAdjustment);
}

void draw(){
  background(0);
  
// SETS THE SCENE /////////////////////////////////////////
// sets which picture goes with each scene
  if (keyPressed && millis() > waitUntil){
    scene ++;
    if (scene == 1 || scene ==2){
      img = loadImage("starryNight.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 3){
      img = loadImage("angels.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 4){
      img = loadImage("angel1.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 5){
      img = loadImage("angel2.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 6){
      img = loadImage("holyFamily.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene > 6){
      scene = 1;
    }
    waitUntil = millis()+500;
    println(scene);
  }

// SCENES ////////////////////////////////////////////////

  if (scene == 1){ //start of piece, measure 1
    myCandle[0].freqPoints(myInput.getAdjustedFundAsHz(1), myInput.getAmplitude(1)); //tenor solo controlls this
    if (myInput.getAmplitude(2) > fallThreshold){
      myCandle[1].fall();
    }
    if (myInput.getAmplitude(2) < fallThreshold){
      myCandle[1].resetYDrop();
    }
    if (myInput.getAmplitude(3) > fallThreshold){
      myCandle[2].fall();
    }
    if (myInput.getAmplitude(3) < fallThreshold){
      myCandle[2].resetYDrop();
    }
    if (myInput.getAmplitude(4) > fallThreshold){
      myCandle[3].fall();
    }
    if (myInput.getAmplitude(4) < fallThreshold){
      myCandle[3].resetYDrop();
    }
    if (myInput.getAmplitude(5) > fallThreshold){
      myCandle[4].fall();
    }
    if (myInput.getAmplitude(5) < fallThreshold){
      myCandle[4].resetYDrop();
    }
    if (myInput.getAmplitude(6) > fallThreshold){
      myCandle[5].fall();
    }
    if (myInput.getAmplitude(6) < fallThreshold){
      myCandle[5].resetYDrop();
    }
    if (myInput.getAmplitude(7) > fallThreshold){
      myCandle[6].fall();
    }
    if (myInput.getAmplitude(7) < fallThreshold){
      myCandle[6].resetYDrop();
    }
    if (myInput.getAmplitude(8) > fallThreshold){
      myCandle[7].fall();
    }
    if (myInput.getAmplitude(8) < fallThreshold){
      myCandle[7].resetYDrop();
    }
    if (myInput.getAmplitude(9) > fallThreshold){
      myCandle[8].fall();
    }
    if (myInput.getAmplitude(9) < fallThreshold){
      myCandle[8].resetYDrop();
    }
    colorLightfall(true, 60);
  }
  
  if (scene == 2) { //at first "calida", measure 9
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.6, height*0.15); //tenor1 controlls this
      myCandle[1].circle(myInput.getAmplitude(2), myInput.getAdjustedFundAsHz(2), width*0.6, height*0.2);
      myCandle[2].circle(myInput.getAmplitude(3), myInput.getAdjustedFundAsHz(3), width*0.6, height*0.2);
      myCandle[3].circle(myInput.getAmplitude(4), myInput.getAdjustedFundAsHz(4), width*0.6, height*0.2);
      myCandle[4].circle(myInput.getAmplitude(5), myInput.getAdjustedFundAsHz(5), width*0.6, height*0.2);
      myCandle[5].circle(myInput.getAmplitude(6), myInput.getAdjustedFundAsHz(6), width*0.6, height*0.2);
      myCandle[6].circle(myInput.getAmplitude(7), myInput.getAdjustedFundAsHz(7), width*0.6, height*0.2);
      myCandle[7].circle(myInput.getAmplitude(8), myInput.getAdjustedFundAsHz(8), width*0.6, height*0.2);
      myCandle[8].circle(myInput.getAmplitude(9), myInput.getAdjustedFundAsHz(9), width*0.6, height*0.2);
      
      colorLightfall(false, 60);
  }
  
  if (scene == 3) { //at first "pura", measure 17
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.45, height*0.3); //tenor1 still controls this
      myCandle[1].hover(myInput.getAdjustedFundAsHz(2), myInput.getAmplitude(2));
      myCandle[2].hover(myInput.getAdjustedFundAsHz(3), myInput.getAmplitude(3));
      myCandle[3].hover(myInput.getAdjustedFundAsHz(4), myInput.getAmplitude(4));
      myCandle[4].hover(myInput.getAdjustedFundAsHz(5), myInput.getAmplitude(5));
      myCandle[5].hover(myInput.getAdjustedFundAsHz(6), myInput.getAmplitude(6));
      myCandle[6].hover(myInput.getAdjustedFundAsHz(7), myInput.getAmplitude(7));
      myCandle[7].hover(myInput.getAdjustedFundAsHz(8), myInput.getAmplitude(8));
      myCandle[8].hover(myInput.getAdjustedFundAsHz(9), myInput.getAmplitude(9));
      colorLightfall(true, 50);
  }
  
  if (scene == 4) { //at first "canunt", measure 24
    myCandle[0].hover(myInput.getAdjustedFundAsHz(1), myInput.getAmplitude(1));
    myCandle[1].hover(myInput.getAdjustedFundAsHz(2), myInput.getAmplitude(2));
    myCandle[2].hover(myInput.getAdjustedFundAsHz(3), myInput.getAmplitude(3));
    myCandle[3].hover(myInput.getAdjustedFundAsHz(4), myInput.getAmplitude(4));
    myCandle[4].hover(myInput.getAdjustedFundAsHz(5), myInput.getAmplitude(5));
    myCandle[5].hover(myInput.getAdjustedFundAsHz(6), myInput.getAmplitude(6));
    myCandle[6].hover(myInput.getAdjustedFundAsHz(7), myInput.getAmplitude(7));
    myCandle[7].hover(myInput.getAdjustedFundAsHz(8), myInput.getAmplitude(8));
    myCandle[8].hover(myInput.getAdjustedFundAsHz(9), myInput.getAmplitude(9));
    colorLightfall(true, 50);
  }
  
  if (scene == 5){ //right after the grand pause after "angeli", measure 30
    myCandle[0].freqPoints(myInput.getAdjustedFundAsHz(1), myInput.getAmplitude(1)); //tenor solo controlls this
    if (myInput.getAmplitude(2) > fallThreshold){
      myCandle[1].fall();
    }
    if (myInput.getAmplitude(2) < fallThreshold){
      myCandle[1].resetYDrop();
    }
    if (myInput.getAmplitude(3) > fallThreshold){
      myCandle[2].fall();
    }
    if (myInput.getAmplitude(3) < fallThreshold){
      myCandle[2].resetYDrop();
    }
    if (myInput.getAmplitude(4) > fallThreshold){
      myCandle[3].fall();
    }
    if (myInput.getAmplitude(4) < fallThreshold){
      myCandle[3].resetYDrop();
    }
    if (myInput.getAmplitude(5) > fallThreshold){
      myCandle[4].fall();
    }
    if (myInput.getAmplitude(5) < fallThreshold){
      myCandle[4].resetYDrop();
    }
    if (myInput.getAmplitude(6) > fallThreshold){
      myCandle[5].fall();
    }
    if (myInput.getAmplitude(6) < fallThreshold){
      myCandle[5].resetYDrop();
    }
    if (myInput.getAmplitude(7) > fallThreshold){
      myCandle[6].fall();
    }
    if (myInput.getAmplitude(7) < fallThreshold){
      myCandle[6].resetYDrop();
    }
    if (myInput.getAmplitude(8) > fallThreshold){
      myCandle[7].fall();
    }
    if (myInput.getAmplitude(8) < fallThreshold){
      myCandle[7].resetYDrop();
    }
    if (myInput.getAmplitude(9) > fallThreshold){
      myCandle[8].fall();
    }
    if (myInput.getAmplitude(9) < fallThreshold){
      myCandle[8].resetYDrop();
    }
    colorLightfall(true, 50);
  }
  
  if (scene == 6) { // at "natum" of lower voices (not tenor soli), measure 38
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.15, height*0.8); //tenor soli controls this
      myCandle[1].highlight(myInput.getAmplitude(2), width*0.15, height*0.8); //tenor soli controls this
      myCandle[2].circle(myInput.getAmplitude(3), myInput.getAdjustedFundAsHz(3), width*0.2, height*0.6);
      myCandle[3].circle(myInput.getAmplitude(4), myInput.getAdjustedFundAsHz(4), width*0.2, height*0.6);
      myCandle[4].circle(myInput.getAmplitude(5), myInput.getAdjustedFundAsHz(5), width*0.2, height*0.6);
      myCandle[5].circle(myInput.getAmplitude(6), myInput.getAdjustedFundAsHz(6), width*0.2, height*0.6);
      myCandle[6].circle(myInput.getAmplitude(7), myInput.getAdjustedFundAsHz(7), width*0.2, height*0.6);
      myCandle[7].circle(myInput.getAmplitude(8), myInput.getAdjustedFundAsHz(8), width*0.2, height*0.6);
      myCandle[8].circle(myInput.getAmplitude(9), myInput.getAdjustedFundAsHz(9), width*0.2, height*0.6);
      colorLightfall(false, 60);
  }
  
}// draw


// colorLightfall( tinted orbs?, percent brightness of overall image)
void colorLightfall(boolean onTint, float inShowImage) {
  float xPos, yPos;
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width; // Calculate the 1D location from a 2D grid
      float r,g,b;
      float adjustBrightness = -255; //set lowest value adjust brightness can be, then the below functions change it
      int j = 0; //for unhiding the pixels only one time
      int k = 0;
      r = red (img.pixels[loc]); // Get the R,G,B values from image
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
//uses position of raindrops to determine location of glow
      for (int i = 0; i < myCandle.length; i++){  //gets the position of each of the raindrops, and adjusts the pixels near it
        float tempBrightness = -255; //compares the brightness caused by one orb to the brightness of other orbs and keeps the brighter number
                                     //tempBrightness is the brightness of the current orb. adjustBrightness is the brightest value thus far
        xPos = myCandle[i].getXGlow();
        yPos = myCandle[i].getYGlow();
        float maxdist = myCandle[i].getSize();//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
        if (d <= 1.4*maxdist) { //only the pixels near the location of the raindrop are adjusted 
                                //the number maxdist is multiplied by has to be balanced with the "if (adjustBrightness <..." before the pixels are constrained
                                //if this isn't balanced, the tint will exceed the bubble
          if (j == 0) { //only want to tint the pixels one time (or else they get... well... very bright or dark)
            if (onTint == true){
              r = myCandle[i].getRedTint()*r; 
              g = myCandle[i].getGreenTint()*g;
              b = myCandle[i].getBlueTint()*b;
              j++;
            }
            if (onTint == false){
              r *= 1.0;
              g *= 0.7;
              b *= 0.3;
              j++;
            }
          }
          tempBrightness = 255*(maxdist-d)/maxdist; //brightness is determined by distance from (x, y) location of orb
          if (tempBrightness > adjustBrightness) { //keep the bigger one
            adjustBrightness = tempBrightness;
          }
        }//if pixels are near the raindrop location
      }//for candle array
      if (adjustBrightness < -100) {
        adjustBrightness = -255+255*inShowImage/100;
      }
      r += adjustBrightness;
      g += adjustBrightness;
      b += adjustBrightness;
      constrain(r, 0, 255);
      constrain(g, 0, 255);
      constrain(b, 0, 255);
      color c = color(r, g, b);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}