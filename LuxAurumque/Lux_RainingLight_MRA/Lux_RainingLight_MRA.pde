/*
  05/31/2016
  MRA
  Lux Aurumque
    - Raining Light - Amanda's idea
*/

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim  minim;

//Minim       minim;
AudioPlayer player;
PImage  img;
Raindrop myRaindrop1;
Raindrop myRaindrop2;
Raindrop myRaindrop3;
Raindrop myRaindrop4;
Raindrop myRaindrop5;
Raindrop myRaindrop6;
Raindrop myRaindrop7;
Raindrop myRaindrop8;

void setup()
{
  size(480, 357);
  minim = new Minim(this);
  player = minim.loadFile("LuxAurumque.mp3", 1024);  
  myRaindrop1 = new Raindrop(100);
  myRaindrop2 = new Raindrop(300);
  //myRaindrop3 = new Raindrop();
  //myRaindrop4 = new Raindrop();
  //myRaindrop5 = new Raindrop();
  //myRaindrop6 = new Raindrop();
  //myRaindrop7 = new Raindrop();
  //myRaindrop8 = new Raindrop();
}

void draw(){
  background(0);
  myRaindrop1.fall();
  myRaindrop2.fall();
  //myRaindrop3.fall();
  //myRaindrop4.fall();
  //myRaindrop5.fall();
  //myRaindrop6.fall();
  //myRaindrop7.fall();
  //myRaindrop8.fall();
}

class Raindrop {
  float xDrop;
  float yDrop;
  float speed;
  float gravity;
  
  //Constructor with input variable
  Raindrop(float inputXDrop){
    img = loadImage("NativityTriptych.jpg");
    img.loadPixels();
    loadPixels();
    xDrop = inputXDrop;
    yDrop = 0;
    speed = 0;
    gravity = 0.05;
  }
  //What it can do - fall
  void fall() {
    yDrop = yDrop + speed;
    speed = speed + gravity;
    if (yDrop>height){
      speed = speed * -0.5;
      yDrop = height;
    }
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
        float maxdist = 10;//dist(0,0,width,height);
        float d = dist(x, y, xDrop, yDrop);
        float adjustbrightness = 255*(maxdist-d)/maxdist;
        r += adjustbrightness;
        g += adjustbrightness;
        b += adjustbrightness;
        // Make a new color and set pixel in the window
        color c = color(r, 0.7*g, 0.3*b);
        pixels[y*width + x] = c;
      }//for y
    }//for x
    updatePixels();
  }//void fall
}//class Raindrop