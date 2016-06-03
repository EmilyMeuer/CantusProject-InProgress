/*
  05/31/2016
  MRA
  Lux Aurumque - test 1
*/

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer player;
PImage  img;
float  amp, xloc, yloc, lightSize, frames;

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
  xloc = 50;
  yloc = 50;
}

void draw()
{
  background(0);
  stroke(255);
  player.play();
  pixelBrightness();
  lightPos();
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
      // Calculate an amount to change brightness based on proximity to the mouse
      amplitude();
      float maxdist = lightSize;//dist(0,0,width,height);
      float d = dist(x, y, xloc, yloc);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      //color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}

void amplitude(){
  if (frameCount == frames*5) {
  amp = player.mix.level();
  lightSize = amp*1000;
  frames ++;
  }
  else{
  }
}

void lightPos(){
  if (millis() % 10 == 0){
    if (amp <= 0.01){
      xloc += 5;
      yloc += 10;
    }
    else{
    }
  }
  else{
  }  
  xloc = constrain(xloc, 0, 480);
  yloc = constrain(yloc, 0, 357);
}