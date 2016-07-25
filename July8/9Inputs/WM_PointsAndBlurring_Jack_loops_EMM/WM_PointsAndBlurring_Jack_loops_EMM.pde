/*
  07/21/2016
  Emily Meuer
  Update to add loops (rather than manually adjust which pictures blur).

  07/07/2016
  Emily Meuer
  Update to integrate more than 4 inputs.
  
  07/04/2016
  Erin Kern
  updates by Emily Meuer to WM_PointsAndBlurring_LR_EAK,
  integrating the new input class and, thus, multiple inputs through Jack.
*/

// Calibrate:
int  volumeAdjust  = 2;   // not currently used.

//Creating variables for all the images used. Each picture is numbered based 
//on its spot in the grid (i.e. the top left picture is "one" and 
//the bottom right picture is "ten"). Pictures are also categorized by their scene number
//(i.e. the second scene has pictures titled "oneB", "twoB", etc.).
//Pictures with "blur" in the name are just the blurred version of the original picture
//(i.e. "oneBblur" is the blurred version of "oneB").

// Could get away w/out variables if load images directly into the arrays...
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

PImage      oneB;
PImage      twoB;
PImage      threeB;
PImage      fourB;
PImage      sixB;
PImage      sevenB;
PImage      eightB;
PImage      nineB;
PImage      tenB;

PImage      oneC;
PImage      twoC;
PImage      threeC;
PImage      fourC;
PImage      sixC;
PImage      sevenC;
PImage      eightC;
PImage      nineC;
PImage      tenC;

PImage      oneD;
PImage      twoD;
PImage      threeD;
PImage      fourD;
PImage      sixD;
PImage      sevenD;
PImage      eightD;
PImage      nineD;
PImage      tenD;

PImage      oneBblur;
PImage      twoBblur;
PImage      threeBblur;
PImage      fourBblur;
PImage      sixBblur;
PImage      sevenBblur;
PImage      eightBblur;
PImage      nineBblur;
PImage      tenBblur;

PImage      oneCblur;
PImage      twoCblur;
PImage      threeCblur;
PImage      fourCblur;
PImage      sixCblur;
PImage      sevenCblur;
PImage      eightCblur;
PImage      nineCblur;
PImage      tenCblur;

PImage      oneDblur;
PImage      twoDblur;
PImage      threeDblur;
PImage      fourDblur;
PImage      sixDblur;
PImage      sevenDblur;
PImage      eightDblur;
PImage      nineDblur;
PImage      tenDblur;

//Creating universal variables for the pictures so they can be easily changed for each scene.

PImage      first;
PImage      second;
PImage      third;
PImage      fourth;
PImage      fifth;
PImage      sixth;
PImage      seventh;
PImage      eighth;
PImage      ninth;
PImage      tenth;

PImage      firstBlur;
PImage      secondBlur;
PImage      thirdBlur;
PImage      fourthBlur;
PImage      fifthBlur;
PImage      sixthBlur; 
PImage      seventhBlur;
PImage      eighthBlur;
PImage      ninthBlur;
PImage      tenthBlur;

Input       input;

//Creating variables for the 9 different sound inputs.
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

//Creating variables for the size of the dots used in the center picture.
int smallPoint = 4;
int largePoint = 4;

//Creating a variable to manage the scene number.
int scene = 1;

PImage[] displayed;
PImage[] displayedBlur;
PImage[] A;
PImage[] Ablur;
PImage[] B;
PImage[] Bblur;
PImage[] C;
PImage[] Cblur;
PImage[][]  allImages;
PImage[][]  allBlurs;
int[]    levels;

int  waitUntil;
// arrayLoc and picLoc used to determine which pics to change in each scene:
int  arrayLoc;
int  picLoc;

void setup()
{
  //Setting up background and making it full screen.
  fullScreen();
  background(0);
  
  displayed      = new PImage[9];
  displayedBlur  = new PImage[9];
  
  allImages  = new PImage[3][];
  allBlurs   = new PImage[3][];

  //Loading all the images ... 
  one  = loadImage("one.jpeg");
  two  = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("fiveRGB.jpg");
  //five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  ten = loadImage("ten.jpg");
  
  A  = new PImage[] { one,
                      two,
                      three,
                      four,
   //                   five,
                      six,
                      seven,
                      eight,
                      nine,
                      ten
  };
  allImages[0]  = A;

  oneB = loadImage("oneB.jpg");
  twoB = loadImage("twoB.jpg");
  threeB = loadImage("threeB.jpg");
  fourB = loadImage("fourB.jpg");
  sixB = loadImage("sixB.jpg");
  sevenB = loadImage("sevenB.jpg");
  eightB = loadImage("eightB.jpg");
  nineB = loadImage("nineB.jpg");
  tenB = loadImage("tenB.jpg");
  
  B  = new PImage[] { oneB,
                      twoB,
                      threeB,
                      fourB,
  //                    five,
                      sixB,
                      sevenB,
                      eightB,
                      nineB,
                      tenB
  };
  allImages[1]  = B;

  oneC = loadImage("oneC.jpg");
  twoC = loadImage("twoC.jpg");
  threeC = loadImage("threeC.jpg");
  fourC = loadImage("fourC.jpg");
  sixC = loadImage("sixC copy.jpg");
  sevenC = loadImage("sevenC.jpg");
  eightC = loadImage("eightC.jpg");
  nineC = loadImage("nineC.jpeg");
  tenC = loadImage("tenC.jpeg");
  
  C  = new PImage[] { oneC,
                      twoC,
                      threeC,
                      fourC,
  //                    five,
                      sixC,
                      sevenC,
                      eightC,
                      nineC,
                      tenC
  };
  allImages[2]  = C;

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
  
  Ablur  = new PImage[] { oneBlur,
                      twoBlur,
                      threeBlur,
                      fourBlur,
  //                    five,
                      sixBlur,
                      sevenBlur,
                      eightBlur,
                      nineBlur,
                      tenBlur
  };
  allBlurs[0]  = Ablur;

  oneBblur  = loadImage("oneBblur.jpg");
  twoBblur  = loadImage("twoBblur.jpg");
  threeBblur = loadImage("threeBblur.jpg");
  fourBblur = loadImage("fourBblur.jpg");
  //fiveBlur = loadImage("fiveBblur.jpg");
  sixBblur = loadImage("sixBblur.jpg");
  sevenBblur = loadImage("sevenBblur.jpg");
  eightBblur = loadImage("eightBblur.jpg");
  nineBblur = loadImage("nineBblur.jpg");
  tenBblur = loadImage("tenBblur.jpg");
  
  Bblur  = new PImage[] { oneBblur,
                      twoBblur,
                      threeBblur,
                      fourBblur,
   //                   five,
                      sixBblur,
                      sevenBblur,
                      eightBblur,
                      nineBblur,
                      tenBblur
  };
  allBlurs[1]  = Bblur;

  oneCblur  = loadImage("oneCblur.jpg");
  twoCblur  = loadImage("twoCblur.jpg");
  threeCblur = loadImage("threeCblur.jpg");
  fourCblur = loadImage("fourCblur.jpg");
  sixCblur = loadImage("sixCblur.jpg");
  sevenCblur = loadImage("sevenCblur.jpg");
  eightCblur = loadImage("eightCblur.jpg");
  nineCblur = loadImage("nineCblur.jpg");
  tenCblur = loadImage("tenCblur.jpg");
  
  Cblur  = new PImage[] { oneCblur,
                      twoCblur,
                      threeCblur,
                      fourCblur,
  //                    five,
                      sixCblur,
                      sevenCblur,
                      eightCblur,
                      nineCblur,
                      tenCblur
  };
  allBlurs[2]  = Cblur;

  //Resizing all the images ...
  // ** Do this in a loop: do individually for each image, but loop through allImages/allBlurs. **
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

  oneB.resize(width/4, height/4); 
  twoB.resize(width/2, height/4); 
  threeB.resize(width/4, height/4); 
  fourB.resize(width/4, height/2); 
  sixB.resize(width/4, height/2); 
  sevenB.resize(width/4, height/4); 
  eightB.resize(width/4, height/4); 
  nineB.resize(width/4, height/4);
  tenB.resize(width/4, height/4);

  oneC.resize(width/4, height/4); 
  twoC.resize(width/2, height/4); 
  threeC.resize(width/4, height/4); 
  fourC.resize(width/4, height/2); 
  sixC.resize(width/4, height/2); 
  sevenC.resize(width/4, height/4); 
  eightC.resize(width/4, height/4); 
  nineC.resize(width/4, height/4);
  tenC.resize(width/4, height/4);


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

  oneBblur.resize(width/4, height/4); 
  twoBblur.resize(width/2, height/4); 
  threeBblur.resize(width/4, height/4); 
  fourBblur.resize(width/4, height/2); 
  sixBblur.resize(width/4, height/2); 
  sevenBblur.resize(width/4, height/4); 
  eightBblur.resize(width/4, height/4); 
  nineBblur.resize(width/4, height/4);
  tenBblur.resize(width/4, height/4);

  oneCblur.resize(width/4, height/4); 
  twoCblur.resize(width/2, height/4); 
  threeCblur.resize(width/4, height/4); 
  fourCblur.resize(width/4, height/2); 
  sixCblur.resize(width/4, height/2); 
  sevenCblur.resize(width/4, height/4); 
  eightCblur.resize(width/4, height/4); 
  nineCblur.resize(width/4, height/4);
  tenCblur.resize(width/4, height/4);

  //Creating a new Input object for 9 mics:
  // (was 13 at one point... make sure it still works...)
  input = new Input(9);
  
  // prints the location of each image:
  for (int i = 0; i < 9; i++)
  {
    println(i + ": ");
    int[] loc = getImageXandY(i);
    for (int j = 0; j < loc.length; j++)
    {
      print("  " + j + ": " + loc[j]);
    } // for - j
    println();
  }
  
  waitUntil  = millis();
  noStroke();
} // setup()

void draw()
{

  //Keeping track of the scene number. Scene is changed by pressing the spacebar.
  if (keyPressed && (millis() > waitUntil)) {
    scene ++;
    println(scene);
    
    waitUntil = millis() + 500;
  }
  
  arrayLoc  = scene / 10;
  picLoc    = scene % 10;
  
  int i;
  
  for(i = 0; i < picLoc; i++)
  {
    displayed[i]      = allImages[arrayLoc+1][i];
    displayedBlur[i]  = allBlurs[arrayLoc+1][i];
  } // for
  
  for(i = picLoc; i < allImages[arrayLoc].length; i++)
  {
    displayed[i]      = allImages[arrayLoc][i];
    displayedBlur[i]  = allBlurs[arrayLoc][i];
  } // for
  
  /*
  for(int i = 0; i < displayed.length; i++)
  {
    displayed[i] = A[i];
    displayedBlur[i] = Ablur[i];
    
  } // for
*/
/*
  //Changing which pictures show up based on scene ... the longhand way.
  if (scene == 1) {
    first = one;
    second = two;
    third = three;
    fourth = four;
    fifth = five;
    sixth = six;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBlur;
    secondBlur = twoBlur;
    thirdBlur = threeBlur;
    fourthBlur = fourBlur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBlur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }
*/
  if (scene == 2) {

    first = oneB;
    second = two;
    third = three;
    fourth = four;
    fifth = five;
    sixth = six;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBlur;
    thirdBlur = threeBlur;
    fourthBlur = fourBlur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBlur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 3) {

    first = oneB;
    second = twoB;
    third = three;
    fourth = four;
    fifth = five;
    sixth = six;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBlur;
    fourthBlur = fourBlur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBlur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 4) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = four;
    fifth = five;
    sixth = six;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBlur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBlur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 5) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = six;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBlur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 6) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = seven;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBlur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 7) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eight;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBlur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 8) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nine;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBlur;
    tenthBlur = tenBlur;
  }

  if (scene == 9) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = ten;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBlur;
  }

  if (scene == 10) {

    first = oneB;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneBblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 11) {
    first = oneC;
    second = twoB;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoBblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 12) {

    first = oneC;
    second = twoC;
    third = threeB;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeBblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 13) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourB;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourBblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 14) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixB;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixBblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 15) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenB;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenBblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 16) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightB;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightBblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 17) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineB;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineBblur;
    tenthBlur = tenBblur;
  }

  if (scene == 18) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenB;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenBblur;
  }

  if (scene == 19) {

    first = oneC;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneCblur;
    secondBlur = twoCblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }


  //Drawing blurred images over background
  // ** Could use queryArray to get the coordinates and do this in an array **
  
  image (Ablur[0], 0, 0);
  image (Ablur[1], width/4, 0);
  image (Ablur[2], (3*(width/4)), 0);
  image (Ablur[3], 0, height/4);
  // image (fifthBlur, width/4, height/4);
  image (Ablur[4], (3*(width/4)), height/4);
  image (Ablur[5], 0, (3*(height/4)));
  image (Ablur[6], width/4, (3*(height/4)));
  image (Ablur[7], width/2, (3*(height/4)));
  image (Ablur[8], 3*(width/4), (3*(height/4)));
  /*
  image (firstBlur, 0, 0);
  image (secondBlur, width/4, 0);
  image (thirdBlur, (3*(width/4)), 0);
  image (fourthBlur, 0, height/4);
  // image (fifthBlur, width/4, height/4);
  image (sixthBlur, (3*(width/4)), height/4);
  image (seventhBlur, 0, (3*(height/4)));
  image (eighthBlur, width/4, (3*(height/4)));
  image (ninthBlur, width/2, (3*(height/4)));
  image (tenthBlur, 3*(width/4), (3*(height/4)));
  */

  // volume of input:
  levels  = new int[9];
  
  for(int j = 0; j < levels.length; j++)
  {
    /*
    I think the following is now false:
    
    // input queried must be j+1 when j is less than 5,
    // but j after that (since the 5th image isn't connected to a singer).
    // (Could connect it, but then we'll have to do this fanagaling with the image display / getImageXandY.)
    int x;
    if(j < 5)  {  
      x = j+1;  
    }  else  {
      x = j;
    } // if - x
    */
    
//    levels[j]  = (int)Math.floor(input.getAmplitude(x) / volumeAdjust);    
    levels[j]  = (int)Math.floor(input.getAmplitude((j%2) + 1) / volumeAdjust);
  
  } // for
  
  /*
  oneLevel  = (int)Math.floor(input.getAmplitude(1) / volumeAdjust);
  twoLevel  = (int)Math.floor(input.getAmplitude(2) / volumeAdjust);
  threeLevel  = (int)Math.floor(input.getAmplitude(3) / volumeAdjust);
  fourLevel  = (int)Math.floor(input.getAmplitude(4) / volumeAdjust);
  // fiveLevel  = (int)Math.floor(input.getAmplitude() * 1500);
  sixLevel  = (int)Math.floor(input.getAmplitude(5) / volumeAdjust);
  sevenLevel  = (int)Math.floor(input.getAmplitude(6) / volumeAdjust);
  eightLevel  = (int)Math.floor(input.getAmplitude(7) / volumeAdjust);
  nineLevel  = (int)Math.floor(input.getAmplitude(8) / volumeAdjust);
  tenLevel  = (int)Math.floor(input.getAmplitude(9) / volumeAdjust);
  */
  
  int[]  coordinates;

  //showing regular images as amplitude of each part is adjusted
  for(i = 0; i < displayed.length; i++)
  {
    println("i = " + i);
    tint(255, (Math.min(levels[i], 255)));
    
    coordinates  = getImageXandY(i);
    image(displayed[i], coordinates[0], coordinates[1]);
  } // for - display blurred-over-clear pics
  
 /*
  tint(255, (Math.min(oneLevel, 255)));
//  image(first, 0, 0, width/4, height/4);
  image(displayed[0], 0, 0, width/4, height/4);

  tint(255, (Math.min(twoLevel, 255)));
  image(second, width/4, 0, width/2, height/4);
  image(second, width/4, 0, width/2, height/4);

  tint(255, (Math.min(threeLevel, 255)));
  image(third, (3*(width/4)), 0, width/4, height/4);
  image(third, (3*(width/4)), 0, width/4, height/4);

  tint(255, (Math.min(fourLevel, 255)));
  image(fourth, 0, height/4, width/4, height/2);
  image(fourth, 0, height/4, width/4, height/2);
*/

  //Pointillizing center image 
  float pointillizeFive = map((Math.min(fiveLevel, 30)), 0, 30, smallPoint, largePoint);
  int randPixelNum = (int)(random(five.pixels.length));
//  int randPixel = five.pixels[randPixelNum];
  int xFive = randPixelNum%five.width;
  int yFive = randPixelNum/five.width;
  color pixFive = five.get(xFive, yFive);
  int[] cornerXY = getImageXandY(4);

  //Making sure points are showing up only in the center area
  for (i = 0; i < cornerXY.length; i++) {
    fill(pixFive, 128);
    ellipse(xFive + cornerXY[0], yFive + cornerXY[1], pointillizeFive, pointillizeFive);
  }

/*
  //  tint(255, (Math.min(fiveLevel, 255)));
  //image(five, width/4, height/4, width/2, height/2);

  tint(255, (Math.min(sixLevel, 255)));
  image(sixth, (3*(width/4)), height/4, width/4, height/2);

  tint(255, (Math.min(sevenLevel, 255)));
  image(seventh, 0, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(eightLevel, 255)));
  image(eighth, width/4, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(nineLevel, 255)));
  image(ninth, width/2, (3*(height/4)), width/4, height/4);

  tint(255, (Math.min(tenLevel, 255)));
  image(tenth, 3*(width/4), 3*(height/4), width/4, height/4);
  */
}

/**
 * Returns the x and y coordinates of the upper left corner of an image,
 * where (0,0) is the upper left-hand corner.
 *
 * @param   imageNum   An int specifying for which image to find the coordinates; numbered 0-9.
 * @return  int[]      The x and y coordinates of the corner of the image, in the 0 and 1 positions of the array, respectively.
 */
int[] getImageXandY(int imageNum)
{
  int x;
  int y;
  
//  println("getImageXandY: imageNum = " + imageNum);
  // takes into account the different sizing of images on the bottom row:
  if(imageNum == 8)
  {
    // 9 is in the center of the screen:
    x = width / 2;
    y = queryArray(height, imageNum / 3);
  } else if(imageNum == 9)
  {
    // 10 (9) is in the position that 9 (8) would have been:
    x = queryArray(width,  2);
    y = queryArray(height, 2);
  } else {
    x = queryArray(width, imageNum % 3);
    y = queryArray(height, imageNum / 3);
  } // else

  return new int[] { x, y };
} 

/**
 * Determines whether either the x or y corner coordinate of an image is at 0, (height or width)/4, or 3*([height or width]/4).
 * (That is, is it in the first, second, or third row of images; now only used to position image 5 in the center.)
 *
 * @param  x    int specifying whether to base the following calculations on height or on width.
 * @param  loc  int specifying which image is in question; must be between 0 and 2.
 *
 * @return int  0, x/4, or 3*(x/4), depending on whether the image is in the first, second, or third row or column.
 */
int queryArray(int x, int loc)
{
  if(loc < 0)  {
    throw new IllegalArgumentException("WM_loops.queryArray: int parameter " + loc + " must be between 0 and 2.");
  } // if
  if(loc > 2)  {
    throw new IllegalArgumentException("WM_loops.queryArray: int parameter " + loc + " must be between 0 and 2.");
  } // if
  
  int[] array = {0, x/4, 3*(x/4)  };

  if (loc > array.length) {  
    throw new IllegalArgumentException("WM_PointsMultiplePictures_EMM.queryArray: loc " + loc + " is out of bounds; should be less than array.length " + array.length);
  }

  return array[loc];
}