PImage img;
int smallPoint, largePoint;
Input name;


void setup() {
  fullScreen();
  
  name = new Input();
  
  
  
  img = loadImage("pepper.jpg");
  smallPoint = 4;
  largePoint = 60;
  imageMode(CENTER);
  noStroke();
  background(255);
  frameRate(200);
  
}

void draw() { 
 
  //println(name.getAmplitude());
  
  
  float pointillize = map((10-(Math.min(name.getAmplitude(),10))), 0, 10, smallPoint, largePoint);
  int x = int(random(img.width)); 
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
}