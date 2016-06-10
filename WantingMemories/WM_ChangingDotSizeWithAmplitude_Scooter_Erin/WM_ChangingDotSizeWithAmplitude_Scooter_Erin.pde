import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;


PImage img;
int smallPoint, largePoint;

Input name;


void setup() {
  
  fullScreen();
  name = new Input();
  img = loadImage("dad.jpg");//choice of picture
  img.resize(width,height);
  smallPoint = 1; //smallest dot size
  largePoint = 70;//largest dot size
  imageMode(CENTER);
  noStroke();
  smooth(); //sets background so things can fade away
  //background(255); //use if need be or want different background
  frameRate(30);
}

void draw() { 

 // fill(255,10); // semi-transparent white
  //rect(0, 0, width, height);
 // fill(random(255));
  //above part is for fading out

  //println(name.getAmplitude());

  float pointillize = map((30-(Math.min(name.getAmplitude(), 30))), 0, 30, smallPoint, largePoint);
  int x = int(random(img.width)); 
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
  //above is for pointillizing the image
}