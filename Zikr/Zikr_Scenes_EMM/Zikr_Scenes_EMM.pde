/*
  06/29/2016
  Emily Meuer
  
  Zikr Scenes: Compilation of rosettes and Game of Life, in one sketch,
  to be cycled through on (mousePressed/keyPressed).
  
  ** Which key triggers keyPressed?
  
*/

Scene  drawRosette;
Input  leftInput;

int  scene;
int  waitUntil;

void setup()
{
  background(0);
  leftInput  = new Input(true, false);
  
  drawRosette  = new DrawRosette(leftInput);
  
  scene = 0;
  waitUntil  = millis();
} // setup()

void draw()
{
  
  if(mousePressed && millis() > waitUntil)  
  {  
    waitUntil  = millis() + 300;
    scene++;  
  }

  println("scene = " + scene); 
  
  if(scene == 1) {
    drawRosette.run();
  } // scene 1
} //draw()