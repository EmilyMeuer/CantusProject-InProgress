/*
  05/30/2016
 Emily Meuer
 
 This is another way of going about the example in FrequencyAttempts,
 but using the Input object defined in the InputPitch tab
 rather than doing all the computations by hand in draw.
 
 The following error occurs when there are AudioInputs taking from the 
 same line in both this tab and the InputClass tab:
 "==== JavaSound Minim Error ====
  ==== Error acquiring TargetDataLine: line with format PCM_SIGNED 44100.0 Hz, 
  16 bit, stereo, 4 bytes/frame, little-endian not supported.
"
  Fixed by commenting out this in and using testInput.in for all input.
 */

Input testInput;
AudioInput in;
Minim minim;

void settings()
{
  size(512, 200);
}

void setup()
{
  testInput  = new Input();
//  minim = new Minim(this);
 // in = minim.getLineIn();
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
    stroke(note/5, 50+note/5, 20+note/5);
    //}

    x1 = map( i, 0, testInput.input.bufferSize(), 0, width );
    x2 = map( i+1, 0, testInput.input.bufferSize(), 0, width );
    //line(x1, 100+in.mix.get(i)*100, x2, 100+in.mix.get(i+1)*100);
    //line(i, 150+in.right.get(i)*50, i+1, 150+in.right.get(i+1)*50);
    line(x1, 100+testInput.input.mix.get(i)*100, x2, 100+testInput.input.mix.get(i+1)*100);
  }
  
  
  
}