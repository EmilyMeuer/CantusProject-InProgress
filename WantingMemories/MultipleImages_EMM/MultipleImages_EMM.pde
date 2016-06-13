PImage  gator;
PImage  amanda;

void setup()
{
//  size();
  fullScreen();
  gator = loadImage("gator_attack.png");
  gator.resize(width/2,height);  
  amanda = loadImage("amanda.png");
  amanda.resize(width/2,height);  
} // setup()

void draw()
{
  // coordinates at which each image is displayed:
  image(gator,0,0);
  image(amanda, width/2, 0);
} // draw()