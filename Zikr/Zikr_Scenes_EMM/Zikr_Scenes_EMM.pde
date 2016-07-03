/*
  06/29/2016
  Emily Meuer
  
  Zikr Scenes: Compilation of rosettes and Game of Life, in one sketch,
  to be cycled through on (mousePressed/keyPressed).
  
  ** Which key triggers keyPressed?
  
*/

Scene  drawRosette;
Scene  rosetteV3Colors;
Scene  rosetteV3Rotate;

Input  inputs;

int  scene;
int  waitUntil;

void setup()
{
  fullScreen();
  background(0);
  
  inputs     = new Input(4);
  
  drawRosette      = new DrawRosette(inputs);
  rosetteV3Colors  = new RosetteV3Colors(inputs, 3);
  rosetteV3Rotate  = new RosetteV3Rotate(inputs, 3);
  
  scene = 1;
  waitUntil  = millis();
} // setup()

void draw()
{
  
  if(mousePressed && millis() > waitUntil)  
  {  
    waitUntil  = millis() + 300;
    scene++;  
  }

//  println("scene = " + scene); 
  
  if(scene == 1) {
    drawRosette.run();
  } // scene 1
  
  if(scene == 2) {
    rosetteV3Colors.run();
  } // scene 2
  
  if(scene == 3) {
    rosetteV3Rotate.run();
  } // scene 2
} //draw()