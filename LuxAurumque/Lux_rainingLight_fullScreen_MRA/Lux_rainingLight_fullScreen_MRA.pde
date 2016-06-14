/*
  Started: 05/31/2016
  Last updated: 06/14/2016
  MRA
  Lux Aurumque
    - Raining Light - Amanda's idea
    - For some reason this fullScreen version is much slower than the small version...
*/

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim  minim;

//Minim       minim;
AudioPlayer player;
PImage  nativity;
Raindrop myRaindrop[];
int raindrops = 8;
int xStart = 100;

void setup()
{
  fullScreen();
  nativity = loadImage("NativityTriptych.jpg");
  nativity.resize(width, height);
  image(nativity, 0, 0);
  nativity.loadPixels();
  loadPixels();
  minim = new Minim(this);
  player = minim.loadFile("LuxAurumque.mp3");  
  myRaindrop = new Raindrop[raindrops];
  for (int i = 0; i < myRaindrop.length; i++){
  myRaindrop[i] = new Raindrop(xStart);
  xStart += 200;
  }
}

void draw(){
  background(0);
  for (int i = 0; i < myRaindrop.length; i++){
  myRaindrop[i].fall();
  }
  rainfall();
}//draw



class Raindrop {
  float xDrop;
  float yDrop;
  float speed;
  float gravity;
  
//Constructor with input variable
  Raindrop(float inputXDrop){
    xDrop = inputXDrop;
    yDrop = 0;
    speed = 0;
    gravity = 0.5;
  }
//What it can do - fall
  void fall() {
    yDrop = yDrop + speed;
    speed = speed + gravity;
    if (yDrop>height){
      speed = speed * -0.5;
      yDrop = height;
    }
  }//void fall
  float getXDrop(){
    return xDrop;
  }
  float getYDrop(){
    return yDrop;
  }
}//class Raindrop

void rainfall() {
  float xPos, yPos;
  for (int x = 0; x < nativity.width; x++) {
    for (int y = 0; y < nativity.height; y++ ) {
// Calculate the 1D location from a 2D grid
      int loc = x + y*nativity.width;
// Get the R,G,B values from image
      float r,g,b;
      r = red (nativity.pixels[loc]);
      g = green (nativity.pixels[loc]);
      b = blue (nativity.pixels[loc]);
      r = 0.01*r;
      g = 0.01*g;
      b = 0.01*b;
//GLOWING ORBS - uses position of raindrops to determine location of glow
      for (int i = 0; i < myRaindrop.length; i++){
        xPos = myRaindrop[i].getXDrop();
        yPos = myRaindrop[i].getYDrop();
        float maxdist = 50;//dist(0,0,width,height);
        float d = dist(x, y, xPos, yPos);
        if (d <= 2*maxdist) {
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
        }
      }//for raindrop array
// Make a new color and set pixel in the window
      color c = color(r, 0.7*g, 0.3*b);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}