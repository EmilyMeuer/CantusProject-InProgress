/*
  05/31/2016
  MRA
  Lux Aurumque
    - I want to add some sort of fade/delay/trail behind the light motion
    - Another idea: "heavy light" along the bottom
        - can bet bottom light to work if orb is commented out
*/

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer player;
PImage  img;
float  xloc, yloc, amp, frames;

void setup()
{
  size(480, 357);
  img = loadImage("NativityTriptych.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  minim = new Minim(this);
  player = minim.loadFile("LuxAurumque.mp3", 1024);  
  frameRate(60);
  frames = 1;
}

void draw()
{
  background(0);
  stroke(255);
  player.play();
  pixelBrightness();
}

void pixelBrightness()
{
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
    //GLOWING ORB
      ampLocation();
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, xloc, yloc);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      float maxdist2 = 750*amp;//dist(0,0,width,height);
      float d2 = dist(x, y, x, img.height);
      float adjustbrightness2 = 150*((maxdist2-d2)*maxdist2)/(maxdist2*maxdist2);
      r += adjustbrightness2;
      g += adjustbrightness2;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}//pixelBrightness

void ampLocation(){
  if (frameCount == frames*5) {
  amp = player.mix.level();
  xloc = amp*10000;
  yloc = amp*5000;
  xloc = constrain(xloc, 0, 480);
  yloc = constrain(yloc, 0, 300);
  frames ++;
  }
  else{
  }
}