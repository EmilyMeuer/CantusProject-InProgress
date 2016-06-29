PImage      one;
PImage      two;
PImage      three;
PImage      four;
PImage      five;
PImage      six;
PImage      seven;
PImage      eight;
PImage      nine;
PImage      ten;
PImage      oneBlur;
PImage      twoBlur;
PImage      threeBlur;
PImage      fourBlur;
PImage      fiveBlur;
PImage      sixBlur; 
PImage      sevenBlur;
PImage      eightBlur;
PImage      nineBlur;
PImage      tenBlur;

PImage      collage;
PImage      collageTwo;

MultipleInputs allInputs;
Input       left;
Input       right;

int oneLevel;
int twoLevel;
int threeLevel;
int fourLevel;
int fiveLevel;
int sixLevel;
int sevenLevel;
int eightLevel;
int nineLevel;
int tenLevel;

int smallPoint = 4;
int largePoint = 4;

/*FFT         fft;
 AudioInput  input;
 int         level;
 Minim       minim;*/

void setup()
{
  background(0);
  /*collageTwo = loadImage("collageTwo.png");
   collageTwo.resize(width, height);
   background(collageTwo);*/

  one  = loadImage("one.jpeg");
  two  = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  ten = loadImage("ten.jpg");


  oneBlur  = loadImage("oneBlur.jpg");
  twoBlur  = loadImage("twoBlur.jpg");
  threeBlur = loadImage("threeBlur.jpg");
  fourBlur = loadImage("fourBlur.jpg");
  //fiveBlur = loadImage("fiveBlur.jpg");
  sixBlur = loadImage("sixBlur.jpg");
  sevenBlur = loadImage("sevenBlur.jpg");
  eightBlur = loadImage("eightBlur.jpg");
  nineBlur = loadImage("nineBlur.jpg");
  tenBlur = loadImage("tenBlur.jpg");



  one.resize(width/4, height/4); 
  two.resize(width/2, height/4); 
  three.resize(width/4, height/4); 
  four.resize(width/4, height/2); 
  five.resize(width/2, height/2); 
  six.resize(width/4, height/2); 
  seven.resize(width/4, height/4); 
  eight.resize(width/4, height/4); 
  nine.resize(width/4, height/4);
  ten.resize(width/4, height/4);

  oneBlur.resize(width/4, height/4); 
  twoBlur.resize(width/2, height/4); 
  threeBlur.resize(width/4, height/4); 
  fourBlur.resize(width/4, height/2); 
  //fiveBlur.resize(width/2, height/2); 
  sixBlur.resize(width/4, height/2); 
  sevenBlur.resize(width/4, height/4); 
  eightBlur.resize(width/4, height/4); 
  nineBlur.resize(width/4, height/4);
  tenBlur.resize(width/4, height/4);

  left  = new Input(true, false);
  right = new Input(false, true);


  /*allInputs = new MultipleInputs("WM parts - Tenor.mp3");//one
   allInputs.add("WM parts - Bass.mp3");//two*/

  noStroke();
  
  
    for (int i = 0; i < 9; i++)
  {
    println(i + ": ");
    int[] loc = getImageXandY(i);
    for (int j = 0; j < loc.length; j++)
    {
      print("  " + j + ": " + loc[j]);
    } // for - j
    println();
}}

void draw()
{

  //Drawing blurred images over background
  image (oneBlur, 0, 0);
  image (twoBlur, width/4, 0);
  image (threeBlur, (3*(width/4)), 0);
  image (fourBlur, 0, height/4);
  // image (fiveBlur, width/4, height/4);
  image (sixBlur, (3*(width/4)), height/4);
  image (sevenBlur, 0, (3*(height/4)));
  image (eightBlur, width/4, (3*(height/4)));
  image (nineBlur, width/2, (3*(height/4)));
  image (tenBlur, 3*(width/4), (3*(height/4)));

  // volume of input:
  oneLevel  = (int)Math.floor(left.getAmplitude() * 1000);
  twoLevel  = (int)Math.floor(right.getAmplitude() * 1000);
  threeLevel  = (int)Math.floor(left.getAmplitude() * 1500);
  fourLevel  = (int)Math.floor(right.getAmplitude() * 1500);
  // fiveLevel  = (int)Math.floor(left.getAmplitude() * 1500);
  sixLevel  = (int)Math.floor(right.getAmplitude() * 1500);
  sevenLevel  = (int)Math.floor(left.getAmplitude() * 1500);
  eightLevel  = (int)Math.floor(right.getAmplitude() * 1500);
  nineLevel  = (int)Math.floor(left.getAmplitude() * 1500);
  tenLevel  = (int)Math.floor(right.getAmplitude() * 1500);

  //showing regular images as amplitude of each part is adjusted
  tint(255, (Math.min(oneLevel, 255)));
  image(one, 0, 0, width/4, height/4);

  tint(255, (Math.min(twoLevel, 255)));
  image(two, width/4, 0, width/2, height/4);

  tint(255, (Math.min(threeLevel, 255)));
  image(three, (3*(width/4)), 0, width/4, height/4);

  tint(255, (Math.min(fourLevel, 255)));
  image(four, 0, height/4, width/4, height/2);



float pointillizeFive = map((Math.min(fiveLevel, 30)), 0, 30, smallPoint, largePoint);
  int randPixelNum = (int)(random(five.pixels.length));
  int randPixel = five.pixels[randPixelNum];
  int xFive = randPixelNum%five.width;
  int yFive = randPixelNum/five.width;
  color pixFive = five.get(xFive, yFive);
  int[] cornerXY = getImageXandY(4);
  for(int i = 0; i < cornerXY.length; i++)


  //  tint(255, (Math.min(fiveLevel, 255)));
  //image(five, width/4, height/4, width/2, height/2);

  tint(255, (Math.min(sixLevel, 255)));
  image(six, (3*(width/4)), height/4, width/4, height/2);

  tint(255, (Math.min(sevenLevel, 255)));
  image(seven, 0, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(eightLevel, 255)));
  image(eight, width/4, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(nineLevel, 255)));
  image(nine, width/2, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(tenLevel, 255)));
  image(ten, 3*(width/4), 3*(height/4), width/4, height/4);
}


int[] getImageXandY(int imageNum)
{
  int x = queryArray(width, imageNum % 3);
  int y = queryArray(height, imageNum / 3);

  return new int[] { x, y };
} 


int queryArray(int x, int loc)
{
  int[] array = {0, x/4, 3*(x/4)  };

  if (loc > array.length) {  
    throw new IllegalArgumentException("WM_PointsMultiplePictures_EMM.queryArray: loc " + loc + " is out of bounds; should be less than array.length " + array.length);
  }

  return array[loc];
}