/*
6/8/2016
Michaela Andrews
Bouncing amplitude ball - potential background for Daft Punk medly
Things to add: color changes??
*/

import ddf.minim.*;

Minim minim;
AudioInput in;
Ball myBall1;
Ball myBall2;
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball myBall6;
Ball myBall7;
Ball myBall8;
Ball myBall9;
Ball myBall10;
Ball myBall11;
Ball myBall12;
Ball myBall13;
Ball myBall14;
Ball myBall15;
Ball myBall16;
Ball myBall17;
Ball myBall18;
Ball myBall19;
Ball myBall20;
Ball myBall21;
Ball myBall22;
Ball myBall23;
Ball myBall24;
Ball myBall25;
Ball myBall26;
Ball myBall27;
Ball myBall28;
Ball myBall29;
Ball myBall30;

void setup(){
  size(500,500);
  minim = new Minim(this);
  in = minim.getLineIn();
  //staggared starts for each of the balls
  int balls = 30;
  myBall1 = new Ball(0*width/balls);
  myBall2 = new Ball(1*width/balls);
  myBall3 = new Ball(2*width/balls);
  myBall4 = new Ball(3*width/balls);
  myBall5 = new Ball(4*width/balls);
  myBall6 = new Ball(5*width/balls);
  myBall7 = new Ball(6*width/balls);
  myBall8 = new Ball(7*width/balls);
  myBall9 = new Ball(8*width/balls);
  myBall10 = new Ball(9*width/balls);
  myBall11 = new Ball(10*width/balls);
  myBall12 = new Ball(11*width/balls);
  myBall13 = new Ball(12*width/balls);
  myBall14 = new Ball(13*width/balls);
  myBall15 = new Ball(14*width/balls);
  myBall16 = new Ball(15*width/balls);
  myBall17 = new Ball(16*width/balls);
  myBall18 = new Ball(17*width/balls);
  myBall19 = new Ball(18*width/balls);
  myBall20 = new Ball(19*width/balls);
  myBall21 = new Ball(20*width/balls);
  myBall22 = new Ball(21*width/balls);
  myBall23 = new Ball(22*width/balls);
  myBall24 = new Ball(23*width/balls);
  myBall25 = new Ball(24*width/balls);
  myBall26 = new Ball(25*width/balls);
  myBall27 = new Ball(26*width/balls);
  myBall28 = new Ball(27*width/balls);
  myBall29 = new Ball(28*width/balls);
  myBall30 = new Ball(29*width/balls);
}

void draw(){
  background(0);
  myBall1.move();
  myBall2.move();
  myBall3.move();
  myBall4.move();
  myBall5.move();
  myBall6.move();
  myBall7.move();
  myBall8.move();
  myBall9.move();
  myBall10.move();
  myBall11.move();
  myBall12.move();
  myBall13.move();
  myBall14.move();
  myBall15.move();
  myBall16.move();
  myBall17.move();
  myBall18.move();
  myBall19.move();
  myBall20.move();
  myBall21.move();
  myBall22.move();
  myBall23.move();
  myBall24.move();
  myBall25.move();
  myBall26.move();
  myBall27.move();
  myBall28.move();
  myBall29.move();
  myBall30.move();
}

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
    speed = 5;
  }
  void move(){
    fill(200,100,200);
    ellipse(x,y,10,10); 
    x=x-speed;
    if (x<0){
      y = height-50-in.mix.level()*amplify;
      x = width;
    }//if x<0
  }//move
}//Ball