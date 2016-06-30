/*
  Started: 05/31/2016
  MRA
  Lux Aurumque
    - SceneA is raining Light - Amanda's idea
    - press a key to change to next scene 
*/

Input  myInput1;
Input  myInput2;
Input  myInput3;
Input  myInput4;
MultipleInputs  mInputs;
PImage  img;
Candle myCandle[];
int orbs = 9; //number of glowing orbs
int scene = 0;
int waitUntil;

//// SCENE ORDER ////////////////////////////////
int sceneA = 1;
int sceneB = 2;
int sceneC = 3;

void setup()
{
  mInputs = new MultipleInputs(new String[] { "Lux 1.mp3", "Lux 2.mp3", "Lux 3.mp3", "Lux 4.mp3"});
  myCandle = new Candle[orbs];
  myCandle[0] = new Candle(random(360), 100, 100, 100, width/10*9, 1); 
  myCandle[1] = new Candle(random(360), 120, 80, 60, width/10*1, 1); 
  myCandle[2] = new Candle(random(360), 110, 90, 60, width/10*2, 1); 
  myCandle[3] = new Candle(random(360), 80, 80, 60, width/10*3, 1); 
  myCandle[4] = new Candle(random(360), 80, 110, 80, width/10*4, 1); 
  myCandle[5] = new Candle(random(360), 80, 80, 110, width/10*5, 1); 
  myCandle[6] = new Candle(random(360), 100, 80, 100, width/10*6, 1); 
  myCandle[7] = new Candle(random(360), 100, 100, 100, width/10*7, 1); 
  myCandle[8] = new Candle(random(360), 100, 100, 100, width/10*8, 1); 
// Candle(degrees for circle formation, redTint, greenTint, blueTint, xLocation for even spacing, sizeAdjustment);
}

void draw(){
  background(0);
  myInput1 = mInputs.get(0);
  myInput2 = mInputs.get(1);
  myInput3 = mInputs.get(2);
  myInput4 = mInputs.get(3);
  
// SETS THE SCENE /////////////////////////////////////////
// sets which picture goes with each scene
  if (keyPressed && millis() > waitUntil){
    scene ++;
    if (scene == 2){
      img = loadImage("bellPeppers.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 1){
      img = loadImage("pianoRoom.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene == 3){
      img = loadImage("bellPepperPiano.jpg");
      img.resize(width, height);
      img.loadPixels();
      loadPixels();
    }
    if (scene > 3){
      scene = 1;
    }
    waitUntil = millis()+500;
    println(scene);
  }

// SCENES ////////////////////////////////////////////////

  if (scene == sceneA){
    if (myInput2.getAmplitude() > 0.01){
      myCandle[0].fall();
      myCandle[1].fall();
      myCandle[2].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myCandle[0].resetYDrop();
      myCandle[1].resetYDrop();
      myCandle[2].resetYDrop();
    }
    if (myInput3.getAmplitude() > 0.01){
      myCandle[3].fall();
      myCandle[4].fall();
      myCandle[5].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myCandle[3].resetYDrop();
      myCandle[4].resetYDrop();
      myCandle[5].resetYDrop();
    }
    if (myInput4.getAmplitude() > 0.01){
      myCandle[6].fall();
      myCandle[7].fall();
    }
    if (myInput4.getAmplitude() < 0.01){
      myCandle[6].resetYDrop();
      myCandle[7].resetYDrop();
    }
    myCandle[8].freqPoints(myInput1.getAdjustedFundAsHz(), myInput1.getAmplitude());
    colorLightfall(true, 20);
  }
  if (scene == sceneB) {
      myCandle[0].circle(myInput1.getAmplitude(), width/1.5, height/3);
      myCandle[1].circle(myInput1.getAmplitude(), width/1.5, height/3);
      myCandle[2].circle(myInput2.getAmplitude(), width/1.5, height/3);
      myCandle[3].circle(myInput2.getAmplitude(), width/1.5, height/3);
      myCandle[4].circle(myInput3.getAmplitude(), width/1.5, height/3);
      myCandle[5].circle(myInput3.getAmplitude(), width/1.5, height/3);
      myCandle[6].circle(myInput4.getAmplitude(), width/1.5, height/3);
      myCandle[7].circle(myInput4.getAmplitude(), width/1.5, height/3);
      myCandle[8].highlight(myInput1.getAmplitude(), width/1.5, height/3);
      grayLightfall();
  }
  if (scene == sceneC) {
    myCandle[0].highlight(myInput1.getAmplitude(), width/2, height/2);
    myCandle[1].hover(myInput2.getAdjustedFundAsHz(), myInput2.getAmplitude());
    myCandle[2].hover(myInput2.getAdjustedFundAsHz(), myInput2.getAmplitude());
    myCandle[3].hover(myInput2.getAdjustedFundAsHz(), myInput3.getAmplitude());
    myCandle[4].hover(myInput3.getAdjustedFundAsHz(), myInput3.getAmplitude());
    myCandle[5].hover(myInput3.getAdjustedFundAsHz(), myInput4.getAmplitude());
    myCandle[6].hover(myInput3.getAdjustedFundAsHz(), myInput4.getAmplitude());
    myCandle[7].hover(myInput4.getAdjustedFundAsHz(), myInput4.getAmplitude());
    myCandle[8].hover(myInput4.getAdjustedFundAsHz(), myInput4.getAmplitude());
    colorLightfall(false, 50);
  }
}// draw

//graysLightfall is a simpler version of colorLightfall. See notes in colorLightfall for explanations.
void grayLightfall(){
float xPos, yPos;
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      int j = 0;
      float r;
      r = red (img.pixels[loc]);
      float tempBrightness;
      float brightness = -255;
      for (int i = 0; i < myCandle.length; i++){
        xPos = myCandle[i].getXGlow();
        yPos = myCandle[i].getYGlow();
        float maxdist = myCandle[i].getSize();
        float d = dist(x, y, xPos, yPos);
        if (d <= 2*maxdist) {
          if (j == 0) {
            r = myCandle[i].getRedTint()*r;
            j++;
          }
          tempBrightness = 255*(maxdist-d)/maxdist;
          if (tempBrightness > brightness) {
            brightness = tempBrightness;
          }
        }//if near (xGlow, yGlow)
      }//for myCandle
      r += brightness;
      constrain(r, 0, 255);
      color c = color(r);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}

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
              j++;
            }
          }
          tempBrightness = 255*(maxdist-d)/maxdist; //brightness is determined by distance from (x, y) location of orb
          if (tempBrightness > adjustBrightness) { //keep the bigger one
            adjustBrightness = tempBrightness;
          }
        }//if pixels are near the raindrop location
      }//for candle array
      if (adjustBrightness < -220) { //this makes it so the rest of the image can be shown
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