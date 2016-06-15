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

MultipleInputs allInputs;

int oneLevel;
int twoLevel;
int threeLevel;
int fourLevel;
int fiveLevel;
int sixLevel;
int sevenLevel;
int eightLevel;
int nineLevel;

/*FFT         fft;
 AudioInput  input;
 int         level;
 Minim       minim;*/

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

  allInputs = new MultipleInputs("WM parts - Tenor.mp3");//one
  allInputs.add("WM parts - Bass.mp3");//two
  /*allInputs.add("WM parts - Bass.mp3");//three
  allInputs.add("WM parts - Bass.mp3");//four
  allInputs.add("WM parts - Bass.mp3");//five
  allInputs.add("WM parts - Bass.mp3");//six
  allInputs.add("WM parts - Bass.mp3");//seven
  allInputs.add("WM parts - Bass.mp3");//eight
  allInputs.add("WM parts - Bass.mp3");//nine*/

}

void draw()
{
//Drawing regular images in correct places ... not needed with background
  /* image (one,0,0);
   image (two,width/4,0);
   image (three,(3*(width/4)),0);
   image (four,0,height/4);
   image (five,width/4,height/4);
   image (six,(3*(width/4)),height/4);
   image (seven,0,(3*(height/4)));
   image (eight,width/4,(3*(height/4)));
   image (nine,(3*(width/4)),(3*(height/4)));*/

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
  oneLevel  = (int)Math.floor(allInputs.get(0).getAmplitude() * 1500);
  twoLevel  = (int)Math.floor(allInputs.get(1).getAmplitude() * 1500);
  /*threeLevel  = (int)Math.floor(allInputs.get(2).getAmplitude() * 1500);
  fourLevel  = (int)Math.floor(allInputs.get(3).getAmplitude() * 1500);
  fiveLevel  = (int)Math.floor(allInputs.get(4).getAmplitude() * 1500);
  sixLevel  = (int)Math.floor(allInputs.get(5).getAmplitude() * 1500);
  sevenLevel  = (int)Math.floor(allInputs.get(6).getAmplitude() * 1500);
  eightLevel  = (int)Math.floor(allInputs.get(7).getAmplitude() * 1500);
  nineLevel  = (int)Math.floor(allInputs.get(8).getAmplitude() * 1500);*/

  //showing regular images as amplitude of each part is adjusted
  tint(255, (Math.min(oneLevel, 255)));
  image(one, 0, 0, width/4, height/4);

  tint(255, (Math.min(twoLevel, 255)));
  image(two, width/4, 0, width/2, height/4);

  /*tint(255,(Math.min(threelevel,255)));
   image(three,(3*(width/4)),0,width/4,height/4);
   
   tint(255,(Math.min(fourlevel,255)));
   image(four,0,height/4,width/4,height/2);
   
   tint(255,(Math.min(fivelevel,255)));
   image(five,width/4,height/4,width/2,height/2);
   
   tint(255,(Math.min(sixlevel,255)));
   image(six,(3*(width/4)),height/4,width/4,height/2);
   
   tint(255,(Math.min(sevenlevel,255)));
   image(seven,0,(3*(height/4)),width/4,height/4);
   
   tint(255,(Math.min(eightlevel,255)));
   image(eight,width/4,(3*(height/4)),width/2,height/4);
   
   tint(255,(Math.min(ninelevel,255)));
   image(nine,(3*(width/4)),(3*(height/4)),width/4,height/4);*/
}