/*
  6/25/2016
  Emily Meuer
  
  Modification of MRA's AmpAcrossScreenBall_SpeedChanges_v2,
  intended to use pitch rather than amplitude to control y val of each ball.
*/

import ddf.minim.*;
//Minim minim;
//AudioInput in;  
Input  in;
float amplify = 200;
//float speed = 500;
float speed = 1;
LeadBall myLeadBall;

//ARRAY OBJECTS STEP 1 (next three lines)
Ball[] myBall;
//how many balls across the screen
int balls = 30;

void setup(){
  size(500,500);
//  minim = new Minim(this);
//  in = minim.getLineIn();
  in = new Input();
  myLeadBall = new LeadBall();
//ARRAY OBJECTS STEPS 2 and 3 (myBall and for loop)
  myBall = new Ball[balls];
  //staggered starts for each of the balls
  for(int i = 0; i < balls; i++) {
    myBall[i] = new Ball(i);
  }//for
}//setup

void draw(){
  background(0);
  myLeadBall.move();
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move();
  }//for
  println("in.getAdjustedFundAsHz(): " + in.getAdjustedFundAsHz());
}//draw

class LeadBall {
  float xLead;
  float yLead;
  LeadBall() {
    xLead = width;
    yLead = height*0.9;
  }
  void move (){
    xLead = xLead - speed*in.getAmplitude()*amplify;
//    xLead = xLead - in.getAdjustedFundAsHz()/10;
//    println("xLead = " + xLead + "; yLead = " + yLead);
  if (xLead < 0){
//      yLead = height*0.9-in.getAdjustedFundAsHz();
      yLead = (height * 0.9) - in.getAdjustedFundAsHz();
      println("  set yLead to " + yLead);
      xLead = width;
    }//if x<0
  fill(200,100,200);
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
        if ((x < 1) && (x > -1)) {
//        y = height*0.9-in.getAdjustedFundAsHz();
          y = in.getAdjustedFundAsHz();
        println("  y = " + y);
        }
    }
  }//move
}//Ball