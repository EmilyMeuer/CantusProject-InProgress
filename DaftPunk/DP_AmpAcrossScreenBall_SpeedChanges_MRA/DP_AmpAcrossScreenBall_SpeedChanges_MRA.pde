/*
6/8/2016
Michaela Andrews
Bouncing amplitude ball - potential background for Daft Punk medly
Things to add: color changes??
*/

import ddf.minim.*;
Minim minim;
AudioInput in;

//ARRAY OBJECTS STEP 1 (next three lines)
Ball[] myBall;
//how many balls across the screen
int balls = 50;
float ampSpeed=0;

void setup(){
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn();
//ARRAY OBJECTS STEPS 2 and 3 (myBall and for loop)
  myBall = new Ball[balls];
  //staggared starts for each of the balls
  for(int i = 0; i < balls; i++) {
    myBall[i] = new Ball(i * width/balls);
  }//for
}//setup

void draw(){
  background(0);
  ampSpeed = 500*in.mix.level();
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move(ampSpeed);
  }//for
}//draw



//makes a ball y=amp that will move across the screen
//once across screen, ball goes back to "start" and receives a new y=amp
class Ball{
  float amplify;
  float x;
  float y;
  float speed;
  Ball(float tempX){
    amplify = 1500;
    y = height-50;
    x = tempX;
  }
  void move(float inSpeed){
    fill(200,100,200);
    ellipse(x,y,20,20); 
    speed = inSpeed;
    x=x-speed;
    if (x<0){
      y = height-50-in.mix.level()*amplify;
      x = width;
    }//if x<0
  }//move
}//Ball