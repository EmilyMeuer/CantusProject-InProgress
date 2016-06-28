/*
6/16/2016
Michaela Andrews
Bouncing amplitude ball - potential background for Daft Punk medly
  - no more disappearing balls! yay!
  - added color difference
*/

import ddf.minim.*;
Minim minim;
AudioInput in;  
float amplify = 2000;
float speed = 500;
LeadBall myLeadBall;

//ARRAY OBJECTS STEP 1 (next three lines)
Ball[] myBall;
//how many balls across the screen
int balls = 30;

void setup(){
  size(500,500);
  minim = new Minim(this);
  in = minim.getLineIn();
  myLeadBall = new LeadBall();
//ARRAY OBJECTS STEPS 2 and 3 (myBall and for loop)
  myBall = new Ball[balls];
  //staggared starts for each of the balls
  for(int i = 0; i < balls; i++) {
    myBall[i] = new Ball(i);
  }//for
}//setup

void draw(){
  background(0);
  myLeadBall.move(); //<>//
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move();
  }//for
}//draw

class LeadBall {
  float xLead;
  float yLead;
  LeadBall() {
    xLead = width;
    yLead = height*0.9;
  }
  void move (){
    xLead = xLead - speed*in.mix.level();
  if (xLead < 0){
      yLead = height*0.9-in.mix.level()*amplify;
      xLead = width;
    }//if x<0
  fill(200,100,200);
  println("xLead = " + xLead + "; yLead = " + yLead + "; speed*in.mix.level() = " + speed*in.mix.level());
  ellipse(xLead,yLead,10,10);
  }  
 float getXpos() {
  return xLead;
  }
}



//makes a ball y=amp that will move across the screen
//once across screen, ball goes back to "start" and receives a new y=amp
class Ball{
  float x;
  float y;
  float speed;
  int ballNumber;
  int c;
  Ball(int inBallNumber){
    ballNumber = inBallNumber;
    y = height*0.9;
    c = ballNumber*10;
    constrain(c,0,255);
  }
  void move(){
    fill(c,100,100);
    ellipse(x,y,10,10); 
    if (ballNumber != 0){
      x = (myLeadBall.getXpos() + ballNumber*width/balls) % width;
//      println("  x = " + x);
        if ((x < 1) && (x > -1)) {
        y = height*0.9-in.mix.level()*amplify;
        println("y = " + y);
        }
    }
  }//move
}//Ball