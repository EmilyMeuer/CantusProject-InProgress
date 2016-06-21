/*
6/20/2016
Michaela Andrews
Seeing if L and R can be turned into two separate inputs through re-wiring (see below)
Materials: microphones (2)
           male to male audio cable (1)
           alligator clip cords (3)

---------|______,___,
_________|------'---'
ground     right   left
(sleeve)   (ring)  (tip)

Mic 1 ground to Input ground
Mic 2 ground to Input ground
Mic 1 right  to Input right
Mic 2 right  to Input left

***This only works if the microphone input on the computer is a stereo input
    (some computers only have a mono input for the microphone input)
    Typically, the audio ports are:  Green = L/R Line Out
                                     Blue  = L/R Line In
                                     Pink  = Mic In (might be mono and not stereo)
*/

import ddf.minim.*;

Minim minim;
AudioInput in;

//ARRAY OBJECTS STEP 1 (next three lines)
RightBall[] myBall;
LeftBall[] myBall2;
//how many balls across the screen
int balls = 30;

void setup(){
  size(500,500);
  minim = new Minim(this);
  in = minim.getLineIn();
  //staggared starts for each of the balls
  int balls = 30;
//ARRAY OBJECTS STEPS 2 and 3 (myBall and for loop)
  myBall = new RightBall[balls];
  //staggared starts for each of the balls
  for(int i = 0; i < balls; i++) {
    myBall[i] = new RightBall(i * width/balls);
  }//for
  myBall2 = new LeftBall[balls];
  //staggared starts for each of the balls
  for(int i = 0; i < balls; i++) {
    myBall2[i] = new LeftBall(i * width/balls);
  }//for
}

void draw(){
  background(0);
//ARRAY OBJECTS STEP 4 (for loop)
  for(int i = 0; i < myBall.length; i++) {
    myBall[i].move();
  }//for
  for(int i = 0; i < myBall.length; i++) {
    myBall2[i].move();
  }//for
}

//makes a ball y=amp that will move across the screen
//once across screen, ball goes back to "start" and receives a new y=amp
class RightBall{
  float amplify;
  float x;
  float y;
  float speed;
  RightBall(float tempX){
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
      y = height-50-in.right.level()*amplify;
      x = width;
    }//if x<0
  }//move
}//RightBall

class LeftBall{
  float amplify;
  float x;
  float y;
  float speed;
  LeftBall(float tempX){
    amplify = 1500;
    y = height-250;
    x = tempX;
    speed = 5;
  }
  void move(){
    fill(100,200,200);
    ellipse(x,y,10,10); 
    x=x-speed;
    if (x<0){
      y = height-250-in.left.level()*amplify;
      x = width;
    }//if x<0
  }//move
}//LeftBall