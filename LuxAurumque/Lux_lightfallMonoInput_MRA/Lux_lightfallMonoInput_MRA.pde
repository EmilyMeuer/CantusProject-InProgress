/*
  Started: 05/31/2016
  Last updated: 06/16/2016
  MRA
  Lux Aurumque
    - Raining Light - Amanda's idea
    - press a key to change to next scene (only 2 right now)
    - this is set to typical projector resolution (1024 x 768)
    - Scene 3 is a work in progress
*/

Input  myInput;
PImage  img;
Raindrop myRaindrop[];
int raindrops = 6;
//int arrayPos = 0;
Glow myGlow[];
int orbs = 1;
int scene = 1;

void setup()
{
  img = loadImage("NativityTriptych.jpg");
  img.resize(width, height);
  img.loadPixels();
  loadPixels(); 
  myInput = new Input();
  myRaindrop = new Raindrop[raindrops];
  myRaindrop[0] = new Raindrop();
  myRaindrop[1] = new Raindrop();
  myRaindrop[2] = new Raindrop();
  myRaindrop[3] = new Raindrop();
  myRaindrop[4] = new Raindrop();
  myRaindrop[5] = new Raindrop();
  myGlow = new Glow[orbs];
  myGlow[0] = new Glow();
}

void draw(){
  background(0);
  lightfall();
  if (keyPressed){
     scene ++;
     delay(500);
     println(scene);
   }
  if (scene == 1){
    if (myInput.getAmplitude() > 0.01){
      myRaindrop[0].fall();
      myRaindrop[3].fall();
    }
    if (myInput.getAmplitude() < 0.01){
      myRaindrop[0].resetYDrop();
      myRaindrop[3].resetYDrop();
    }
    if (myInput.getAmplitude() > 0.01){
      myRaindrop[1].fall();
      myRaindrop[4].fall();
    }
    if (myInput.getAmplitude() < 0.01){
      myRaindrop[1].resetYDrop();
      myRaindrop[4].resetYDrop();
    }
    if (myInput.getAmplitude() > 0.01){
      myRaindrop[2].fall();
      myRaindrop[5].fall();
    }
    if (myInput.getAmplitude() < 0.01){
      myRaindrop[2].resetYDrop();
      myRaindrop[5].resetYDrop();
    }
    myGlow[0].angels(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
  }//scene 1
  if (scene == 2) {
    myRaindrop[0].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myRaindrop[3].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myRaindrop[1].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myRaindrop[4].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myRaindrop[2].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myRaindrop[5].hover(myInput.getAdjustedFundAsHz(), myInput.getAmplitude());
    myGlow[0].nativity(myInput.getAmplitude());
  }//scene 2
  if (scene == 3) {
    myRaindrop[0].circle(myInput.getAmplitude());
    myRaindrop[1].circle(myInput.getAmplitude());
    myRaindrop[2].circle(myInput.getAmplitude());
    myRaindrop[3].circle(myInput.getAmplitude());
    myRaindrop[4].circle(myInput.getAmplitude());
    myRaindrop[5].circle(myInput.getAmplitude());   
  }
}//draw


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
      r = 0.01*r; //"hiding" the color of each pixel so that they appear black unless brightened
      g = 0.01*g;
      b = 0.01*b;
//uses position of raindrops to determine location of glow
      for (int i = 0; i < myRaindrop.length; i++){  //gets the position of each of the raindrops, and adjusts the pixels near it
        xPos = myRaindrop[i].getXDrop();
        yPos = myRaindrop[i].getYDrop();
        float maxdist = myRaindrop[i].getSize();//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
        if (d <= 2*maxdist) {//the below if statement makes it so that only the pixels near the location of the raindrop are adjusted (otherwise it would "neutralizes" the color, getting rid of the picture)
          if (r < 5 && g < 5 && b < 5){ //temporary fix for raindrops on top of each other
            r = myRaindrop[i].getRTint()*r;  //"unhiding" the color of the pixels
            g = myRaindrop[i].getGTint()*g;
            b = myRaindrop[i].getBTint()*b;
            float adjustbrightness = 255*(maxdist-d)/maxdist;
            r += adjustbrightness;
            g += adjustbrightness;
            b += adjustbrightness;
            constrain(r, 0, 255);
            constrain(g, 0, 255);
            constrain(b, 0, 255);
          }
        }//if pixels are near the raindrop location
      }//for raindrop array
//doing the same thing for the glowing orbs
      for (int i = 0; i < myGlow.length; i++){
        xPos = myGlow[i].getXGlow();
        yPos = myGlow[i].getYGlow();
        float maxdist = myGlow[i].getSize();//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
        if (d <= 2*maxdist) {
          if (r < 5 && g < 5 && b < 5){
            r = myGlow[i].getRTint()*r;
            g = myGlow[i].getGTint()*g;
            b = myGlow[i].getBTint()*b;
            float adjustbrightness = 255*(maxdist-d)/maxdist;
            r += adjustbrightness;
            g += adjustbrightness;
            b += adjustbrightness;
            constrain(r, 0, 255);
            constrain(g, 0, 255);
            constrain(b, 0, 255);
          }
        }
      }//for glowing orb array
// Make a new color and set pixel in the window; the 0.7*g and 0.3*b give it a golden tint
      color c = color(r, g, b);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}