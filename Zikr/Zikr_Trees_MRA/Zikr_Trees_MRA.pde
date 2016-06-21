float theta;
float l = 60;

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  theta = radians(30);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  line(0,0,0,-l);
  branchA(l, color(200,0,0));
  branchB(l, color(0,0,200));
  branchB(l, color(0,200,200));
  branchB(l, color(200,0,200));
}

void branchA(float h, color c) {
  stroke(c);
  translate(0, -h);
  pushMatrix();   
  rotate(theta);
  line(0, 0, 0, -h);
  popMatrix();
  rotate(-theta);   
  line(0, 0, 0, -h);
}

void branchB(float h, color c) {
  stroke(c);
  pushMatrix();
  translate(0, -h);   
  rotate(theta);   
  line(0, 0, 0, -h);
  rotate(-2*theta);   
  line(0, 0, 0, -h);
  popMatrix();
  
  rotate(2*theta);
  translate(0, -h);   
  rotate(theta);   
  line(0, 0, 0, -h);
  rotate(-2*theta);   
  line(0, 0, 0, -h);
}