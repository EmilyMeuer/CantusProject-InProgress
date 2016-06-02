/*
int y;

void setup() {
  background(255);
  fullScreen();
}

void draw() {
background(255);
  if (mousePressed) {

    y=0;
  } 
  else {
    y=1;
  }

  if (y == 0){
  
    fill(0);
    noStroke();
    ellipse(mouseX,mouseY,50,50);
  }
  
}*/



void setup(){
  fullScreen();
  background(255);  
}

void draw(){
  background(255);
  int previousX = mouseX - 20;
  //int currentX = mouseX;
  int previousY = mouseY - 20;
  //int currentY = mouseY;
  
  
  
  noStroke();
  fill(0);
  ellipse (previousX, previousY,50,50);
 
 
  
  
  
}