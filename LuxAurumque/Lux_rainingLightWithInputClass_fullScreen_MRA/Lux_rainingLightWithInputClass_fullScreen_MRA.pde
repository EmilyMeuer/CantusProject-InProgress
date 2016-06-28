/*
  Started: 05/31/2016
  Last updated: 06/16/2016
  MRA
  Lux Aurumque
    - Raining Light - Amanda's idea
    - Trying to do a canvas stretch to full screen instead of the full screen command
      I want the full screen presentation without additional pixels (I just want it stretched)
*/

Input  myInput1;
Input  myInput2;
Input  myInput3;
Input  myInput4;
MultipleInputs  mInputs;
PImage  img;
Raindrop myRaindrop[];
int raindrops = 3;
int arrayPos = 0;
Glow myGlow;
PGraphics canvas;


void setup()
{
//  size(480, 357);
  img = loadImage("NativityTriptych.jpg");
  img.resize(width, height);
  img.loadPixels();
  loadPixels(); 
  mInputs = new MultipleInputs(new String[] { "Lux 1.mp3", "Lux 2.mp3", "Lux 3.mp3", "Lux 4.mp3"});
  myRaindrop = new Raindrop[raindrops];
  myRaindrop[0] = new Raindrop(50);
  myRaindrop[1] = new Raindrop(240);
  myRaindrop[2] = new Raindrop(420);
  myGlow = new Glow();
  canvas = createGraphics(480,357,JAVA2D);
}

void draw(){
  myInput1 = mInputs.get(0);
  myInput2 = mInputs.get(1);
  myInput3 = mInputs.get(2);
  myInput4 = mInputs.get(3);
  canvas.beginDraw();
    if (myInput2.getAmplitude() > 0.01){
      myRaindrop[0].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myRaindrop[0].resetYDrop();
    }
    if (myInput3.getAmplitude() > 0.01){
      myRaindrop[1].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myRaindrop[1].resetYDrop();
    }
    if (myInput4.getAmplitude() > 0.01){
      myRaindrop[2].fall();
    }
    if (myInput4.getAmplitude() < 0.01){
      myRaindrop[2].resetYDrop();
    }
    lightfall();
    myGlow.shine();
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
}//draw


class Raindrop {
  float xDrop;
  float yDrop;
  float speed;
  float gravity;
//Constructor with input variable
  Raindrop(float inputXDrop){
    xDrop = inputXDrop;
    yDrop = -10;
    speed = 0;
    gravity = 0.05;
  }
//What it can do - fall
  void fall() {
    yDrop = yDrop + speed;
    speed = speed + gravity;
    if (yDrop>height+10){
      speed = speed * -0.5;
      yDrop = height+10;
    }
  }//void fall
  float getXDrop(){
    return xDrop;
  }
  float getYDrop(){
    return yDrop;
  }
  void resetYDrop(){
    yDrop = -10;
  }
}//class Raindrop



class Glow {
  float xGlow;
  float yGlow;
  float size;
  float curFreq;
  int scene;
 //Constructor with input variable
 Glow(){
   xGlow = 0;
   yGlow = 0;
   scene = 1;
 }
 void shine (){
   size = myInput1.getAmplitude()*500;
   curFreq = myInput1.getAdjustedFundAsHz();
   if (keyPressed){
     scene ++;
   }
   if (scene == 1){
     if ((curFreq > 250) && (curFreq < 300)){
       xGlow = 55;
       yGlow = 120;
     }
     if ((curFreq > 300) && (curFreq < 350)){
       xGlow = 390;
       yGlow = 150;
     }
     if (curFreq > 350){
       xGlow = 250;
       yGlow = 50;
     }
   }//scene 1
   if (scene == 2){
     xGlow = 240;
     yGlow = 200;
   }//scene 2
 }//void shine
 float getXGlow(){
   return xGlow;
 }
 float getYGlow(){
   return yGlow;
 }
 float getSize(){
 return size;
 }
}//class Shine


void lightfall() {
  float xPos, yPos;
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
// Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
// Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
//the below "hides" the color of each pixel so that they appear black unless brightened
      r = 0.01*r;
      g = 0.01*g;
      b = 0.01*b;
//GLOWING ORBS - uses position of raindrops to determine location of glow
//the below for loop gets the position of each of the raindrops, and adjusts the pixels near it
      for (int i = 0; i < myRaindrop.length; i++){
        xPos = myRaindrop[i].getXDrop();
        yPos = myRaindrop[i].getYDrop();
        float maxdist = 15;//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
//the below if statement makes it so that only the pixels near the location of the raindrop are adjusted
// (otherwise it "neutralizes" the color, getting rid of the picture)
        if (d <= 2*maxdist) {
//"unhiding" the color of the pixels
          r = 100*r;
          g = 100*g;
          b = 100*b;
          float adjustbrightness = 255*(maxdist-d)/maxdist;
          r += adjustbrightness;
          g += adjustbrightness;
          b += adjustbrightness;
          constrain(r, 0, 255);
          constrain(g, 0, 255);
          constrain(b, 0, 255);
        }//if pixels are near the raindrop location
      }//for raindrop array
//doing the same thing for the solo glowing orb
        xPos = myGlow.getXGlow();
        yPos = myGlow.getYGlow();
        float maxdist = myGlow.getSize();//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
        if (d <= 2.5*maxdist) {
          r = 100*r;
          g = 120*g;
          b = 250*b;
          float adjustbrightness = 255*(maxdist-d)/maxdist;
          r += adjustbrightness;
          g += adjustbrightness;
          b += adjustbrightness;
          constrain(r, 0, 255);
          constrain(g, 0, 255);
          constrain(b, 0, 255);
        }
// Make a new color and set pixel in the window; the 0.7*g and 0.3*b give it a golden tint
      color c = color(r, 0.7*g, 0.3*b);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}