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

PImage      oneE;
PImage      twoE;
PImage      threeE;
PImage      fourE;
PImage      sixE;
PImage      sevenE;
PImage      eightE;
PImage      nineE;
PImage      tenE;

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

PImage      oneEblur;
PImage      twoEblur;
PImage      threeEblur;
PImage      fourEblur;
PImage      sixEblur;
PImage      sevenEblur;
PImage      eightEblur;
PImage      nineEblur;
PImage      tenEblur;

PImage      collage;
PImage      collageTwo;


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

int scene = 1;


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
  five = loadImage("fiveRGB.jpg");
  //five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  ten = loadImage("ten.jpg");

  oneB = loadImage("oneB.jpg");
  twoB = loadImage("twoB.jpg");
  threeB = loadImage("threeB.jpg");
  fourB = loadImage("fourB.jpg");
  sixB = loadImage("sixB.jpg");
  sevenB = loadImage("sevenB.jpg");
  eightB = loadImage("eightB.jpg");
  nineB = loadImage("nineB.jpg");
  tenB = loadImage("tenB.jpg");

  oneC = loadImage("oneC.jpg");
  twoC = loadImage("twoC.jpg");
  threeC = loadImage("threeC.jpg");
  fourC = loadImage("fourC.jpg");
  sixC = loadImage("sixC copy.jpg");
  sevenC = loadImage("sevenC.jpg");
  eightC = loadImage("eightC.jpg");
  nineC = loadImage("nineC.jpeg");
  tenC = loadImage("tenC.jpeg");

  oneD = loadImage("oneD.jpeg");
  twoD = loadImage("twoD.jpeg");
  threeD = loadImage("threeD.jpeg");
  fourD = loadImage("fourD.JPG");
  sixD = loadImage("sixD.JPG");
  sevenD = loadImage("sevenD.jpeg");
  eightD = loadImage("eightD.jpg");
  nineD = loadImage("nineD.jpg");
  tenD = loadImage("tenD.jpg");

  oneE = loadImage("oneE.jpg");
  twoE = loadImage("twoE.jpg");
  threeE = loadImage("threeE.jpg");
  fourE = loadImage("fourE.jpg");
  sixE = loadImage("sixE.jpg");
  sevenE = loadImage("sevenE.jpg");
  eightE = loadImage("eightE.jpg");
  nineE = loadImage("nineE.jpg");
  tenE = loadImage("tenE.jpg");

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

  oneCblur  = loadImage("oneCblur.jpg");
  twoCblur  = loadImage("twoCblur.jpg");
  threeCblur = loadImage("threeCblur.jpg");
  fourCblur = loadImage("fourCblur.jpg");
  sixCblur = loadImage("sixCblur.jpg");
  sevenCblur = loadImage("sevenCblur.jpg");
  eightCblur = loadImage("eightCblur.jpg");
  nineCblur = loadImage("nineCblur.jpg");
  tenCblur = loadImage("tenCblur.jpg");

  oneDblur  = loadImage("oneDblur.jpg");
  twoDblur  = loadImage("twoDblur.jpg");
  threeDblur = loadImage("threeDblur.jpg");
  fourDblur = loadImage("fourDblur.jpg");
  sixDblur = loadImage("sixDblur.jpg");
  sevenDblur = loadImage("sevenDblur.jpg");
  eightDblur = loadImage("eightDblur.jpg");
  nineDblur = loadImage("nineDblur.jpg");
  tenDblur = loadImage("tenDblur.jpg");

  oneEblur  = loadImage("oneEblur.jpg");
  twoEblur  = loadImage("twoEblur.jpg");
  threeEblur = loadImage("threeEblur.jpg");
  fourEblur = loadImage("fourEblur.jpg");
  sixEblur = loadImage("sixEblur.jpg");
  sevenEblur = loadImage("sevenEblur.jpg");
  eightEblur = loadImage("eightEblur.jpg");
  nineEblur = loadImage("nineEblur.jpg");
  tenEblur = loadImage("tenEblur.jpg");

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

  oneD.resize(width/4, height/4); 
  twoD.resize(width/2, height/4); 
  threeD.resize(width/4, height/4); 
  fourD.resize(width/4, height/2); 
  sixD.resize(width/4, height/2); 
  sevenD.resize(width/4, height/4); 
  eightD.resize(width/4, height/4); 
  nineD.resize(width/4, height/4);
  tenD.resize(width/4, height/4);

  oneE.resize(width/4, height/4); 
  twoE.resize(width/2, height/4); 
  threeE.resize(width/4, height/4); 
  fourE.resize(width/4, height/2); 
  sixE.resize(width/4, height/2); 
  sevenE.resize(width/4, height/4); 
  eightE.resize(width/4, height/4); 
  nineE.resize(width/4, height/4);
  tenE.resize(width/4, height/4);

  oneBlur.resize(width/4, height/4); 
  twoBlur.resize(width/2, height/4); 
  threeBlur.resize(width/4, height/4); 
  fourBlur.resize(width/4, height/2);  
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

  oneDblur.resize(width/4, height/4); 
  twoDblur.resize(width/2, height/4); 
  threeDblur.resize(width/4, height/4); 
  fourDblur.resize(width/4, height/2); 
  sixDblur.resize(width/4, height/2); 
  sevenDblur.resize(width/4, height/4); 
  eightDblur.resize(width/4, height/4); 
  nineDblur.resize(width/4, height/4);
  tenDblur.resize(width/4, height/4);

  oneEblur.resize(width/4, height/4); 
  twoEblur.resize(width/2, height/4); 
  threeEblur.resize(width/4, height/4); 
  fourEblur.resize(width/4, height/2); 
  sixEblur.resize(width/4, height/2); 
  sevenEblur.resize(width/4, height/4); 
  eightEblur.resize(width/4, height/4); 
  nineEblur.resize(width/4, height/4);
  tenEblur.resize(width/4, height/4);

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
  }
}

void draw()
{

  if (keyPressed) {
    scene ++;
    delay(500);
    println(scene);
  }

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

  if (scene == 20) {

    first = oneD;
    second = twoC;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
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

  if (scene == 21) {

    first = oneD;
    second = twoD;
    third = threeC;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeCblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 22) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourC;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourCblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 23) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixC;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixCblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 24) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenC;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenCblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 25) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightC;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightCblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 26) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineC;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineCblur;
    tenthBlur = tenCblur;
  }

  if (scene == 27) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenC;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenCblur;
  }

  if (scene == 28) {

    first = oneD;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneDblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 29) {

    first = oneE;
    second = twoD;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoDblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 30) {

    first = oneE;
    second = twoE;
    third = threeD;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeDblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 31) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourD;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourDblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 32) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixD;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixDblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 33) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixE;
    seventh = sevenD;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixEblur;
    seventhBlur = sevenDblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 34) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixE;
    seventh = sevenE;
    eighth = eightD;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixEblur;
    seventhBlur = sevenEblur;
    eighthBlur = eightDblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 35) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixE;
    seventh = sevenE;
    eighth = eightE;
    ninth = nineD;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixEblur;
    seventhBlur = sevenEblur;
    eighthBlur = eightEblur;
    ninthBlur = nineDblur;
    tenthBlur = tenDblur;
  }

  if (scene == 36) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixE;
    seventh = sevenE;
    eighth = eightE;
    ninth = nineE;
    tenth = tenD;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixEblur;
    seventhBlur = sevenEblur;
    eighthBlur = eightEblur;
    ninthBlur = nineEblur;
    tenthBlur = tenDblur;
  }

  if (scene == 37) {

    first = oneE;
    second = twoE;
    third = threeE;
    fourth = fourE;
    fifth = five;
    sixth = sixE;
    seventh = sevenE;
    eighth = eightE;
    ninth = nineE;
    tenth = tenE;

    firstBlur = oneEblur;
    secondBlur = twoEblur;
    thirdBlur = threeEblur;
    fourthBlur = fourEblur;
    fifthBlur = fiveBlur;
    sixthBlur = sixEblur;
    seventhBlur = sevenEblur;
    eighthBlur = eightEblur;
    ninthBlur = nineEblur;
    tenthBlur = tenEblur;
  }

  //Drawing blurred images over background
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
  image(first, 0, 0, width/4, height/4);

  tint(255, (Math.min(twoLevel, 255)));
  image(second, width/4, 0, width/2, height/4);

  tint(255, (Math.min(threeLevel, 255)));
  image(third, (3*(width/4)), 0, width/4, height/4);

  tint(255, (Math.min(fourLevel, 255)));
  image(fourth, 0, height/4, width/4, height/2);

  float pointillizeFive = map((Math.min(fiveLevel, 30)), 0, 30, smallPoint, largePoint);
  int randPixelNum = (int)(random(five.pixels.length));
  int randPixel = five.pixels[randPixelNum];
  int xFive = randPixelNum%five.width;
  int yFive = randPixelNum/five.width;
  color pixFive = five.get(xFive, yFive);
  int[] cornerXY = getImageXandY(4);

  for (int i = 0; i < cornerXY.length; i++) {
    fill(pixFive, 128);
    ellipse(xFive + cornerXY[0], yFive + cornerXY[1], pointillizeFive, pointillizeFive);
  }

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