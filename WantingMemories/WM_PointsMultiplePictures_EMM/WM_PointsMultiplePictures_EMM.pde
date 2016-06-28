/*
  Erin Kern
  Emily Meuer
  06/21/2016
  
  Moved the pointillism to start in the correct location for each pic.
  
  Arrays:
    - put everything that has a name into an array
    (now it might not need the name; instead of "one" it can be images[0]).
 */

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
PImage[]  images;

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

// Store all names so that the images can be loaded ina loop:
  String[]  imageNames = { "one.jpeg",
                            "two.jpg",
                            "three.jpg",
                            "four.jpg",
                            "five.jpg",
                            "six.jpg",
                            "seven.jpg",
                            "eight.jpg",
                            "nine.jpg"
  }; // imageNames


  one  = loadImage("one.jpeg");
  two  = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");


  // Create an array of PImages and fill it with the images
  // whose names are in the String[] of image names.
<<<<<<< HEAD
  PImage[]  images = new PImage[10];
  for (int i = 1; i < imageNames.length; i++)
=======
  images = new PImage[9];
  for (int i = 0; i < imageNames.length; i++)
>>>>>>> origin/master
  {
    images[i] = loadImage(imageNames[i]);
  } // for
  
  // Change the following code so that the blurred images are in another PImage[].
  
  oneBlur  = loadImage("oneBlur.jpg");
  twoBlur  = loadImage("twoBlur.jpg");
  threeBlur = loadImage("threeBlur.jpg");
  fourBlur = loadImage("fourBlur.jpg");
  fiveBlur = loadImage("fiveBlur.jpg");
  sixBlur = loadImage("sixBlur.jpg");
  sevenBlur = loadImage("sevenBlur.jpg");
  eightBlur = loadImage("eightBlur.jpg");
  nineBlur = loadImage("nineBlur.jpg");

  // Optional: To do the following in a loop will take a little math, possibly with mod and an 
  // array of options (see my getImageXandY() and queryArray() for ideas).
<<<<<<< HEAD
  images[1].resize(width/4, height/4); 
  two.resize(width/2, height/4); 
  three.resize(width/4, height/4); 
  four.resize(width/4, height/2); 
  five.resize(width/2, height/2); 
  six.resize(width/4, height/2); 
  seven.resize(width/4, height/4); 
  eight.resize(width/2, height/4); 
  nine.resize(width/4, height/4);
=======
  images[0].resize(width/4, height/4); 
  images[1].resize(width/2, height/4); 
  images[2].resize(width/4, height/4); 
  images[3].resize(width/4, height/2); 
  images[4].resize(width/2, height/2); 
  images[5].resize(width/4, height/2); 
  images[6].resize(width/4, height/4); 
  images[7].resize(width/2, height/4); 
  images[8].resize(width/4, height/4);
>>>>>>> origin/master
  
  oneBlur.resize(width/4, height/4); 
  twoBlur.resize(width/2, height/4); 
  threeBlur.resize(width/4, height/4); 
  fourBlur.resize(width/4, height/2); 
  fiveBlur.resize(width/2, height/2); 
  sixBlur.resize(width/4, height/2); 
  sevenBlur.resize(width/4, height/4); 
  eightBlur.resize(width/2, height/4); 
  nineBlur.resize(width/4, height/4);

  allInputs = new MultipleInputs(new String[] {"WMTenor.mp3", "WMBass.mp3", "WMAlto.mp3", "WMMelody.mp3", "WMSoprano.mp3" } ); //inserting all mp3 files here ... hopefully live inputs in the future

  AudioPlayer playerOne  = allInputs.get(0).player;
  AudioPlayer playerTwo  = allInputs.get(1).player;
  AudioPlayer playerThree  = allInputs.get(2).player;
  AudioPlayer playerFour  = allInputs.get(3).player;
  AudioPlayer playerFive  = allInputs.get(4).player;

  playerTwo.play();
  playerOne.play();
  playerThree.play();
  playerFour.play();
  playerFive.play();
  /*
  for(int i = 1; i < allInputs.size(); i++)
  {
    allInputs.get(i).player.play();
  } // for
*/
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
  // (Optional - Use queryArray() and do this in a loop)
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

  // This is the most important thing to do in a loop!!
  
  float pointillizeOne = map((30-(Math.min(oneLevel, 30))), 0, 30, smallPoint, largePoint);
  int randPixelNum = (int)(random(images[0].pixels.length));
  int randPixel = images[0].pixels[randPixelNum];
  int xOne = randPixelNum%images[0].width;
  int yOne = randPixelNum/images[0].width;
  color pixOne = images[0].get(xOne, yOne);
  int[] cornerXY = getImageXandY(0);
/*  for(int i = 0; i < cornerXY.length; i++)
  {
    println("1: " + "\n  " + i + ": " + cornerXY[i]);
  } // for */
  fill(pixOne, 128);
  ellipse(xOne + cornerXY[0], yOne + cornerXY[1], pointillizeOne, pointillizeOne);

  float pointillizeTwo = map((Math.min(twoLevel, 30)), 0, 30, smallPoint, largePoint);
<<<<<<< HEAD
  randPixelNum = (int)(random(two.pixels.length));
  randPixel = two.pixels[randPixelNum];
  int xTwo = randPixelNum%two.width;
  int yTwo = randPixelNum/two.width;
  color pixTwo = two.get(xTwo, yTwo);
  cornerXY = getImageXandY(1);//1 for two etc.
=======
  randPixelNum = (int)(random(images[1].pixels.length));
  randPixel = images[1].pixels[randPixelNum];
  int xTwo = randPixelNum%images[1].width;
  int yTwo = randPixelNum/images[1].width;
  color pixTwo = images[1].get(xTwo, yTwo);
  cornerXY = getImageXandY(1);
>>>>>>> origin/master
  for(int i = 0; i < cornerXY.length; i++)
  {
    println("2: xTwo + cornerXY[0] = " + (xTwo + cornerXY[0]));
  } // for
  fill(pixTwo, 128);
  ellipse(xTwo + cornerXY[0], yTwo + cornerXY[1], pointillizeTwo, pointillizeTwo);
  
  float pointillizeFive = map((Math.min(fiveLevel, 30)), 0, 30, smallPoint, largePoint);
  randPixelNum = (int)(random(images[4].pixels.length));
  randPixel = images[4].pixels[randPixelNum];
  int xFive = randPixelNum%images[4].width;
  int yFive = randPixelNum/images[4].width;
  color pixFive = images[4].get(xFive, yFive);
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