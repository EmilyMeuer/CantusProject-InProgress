import ddf.minim.analysis.*;
import ddf.minim.*;

/*
  06/03/2016
 Emily Meuer
 
 Zikr
 Testing light that grows w/amplitude
 and reveals an image (mosque pattern).
 */

Input       input;
Minim       minim;
AudioPlayer player;
PImage  img;
float  amp, xloc, yloc, lightSize, frames;

void setup()
{
  size(783, 783);
  this.goldPattern();
  
  this.input  = new Input();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
//  loadPixels();
  this.minim = new Minim(this);
  this.player = minim.loadFile("Zikr.mp3", 1024);  
  frameRate(60);
  this.frames = 1;
}

void mousePressed()
  {
    if(mouseButton == LEFT)   {  this.goldPattern();  }
    if(mouseButton == RIGHT)  {  this.bluePattern();  }
  }

void draw()
{
  background(0);
  stroke(255);
  //this.player.play();
  pixelBrightness();
}

/**
  * Loads blue background pattern and set the light location 
  * to be in the bottom middle of the screen.
*/
void bluePattern()
{
  // dim: 640 * 480
  this.img  = loadImage("patternsBlueHalf.jpg");
  this.img.resize(783,783);
  this.img.loadPixels();
  
  this.xloc = this.img.width/2 - 2;
  this.yloc = this.img.height - 5;
  
  loadPixels();
} // bluePattern

void goldPattern()
{
  this.img = loadImage("patternsGold.jpg");
  this.img.loadPixels();
  this.img.resize(783,783);
  
  xloc = this.img.width/2 - 2;
  yloc = this.img.height/2 - 1;
  
  loadPixels();
} // goldPattern

void pixelBrightness()
{
  for (int x = 0; x < this.img.width; x++) {
    for (int y = 0; y < this.img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*this.img.width;
      // Get the R,G,B values from image
      float r, g, b;
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
      
      pixels[y*this.img.width + x] = c;
    }
  }
  updatePixels();
}

void amplitude() {
  if (frameCount == frames*5) 
  {
    //this.amp = player.mix.level();
    this.amp = this.input.getAmplitude();
    this.lightSize = Math.min(map(this.amp, 0, 20, 0, 80), 80);
    this.frames ++;
  }
} // amplitude