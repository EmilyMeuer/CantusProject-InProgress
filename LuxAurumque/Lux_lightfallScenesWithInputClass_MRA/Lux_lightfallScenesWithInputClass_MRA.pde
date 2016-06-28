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

Input  myInput1;
Input  myInput2;
Input  myInput3;
Input  myInput4;
MultipleInputs  mInputs;
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
  mInputs = new MultipleInputs(new String[] { "Lux 1.mp3", "Lux 2.mp3", "Lux 3.mp3", "Lux 4.mp3"});
  myRaindrop = new Raindrop[raindrops];
  myRaindrop[0] = new Raindrop(random(360));
  myRaindrop[1] = new Raindrop(random(360));
  myRaindrop[2] = new Raindrop(random(360));
  myRaindrop[3] = new Raindrop(random(360));
  myRaindrop[4] = new Raindrop(random(360));
  myRaindrop[5] = new Raindrop(random(360));
  myGlow = new Glow[orbs];
  myGlow[0] = new Glow();
}

void draw(){
  background(0);
  myInput1 = mInputs.get(0);
  myInput2 = mInputs.get(1);
  myInput3 = mInputs.get(2);
  myInput4 = mInputs.get(3);
  lightfall();
  if (keyPressed){
     scene ++;
     delay(500);
     println(scene);
   }
  if (scene == 1){
    if (myInput2.getAmplitude() > 0.01){
      myRaindrop[0].fall();
      myRaindrop[3].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myRaindrop[0].resetYDrop();
      myRaindrop[3].resetYDrop();
    }
    if (myInput3.getAmplitude() > 0.01){
      myRaindrop[1].fall();
      myRaindrop[4].fall();
    }
    if (myInput2.getAmplitude() < 0.01){
      myRaindrop[1].resetYDrop();
      myRaindrop[4].resetYDrop();
    }
    if (myInput4.getAmplitude() > 0.01){
      myRaindrop[2].fall();
      myRaindrop[5].fall();
    }
    if (myInput4.getAmplitude() < 0.01){
      myRaindrop[2].resetYDrop();
      myRaindrop[5].resetYDrop();
    }
    myGlow[0].angels(myInput1.getAdjustedFundAsHz(), myInput1.getAmplitude());
  }//scene 1
  if (scene == 2) {
    myRaindrop[0].hover(myInput2.getAdjustedFundAsHz(), myInput2.getAmplitude());
    myRaindrop[3].hover(myInput2.getAdjustedFundAsHz(), myInput2.getAmplitude());
    myRaindrop[1].hover(myInput3.getAdjustedFundAsHz(), myInput3.getAmplitude());
    myRaindrop[4].hover(myInput3.getAdjustedFundAsHz(), myInput3.getAmplitude());
    myRaindrop[2].hover(myInput4.getAdjustedFundAsHz(), myInput4.getAmplitude());
    myRaindrop[5].hover(myInput4.getAdjustedFundAsHz(), myInput4.getAmplitude());
    myGlow[0].nativity(myInput1.getAmplitude());
  }//scene 2
  if (scene == 3) {
    pushMatrix();
    translate(width/2, height/2);
    ellipse(0,0,20,20);
    myRaindrop[0].circle(myInput2.getAmplitude());
    myRaindrop[1].circle(myInput2.getAmplitude());
    myRaindrop[2].circle(myInput3.getAmplitude());
    myRaindrop[3].circle(myInput3.getAmplitude());
    myRaindrop[4].circle(myInput4.getAmplitude());
    myRaindrop[5].circle(myInput4.getAmplitude());   
    popMatrix();
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
        float maxdist = myRaindrop[i].getSize()/1.5;//dist(0,0,width,height);
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
        float maxdist = myGlow[i].getSize()*1.5;//dist(0,0,width,height);
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