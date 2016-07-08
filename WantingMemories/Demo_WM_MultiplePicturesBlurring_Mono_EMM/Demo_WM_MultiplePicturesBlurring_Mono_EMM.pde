PImage      one;
PImage      two;
PImage      three;
PImage      four;
PImage      five;
PImage      six;
PImage      seven;
PImage      eight;
PImage      nine;
PImage      oneBlur;
PImage      twoBlur;
PImage      threeBlur;
PImage      fourBlur;
PImage      fiveBlur;
PImage      sixBlur; 
PImage      sevenBlur;
PImage      eightBlur;
PImage      nineBlur;

PImage      collage;

Input       input;

int oneLevel;
int twoLevel;
int threeLevel;
int fourLevel;
int fiveLevel;
int sixLevel;
int sevenLevel;
int eightLevel;
int nineLevel;


void setup()
{
  fullScreen();
  collage = loadImage("collage.png");
  collage.resize(width, height);
  background(collage);

  one  = loadImage("one.jpeg");
  two  = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");

  oneBlur  = loadImage("oneBlur.jpg");
  twoBlur  = loadImage("twoBlur.jpg");
  threeBlur = loadImage("threeBlur.jpg");
  fourBlur = loadImage("fourBlur.jpg");
  fiveBlur = loadImage("fiveBlur.jpg");
  sixBlur = loadImage("sixBlur.jpg");
  sevenBlur = loadImage("sevenBlur.jpg");
  eightBlur = loadImage("eightBlur.jpg");
  nineBlur = loadImage("nineBlur.jpg");

  one.resize(width/4, height/4); 
  two.resize(width/2, height/4); 
  three.resize(width/4, height/4); 
  four.resize(width/4, height/2); 
  five.resize(width/2, height/2); 
  six.resize(width/4, height/2); 
  seven.resize(width/4, height/4); 
  eight.resize(width/2, height/4); 
  nine.resize(width/4, height/4);

  oneBlur.resize(width/4, height/4); 
  twoBlur.resize(width/2, height/4); 
  threeBlur.resize(width/4, height/4); 
  fourBlur.resize(width/4, height/2); 
  fiveBlur.resize(width/2, height/2); 
  sixBlur.resize(width/4, height/2); 
  sevenBlur.resize(width/4, height/4); 
  eightBlur.resize(width/2, height/4); 
  nineBlur.resize(width/4, height/4);
  
  input  = new Input();
}

void draw()
{

//Drawing blurred images over background
  image (oneBlur, 0, 0);
  image (twoBlur, width/4, 0);
  image (threeBlur, (3*(width/4)), 0);
  image (fourBlur, 0, height/4);
  image (fiveBlur, width/4, height/4);
  image (sixBlur, (3*(width/4)), height/4);
  image (sevenBlur, 0, (3*(height/4)));
  image (eightBlur, width/4, (3*(height/4)));
  image (nineBlur, (3*(width/4)), (3*(height/4)));

  // volume of input:
  oneLevel  = (int)Math.floor(input.getAmplitude() * 1000);
  twoLevel  = (int)Math.floor(input.getAdjustedFundAsHz() / 50);
  
  println("input.getAdjustedFundAsHz() = " + input.getAdjustedFundAsHz());

  //showing regular images as amplitude of each part is adjusted
  tint(255, (Math.min(oneLevel, 255)));
  image(one, 0, 0, width/4, height/4);

  tint(255, (Math.min(twoLevel, 255)));
  image(two, width/4, 0, width/2, height/4);

  tint(255,(Math.min(oneLevel,255)));
   image(three,(3*(width/4)),0,width/4,height/4);
   
   tint(255,(Math.min(twoLevel,255)));
   image(four,0,height/4,width/4,height/2);
   
   tint(255,(Math.min(oneLevel,255)));
   image(five,width/4,height/4,width/2,height/2);
   
   tint(255,(Math.min(twoLevel,255)));
   image(six,(3*(width/4)),height/4,width/4,height/2);
   
   tint(255,(Math.min(oneLevel,255)));
   image(seven,0,(3*(height/4)),width/4,height/4);
   
   tint(255,(Math.min(twoLevel,255)));
   image(eight,width/4,(3*(height/4)),width/2,height/4);
   
   tint(255,(Math.min(oneLevel,255)));
   image(nine,(3*(width/4)),(3*(height/4)),width/4,height/4);
}