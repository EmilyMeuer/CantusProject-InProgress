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

int smallPoint;
int largePoint;



void setup()
{
  fullScreen();
  collage = loadImage("collage.png");
  collage.resize(width, height);
  background(collage);

  smallPoint = 1; //smallest dot size
  largePoint = 70;//largest dot size
  noStroke();
  frameRate(10);

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
  /*
  Input[] tracks = new Input[5];
   tracks[0] = new Input("WMTenor.m4a");
   tracks[1] = new Input("WMBass.m4a");
   tracks[2] = new Input("WMAlto.m4a");
   tracks[3] = new Input("WMMelody.m4a");
   tracks[4] = new Input("WMSoprano.m4a");
   */
  //  allInputs = new MultipleInputs(tracks);

  allInputs = new MultipleInputs(new String[] {"WMTenor.mp3", "WMBass.mp3", "WMAlto.mp3", "WMMelody.mp3", "WMSoprano.mp3" } ); //inserting all mp3 files here ... hopefully live inputs in the future

  for (int i = 0; i < 9; i++)
  {
    println(i + ": ");
    int[] loc = getImageXandY(i);
    for (int j = 0; j < loc.length; j++)
    {
      print("  " + j + ": " + loc[j]);
    } // for - j
    println();
  } // for - i
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
  oneLevel  = (int)Math.floor(allInputs.get(0).getAmplitude() * 1000);
  twoLevel  = (int)Math.floor(allInputs.get(1).getAmplitude() * 1000);
  threeLevel = (int)Math.floor(allInputs.get(2).getAmplitude() * 1000);
  fourLevel = (int)Math.floor(allInputs.get(3).getAmplitude() * 1000);
  fiveLevel = (int)Math.floor(allInputs.get(4).getAmplitude() * 1000);

  /*
  //showing regular images as amplitude of each part is adjusted
   tint(255, (Math.min(oneLevel, 255)));
   image(one, 0, 0, width/4, height/4);
   
   tint(255, (Math.min(twoLevel, 255)));
   image(two, width/4, 0, width/2, height/4);
   
   tint(255, (Math.min(threeLevel, 255)));
   image(three, (3*(width/4)), 0, width/4, height/4);
   
   tint(255, (Math.min(fourLevel, 255)));
   image(four, 0, height/4, width/4, height/2);
   
   tint(255, (Math.min(fiveLevel, 255)));
   image(five, width/4, height/4, width/2, height/2);
   
   tint(255, (Math.min(threeLevel, 255)));
   image(six, (3*(width/4)), height/4, width/4, height/2);
   
   tint(255, (Math.min(fourLevel, 255)));
   image(seven, 0, (3*(height/4)), width/4, height/4);
   
   tint(255, (Math.min(fiveLevel, 255)));
   image(eight, width/4, (3*(height/4)), width/2, height/4);
   
   tint(255, (Math.min(fourLevel, 255)));
   image(nine, (3*(width/4)), (3*(height/4)), width/4, height/4);
   
   */


  float pointillizeOne = map((30-(Math.min(oneLevel, 30))), 0, 30, smallPoint, largePoint);
  int randPixelNum = (int)(random(one.pixels.length));
  int randPixel = one.pixels[randPixelNum];
  int xOne = randPixelNum%one.width;
  int yOne = randPixelNum/one.width;
  color pixOne = one.get(xOne, yOne);
  int[] cornerXY = getImageXandY(0);
/*  for(int i = 0; i < cornerXY.length; i++)
  {
    println("1: " + "\n  " + i + ": " + cornerXY[i]);
  } // for */
  fill(pixOne, 128);
  ellipse(xOne + cornerXY[0], yOne + cornerXY[1], pointillizeOne, pointillizeOne);

  // if I give it two.pixels[0], can it give me a location in the sketch?

  float pointillizeTwo = map((Math.min(twoLevel, 30)), 0, 30, smallPoint, largePoint);
  randPixelNum = (int)(random(two.pixels.length));
  randPixel = two.pixels[randPixelNum];
  int xTwo = randPixelNum%two.width;
  int yTwo = randPixelNum/two.width;
  color pixTwo = two.get(xTwo, yTwo);
  cornerXY = getImageXandY(1);
  for(int i = 0; i < cornerXY.length; i++)
  {
    println("2: xTwo + cornerXY[0] = " + (xTwo + cornerXY[0]));
  } // for
  fill(pixTwo, 128);
  ellipse(xTwo + cornerXY[0], yTwo + cornerXY[1], pointillizeTwo, pointillizeTwo);
  
  float pointillizeFive = map((Math.min(fiveLevel, 30)), 0, 30, smallPoint, largePoint);
  randPixelNum = (int)(random(five.pixels.length));
  randPixel = five.pixels[randPixelNum];
  int xFive = randPixelNum%five.width;
  int yFive = randPixelNum/five.width;
  color pixFive = five.get(xFive, yFive);
  cornerXY = getImageXandY(4);
  for(int i = 0; i < cornerXY.length; i++)
  {
    println("2: xFive + cornerXY[0] = " + (xFive + cornerXY[0]));
  } // for
  fill(pixFive, 128);
  ellipse(xFive + cornerXY[0], yFive + cornerXY[1], pointillizeFive, pointillizeFive);

  /*
  float pointillizeThree = map(((Math.min(threeLevel, 30))), 0, 30, smallPoint, largePoint);
   int xThree = int(random(three.width)); 
   int yThree = int(random(three.height));
   color pixThree = three.get(xThree, yThree);
   fill(pixThree, 128);
   ellipse(xThree, yThree, pointillizeThree, pointillizeThree);
   
   float pointillizeFour = map(((Math.min(fourLevel, 30))), 0, 30, smallPoint, largePoint);
   int xFour = int(random(four.width)); 
   int yFour = int(random(four.height));
   color pixFour = four.get(xFour, yFour);
   fill(pixFour, 128);
   ellipse(xFour, yFour, pointillizeFour, pointillizeFour);
   
   float pointillizeFive = map((30-(Math.min(fiveLevel, 30))), 0, 30, smallPoint, largePoint);
   int xFive = int(random(five.width)); 
   int yFive = int(random(five.height));
   color pixFive = five.get(xFive, yFive);
   fill(pixFive, 128);
   ellipse(xFive, yFive, pointillizeFive, pointillizeFive);
   
   float pointillizeSix = map((30-(Math.min(sixLevel, 30))), 0, 30, smallPoint, largePoint);
   int xSix = int(random(six.width)); 
   int ySix = int(random(six.height));
   color pixSix = six.get(xSix, ySix);
   fill(pixSix, 128);
   ellipse(xSix, ySix, pointillizeSix, pointillizeSix);
   
   float pointillizeSeven = map((30-(Math.min(sevenLevel, 30))), 0, 30, smallPoint, largePoint);
   int xSeven = int(random(seven.width)); 
   int ySeven = int(random(seven.height));
   color pixSeven = seven.get(xSeven, ySeven);
   fill(pixSeven, 128);
   ellipse(xSeven, ySeven, pointillizeSeven, pointillizeSeven);
   
   float pointillizeEight = map((30-(Math.min(eightLevel, 30))), 0, 30, smallPoint, largePoint);
   int xEight = int(random(eight.width)); 
   int yEight = int(random(eight.height));
   color pixEight = eight.get(xEight, yEight);
   fill(pixEight, 128);
   ellipse(xEight, yEight, pointillizeEight, pointillizeEight);
   
   float pointillizeNine = map((30-(Math.min(nineLevel, 30))), 0, 30, smallPoint, largePoint);
   int xNine = int(random(nine.width)); 
   int yNine = int(random(nine.height));
   color pixNine = nine.get(xNine, yNine);
   fill(pixNine, 128);
   ellipse(xNine, yNine, pointillizeNine, pointillizeNine);
   
   */
} // draw()

/**
 * A method that returns a coordinate pair with the x, y Cartesian point 
 * of the corner of the image.
 *
 * @param    imageNum  An int specifying which image's location is in question.
 * @returns  int[]     An x, y coordinate pair with the image's pixel location in the sketch.
 */
int[] getImageXandY(int imageNum)
{
  int x = queryArray(width, imageNum % 3);
  int y = queryArray(height, imageNum / 3);

  return new int[] { x, y };
} // getImageXandY

int queryArray(int x, int loc)
{
  int[] array = {0, x/4, 3*(x/4)  };

  if (loc > array.length) {  
    throw new IllegalArgumentException("WM_PointsMultiplePictures_EMM.queryArray: loc " + loc + " is out of bounds; should be less than array.length " + array.length);
  }

  return array[loc];
} // queryArray