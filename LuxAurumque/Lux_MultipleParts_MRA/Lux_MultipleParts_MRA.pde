/*
  05/31/2016
  MRA
  Lux Aurumque
    - testing with multiple mp3 inputs 
    - DOESN'T WORK YET.... plays the music though!
*/

import ddf.minim.analysis.*;
import ddf.minim.*;
PImage  img;
Minim       minim1;
AudioPlayer player1;
Minim       minim2;
AudioPlayer player2;
Minim       minim3;
AudioPlayer player3;
Minim       minim4;
AudioPlayer player4;

void setup()
{
  size(480, 357);
  img = loadImage("NativityTriptych.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  minim1 = new Minim(this);
  player1 = minim1.loadFile("Lux 1.mp3");  
  minim2 = new Minim(this);
  player2 = minim1.loadFile("Lux 2.mp3");  
  minim3 = new Minim(this);
  player3 = minim1.loadFile("Lux 3.mp3");  
  minim4 = new Minim(this);
  player4 = minim1.loadFile("Lux 4.mp3");  
}//setup

void draw()
{
  background(0);
  stroke(255);
  player1.play();
  player2.play();
  player3.play();
  player4.play();
  lightA();
  lightB();
  lightC();
  lightD();
}//draw

void lightA(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      float maxdist = 500*player1.mix.level();//dist(0,0,width,height);
      float d = dist(x, y, 200, 100);
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
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}//lightA

void lightB(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      float maxdist = 500*player2.mix.level();//dist(0,0,width,height);
      float d = dist(x, y, 300, 100);
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
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}//LightB

void lightC(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      float maxdist = 500*player3.mix.level();//dist(0,0,width,height);
      float d = dist(x, y, 240, 200);
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
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}//LightC

void lightD(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      float maxdist = 500*player4.mix.level();//dist(0,0,width,height);
      float d = dist(x, y, 240, 50);
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
      pixels[y*width + x] = c;
    }//for y
  }//for x
  updatePixels();
}//LightD