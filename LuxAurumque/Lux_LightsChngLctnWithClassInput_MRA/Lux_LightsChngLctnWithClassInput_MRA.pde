/*
  05/31/2016
  MRA
  Lux Aurumque
    - at "silence" light location moves to next coordinates in xpos and ypos arrays
    - light size based off amplitude   
*/

InputPitch musicInput;
PImage  img;
float  amp, xloc, yloc, lightSize, frames;
int i;
int [] arrxloc = {50,50,430,430,200,200};
int [] arryloc = {125,125,125,125,200,200};

void setup()
{
  size(480, 357);
  minim = new Minim(this);
  musicInput = new InputPitch("LuxAurumque.mp3");
  img = loadImage("NativityTriptych.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();  
  frameRate(60);
  frames = 1;
  xloc=50;
  yloc=50;
  i = 0;
}//setup

void draw()
{
  background(0);
  stroke(255);
  lightPos();
  pixelBrightnessRGB();
}//draw

void pixelBrightnessRGB()
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
      //PROBLEM LINES COMMENTED OUT BELOW
      //r = r*musicInput.getFundAsHz()/220;
      //g = g*musicInput.getFundAsHz()/300;
      b = 0.1*b;
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
}//pixelBrightnessRGB

void amplitude(){
  if (frameCount == frames*5) {
  amp = musicInput.getAmplitude();
  lightSize = amp*1000;
  frames ++;
  }//if
  else{
  }
}//amplitude

void lightPos(){
  //only runs every 5 ms
  if (millis() % 5 == 0){
    //if there is "silence" move to next coordinate in array
    if (amp <= 0.005){
      xloc = arrxloc[i];
      yloc = arryloc[i];
      i ++;
      delay(2000);
        //if at end of array brings back to start
        if(i == arrxloc.length){
          i=1;
        }
        else{
        }//if end of array
    }//if "silence"
    else{
    }
  }//if millis
  else{
  }  
}//lightPos