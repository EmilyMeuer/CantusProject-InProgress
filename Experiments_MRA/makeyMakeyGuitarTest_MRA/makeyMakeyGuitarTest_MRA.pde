/*
  06/27/2016
  Michaela Andrews
  Seeing if I can get makey makey to work with a steel stringed guitar
  Problem: Processing recognizes if a key on the actual keyboard is pressed,
    but doesn't regognize the makey makey letters (I tried caps and lowercase)

*/

void setup(){
  size(750, 500);
}

void draw(){
  background(0);
  if (key == 'W'){
    ellipse(width*6/7, height*6/7, 20, 20);
  }
  if (key == 'A'){
    ellipse(width*5/7, height*5/7, 20, 20);
  }
  if (key == 'S'){
    ellipse(width*4/7, height*4/7, 20, 20);
  }
  if (key == 'D'){
    ellipse(width*3/7, height*3/7, 20, 20);
  }
  if (key == 'F'){
    ellipse(width*2/7, height*2/7, 20, 20);
  }
  if (key == 'G'){
    ellipse(width*1/7, height*1/7, 20, 20);
  }
}