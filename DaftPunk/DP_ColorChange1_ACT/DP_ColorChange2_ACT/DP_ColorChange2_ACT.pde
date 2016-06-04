/*
  05/30/2016
 Emily Meuer
 
 This is another way of going about the example in FrequencyAttempts,
 but using the Input object defined in the InputPitch tab
 rather than doing all the computations by hand in draw.
 */

Input testInput;
AudioInput in;
Minim minim;

void settings()
{
  size(1000, 400);
}

void setup()
{
  println("in setup");
  testInput  = new Input();
//  minim = new Minim(this);
//  in = minim.getLineIn();
}

void draw()
{
  //testInput  = new Input();
  // print is not necessary, but gives you a behind-the-scenes peek at the numbers:
  //println("midi: " + testInput.getFreqAsMidiNote() + "  hz: " + testInput.getFreqAsHz());

  // divide value by 5 b/c too large for a color value otherwise:
  //background(testInput.getFreqAsHz() / 5, 0, 0);

  // this version less sensitive, b/c midi notes are less exact:
  //background(testInput.getFreqAsMidiNote() * 2, 0, 0);

  background(0);

  float  note = testInput.getFreqAsHz();
  float  x1;
  float  x2;


  for (int i=0; i< testInput.input.bufferSize()-1; i++)
  {
    //if((note/5)>255)
    // {
    // stroke(255);
    //}
    //else
    //{
    stroke(40+note/7, 20+note/7, 80+note/7);
    //}

    x1 = map( i, 0, testInput.input.bufferSize(), 0, width );
    x2 = map( i+1, 0, testInput.input.bufferSize(), 0, width );
    //line(x1, 100+in.mix.get(i)*100, x2, 100+in.mix.get(i+1)*100);
    //line(i, 150+in.right.get(i)*50, i+1, 150+in.right.get(i+1)*50);
    line(x1, 200+testInput.input.mix.get(i)*100, x2, 200+testInput.input.mix.get(i+1)*100);
  }
  
  
  
}