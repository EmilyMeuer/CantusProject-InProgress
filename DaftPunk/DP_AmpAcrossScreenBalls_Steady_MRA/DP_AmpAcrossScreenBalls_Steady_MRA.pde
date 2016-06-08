/*
6/8/2016
Michaela Andrews
Bouncing amplitude ball - potential background for Daft Punk medly
Things to add: color changes??
*/

import ddf.minim.*;

Minim minim;
AudioInput in;
float x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20;
float y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20;
float step, balls, amplify;

void setup(){
  size(500,500);
  minim = new Minim(this);
  in = minim.getLineIn();
  //number of balls (used for equal spacing)
  balls = 20;
  //how sensitive the height is to amplitude
  amplify = 10000;
  //staggared starts for each of the balls
  x1 = width;
  x2 = width-width/balls;
  x3 = width-2*width/balls;
  x4 = width-3*width/balls;
  x5 = width-4*width/balls;
  x6 = width-5*width/balls;
  x7 = width-6*width/balls;
  x8 = width-7*width/balls;
  x9 = width-8*width/balls;
  x10 = width-9*width/balls;
  x11 = width-10*width/balls;
  x12 = width-11*width/balls;
  x13 = width-12*width/balls;
  x14 = width-13*width/balls;
  x15 = width-14*width/balls;
  x16 = width-15*width/balls;
  x17 = width-16*width/balls;
  x18 = width-17*width/balls;
  x19 = width-18*width/balls;
  x20 = width-19*width/balls;
  y1 = y2 = y3 = y4 = y5 = y6 = y7 = y8 = y9 = y10 = height-50;
  y11 = y12 = y13 = y14 = y15 = y16 = y17 = y18 = y19 = y20 = height-50;
}

void draw(){
  background(0);
  step = 5; //screen size must be divisible by this because conditional below is if x==0
  ball1();
  ball2();
  ball3();
  ball4();
  ball5();
  ball6();
  ball7();
  ball8();
  ball9();
  ball10();
  ball11();
  ball12();
  ball13();
  ball14();
  ball15();
  ball16();
  ball17();
  ball18();
  ball19();
  ball20();
}

//makes a ball y=amp that will move across the screen
//once across screen, ball goes back to "start" and receives a new y=amp
void ball1(){
  fill(200,100,200);
  ellipse(x1,y1,10,10); 
  x1=x1-step;
  if (x1==0){
    y1 = height-50-in.mix.level()*amplify;
    x1 = width;
  }//if x==0
}//ball

void ball2(){
  fill(200,100,200);
  ellipse(x2,y2,10,10); 
  x2 = x2-step;
  if (x2==0){
    y2 = height-50-in.mix.level()*amplify;
    x2 = width;
  }//if x==0
}

void ball3(){
  fill(200,100,200);
  ellipse(x3,y3,10,10); 
  x3 = x3-step;
  if (x3==0){
    y3 = height-50-in.mix.level()*amplify;
    x3 = width;
  }//if x==0
}

void ball4(){
  fill(200,100,200);
  ellipse(x4,y4,10,10); 
  x4 = x4-step;
  if (x4==0){
    y4 = height-50-in.mix.level()*amplify;
    x4 = width;
  }//if x==0
}

void ball5(){
  fill(200,100,200);
  ellipse(x5,y5,10,10); 
  x5 = x5-step;
  if (x5==0){
    y5 = height-50-in.mix.level()*amplify;
    x5 = width;
  }//if x==0
}

void ball6(){
  fill(200,100,200);
  ellipse(x6,y6,10,10); 
  x6 = x6-step;
  if (x6==0){
    y6 = height-50-in.mix.level()*amplify;
    x6 = width;
  }//if x==0
}

void ball7(){
  fill(200,100,200);
  ellipse(x7,y7,10,10); 
  x7 = x7-step;
  if (x7==0){
    y7 = height-50-in.mix.level()*amplify;
    x7 = width;
  }//if x==0
}

void ball8(){
  fill(200,100,200);
  ellipse(x8,y8,10,10); 
  x8 = x8-step;
  if (x8==0){
    y8 = height-50-in.mix.level()*amplify;
    x8 = width;
  }//if x==0
}

void ball9(){
  fill(200,100,200);
  ellipse(x9,y9,10,10); 
  x9 = x9-step;
  if (x9==0){
    y9 = height-50-in.mix.level()*amplify;
    x9 = width;
  }//if x==0
}

void ball10(){
  fill(200,100,200);
  ellipse(x10,y10,10,10); 
  x10 = x10-step;
  if (x10==0){
    y10 = height-50-in.mix.level()*amplify;
    x10 = width;
  }//if x==0
}

void ball11(){
  fill(200,100,200);
  ellipse(x11,y11,10,10); 
  x11 = x11-step;
  if (x11==0){
    y11 = height-50-in.mix.level()*amplify;
    x11 = width;
  }//if x==0
}

void ball12(){
  fill(200,100,200);
  ellipse(x12,y12,10,10); 
  x12 = x12-step;
  if (x12==0){
    y12 = height-50-in.mix.level()*amplify;
    x12 = width;
  }//if x==0
}

void ball13(){
  fill(200,100,200);
  ellipse(x13,y13,10,10); 
  x13 = x13-step;
  if (x13==0){
    y13 = height-50-in.mix.level()*amplify;
    x13 = width;
  }//if x==0
}

void ball14(){
  fill(200,100,200);
  ellipse(x14,y14,10,10); 
  x14 = x14-step;
  if (x14==0){
    y14 = height-50-in.mix.level()*amplify;
    x14 = width;
  }//if x==0
}

void ball15(){
  fill(200,100,200);
  ellipse(x15,y15,10,10); 
  x15 = x15-step;
  if (x15==0){
    y15 = height-50-in.mix.level()*amplify;
    x15 = width;
  }//if x==0
}

void ball16(){
  fill(200,100,200);
  ellipse(x16,y16,10,10); 
  x16 = x16-step;
  if (x16==0){
    y16 = height-50-in.mix.level()*amplify;
    x16 = width;
  }//if x==0
}

void ball17(){
  fill(200,100,200);
  ellipse(x17,y17,10,10); 
  x17 = x17-step;
  if (x17==0){
    y17 = height-50-in.mix.level()*amplify;
    x17 = width;
  }//if x==0
}

void ball18(){
  fill(200,100,200);
  ellipse(x18,y18,10,10); 
  x18 = x18-step;
  if (x18==0){
    y18 = height-50-in.mix.level()*amplify;
    x18 = width;
  }//if x==0
}

void ball19(){
  fill(200,100,200);
  ellipse(x19,y19,10,10); 
  x19 = x19-step;
  if (x19==0){
    y19 = height-50-in.mix.level()*amplify;
    x19 = width;
  }//if x==0
}

void ball20(){
  fill(200,100,200);
  ellipse(x20,y20,10,10); 
  x20 = x20-step;
  if (x20==0){
    y20 = height-50-in.mix.level()*amplify;
    x20 = width;
  }//if x==0
}