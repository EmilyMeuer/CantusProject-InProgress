/*
  Started: 06/29/2016
  MRA
  Lux Aurumque
    - SceneA is raining Light - Amanda's idea
    - press a key to change to next scene 
*/

Input  myInput;
PImage  img;
Candle myCandle[];
int orbs = 9; //number of glowing orbs
int scene = 0;
int waitUntil;
float fallThreshold = 0.01;

void setup()
{
  myInput = new Input(9);
  myCandle = new Candle[orbs];
  myCandle[0] = new Candle(255, 175, 210, width/10*9, 1); //pink
  myCandle[1] = new Candle(255, 234, 44, width/10*1, 1); //yellow
  myCandle[2] = new Candle(224, 36, 71, width/10*2, 1); //red
  myCandle[3] = new Candle(255, 90, 8, width/10*3, 1);  //orange
  myCandle[4] = new Candle(162, 211, 2, width/10*4, 1); //light green
  myCandle[5] = new Candle(1, 100, 65, width/10*5, 1); //forest green
  myCandle[6] = new Candle(149, 176, 250, width/10*6, 1); //periwinkle
  myCandle[7] = new Candle(122, 73, 155, width/10*7, 1); //violet
  myCandle[8] = new Candle(247, 3, 222, width/10*8, 1); //fuchsia
// Candle(degrees for circle formation, redTint, greenTint, blueTint, xLocation for even spacing, sizeAdjustment);
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

  if (scene == 1){ //start of piece
    myCandle[0].freqPoints(myInput.getAdjustedFundAsHz(1), myInput.getAmplitude(1)); //tenor solo controlls this
    for (int i=1; i<9; i++){
      if (myInput.getAmplitude(i+1) > fallThreshold){
        myCandle[i].fall();
      }
      if (myInput.getAmplitude(i+1) < fallThreshold){
        myCandle[i].resetYDrop();
      }
    }
    colorLightfall(true, 75);
  }
  
  if (scene == 2) { //at first "calida"
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.6, height*0.15); //tenor1 controlls this
      myCandle[1].circle(myInput.getAmplitude(2), myInput.getAdjustedFundAsHz(2), width*0.6, height*0.2);
      myCandle[2].circle(myInput.getAmplitude(3), myInput.getAdjustedFundAsHz(3), width*0.6, height*0.2);
      myCandle[3].circle(myInput.getAmplitude(4), myInput.getAdjustedFundAsHz(4), width*0.6, height*0.2);
      myCandle[4].circle(myInput.getAmplitude(5), myInput.getAdjustedFundAsHz(5), width*0.6, height*0.2);
      myCandle[5].circle(myInput.getAmplitude(6), myInput.getAdjustedFundAsHz(6), width*0.6, height*0.2);
      myCandle[6].circle(myInput.getAmplitude(7), myInput.getAdjustedFundAsHz(7), width*0.6, height*0.2);
      myCandle[7].circle(myInput.getAmplitude(8), myInput.getAdjustedFundAsHz(8), width*0.6, height*0.2);
      myCandle[8].circle(myInput.getAmplitude(9), myInput.getAdjustedFundAsHz(9), width*0.6, height*0.2);
      colorLightfall(false, 75);
  }
  
  if (scene == 3) { //at first "pura"
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.5, height*0.8); //tenor1 still controls this
      myCandle[1].hover(myInput.getAdjustedFundAsHz(2), myInput2.getAmplitude());
      myCandle[2].hover(myInput.getAdjustedFundAsHz(3), myInput2.getAmplitude());
      myCandle[3].hover(myInput.getAdjustedFundAsHz(4), myInput2.getAmplitude());
      myCandle[4].hover(myInput.getAdjustedFundAsHz(5), myInput3.getAmplitude());
      myCandle[5].hover(myInput.getAdjustedFundAsHz(6), myInput3.getAmplitude());
      myCandle[6].hover(myInput.getAdjustedFundAsHz(7), myInput4.getAmplitude());
      myCandle[7].hover(myInput.getAdjustedFundAsHz(8), myInput4.getAmplitude());
      myCandle[8].hover(myInput.getAdjustedFundAsHz(9), myInput4.getAmplitude());
      colorLightfall(true, 75);
  }
  
  if (scene == 4) { //at first "canunt"
    myCandle[0].hover(myInput.getAdjustedFundAsHz(1), myInput2.getAmplitude());
    myCandle[1].hover(myInput.getAdjustedFundAsHz(2), myInput2.getAmplitude());
    myCandle[2].hover(myInput.getAdjustedFundAsHz(3), myInput2.getAmplitude());
    myCandle[3].hover(myInput.getAdjustedFundAsHz(4), myInput3.getAmplitude());
    myCandle[4].hover(myInput.getAdjustedFundAsHz(5), myInput3.getAmplitude());
    myCandle[5].hover(myInput.getAdjustedFundAsHz(6), myInput4.getAmplitude());
    myCandle[6].hover(myInput.getAdjustedFundAsHz(7), myInput4.getAmplitude());
    myCandle[7].hover(myInput.getAdjustedFundAsHz(8), myInput4.getAmplitude());
    myCandle[8].hover(myInput.getAdjustedFundAsHz(9), myInput4.getAmplitude());
    colorLightfall(true, 60);
  }
  
  if (scene == 5){ //right after the grand pause after "angeli"
    myCandle[0].freqPoints(myInput.getAdjustedFundAsHz(1), myInput.getAmplitude(1)); //tenor solo controlls this
    for (int i=1; i<9; i++){
      if (myInput.getAmplitude(i+1) > fallThreshold){
        myCandle[i].fall();
      }
      if (myInput.getAmplitude(i+1) < fallThreshold){
        myCandle[i].resetYDrop();
      }
    }
    colorLightfall(true, 75);
  }
  
  if (scene == 6) { // at "natum" of lower voices (not tenor soli)
      myCandle[0].highlight(myInput.getAmplitude(1), width*0.15, height*0.8); //tenor soli controls this
      myCandle[1].highlight(myInput.getAmplitude(2), width*0.15, height*0.8); //tenor soli controls this
      myCandle[2].circle(myInput.getAmplitude(3), myInput.getAdjustedFundAsHz(3), width*0.2, height*0.6);
      myCandle[3].circle(myInput.getAmplitude(4), myInput.getAdjustedFundAsHz(4), width*0.2, height*0.6);
      myCandle[4].circle(myInput.getAmplitude(5), myInput.getAdjustedFundAsHz(5), width*0.2, height*0.6);
      myCandle[5].circle(myInput.getAmplitude(6), myInput.getAdjustedFundAsHz(6), width*0.2, height*0.6);
      myCandle[6].circle(myInput.getAmplitude(7), myInput.getAdjustedFundAsHz(7), width*0.2, height*0.6);
      myCandle[7].circle(myInput.getAmplitude(8), myInput.getAdjustedFundAsHz(8), width*0.2, height*0.6);
      myCandle[8].circle(myInput.getAmplitude(9), myInput.getAdjustedFundAsHz(9), width*0.2, height*0.6);
      colorLightfall(false, 75);
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
        if (d <= 2*maxdist) { //only the pixels near the location of the raindrop are adjusted 
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
      if (adjustBrightness < -100) { //this makes it so the rest of the image can be shown
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