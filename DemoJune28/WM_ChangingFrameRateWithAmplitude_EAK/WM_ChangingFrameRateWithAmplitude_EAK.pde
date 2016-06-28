import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;


PImage img;
int smallPoint, largePoint;
float loudness;
float adjLoudness;

InputPitch name;


void setup() {

  name = new InputPitch();
  img = loadImage("dad.jpg");//choice of picture
  img.resize(width, height);
  smallPoint = 10; //smallest dot size
  largePoint = 10;//largest dot size
  imageMode(CENTER);
  noStroke();
  smooth(); //sets background so things can fade away
  //background(255); //use if need be or want different background
}

void draw() { 

  //setting "loudness" to be a bigger number so it's easier to deal with
  loudness = name.getAmplitude();
  adjLoudness = loudness*1000;
  println(adjLoudness);

/*
  if(adjLoudness > 70)  {
    frameRate(30);
  }  else if(adjLoudness > 50) {
    frameRate(25);
  } else if(adjLoudness > 40) {
    frameRate(20);
  } else if(adjLoudness > 30) {
    frameRate(15);
  } else if(adjLoudness > 20) {
    frameRate(10);
  } else if(adjLoudness > 10) {
    frameRate(5);
  } else if(adjLoudness > 5) {
    frameRate(1);
  }
*/
  frameRate(Math.min(adjLoudness / 2, 30));
  
  /*
  //fading out ... use if need be 
  fill(255, 10); // semi-transparent white
   rect(0, 0, width, height);
   fill(random(255));
   */

  //pointillizing the image
  float pointillize = map((30-(Math.min(adjLoudness, 30))), 0, 30, smallPoint, largePoint);
  int x = int(random(img.width)); 
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);

  
}