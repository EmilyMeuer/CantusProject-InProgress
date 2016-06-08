/*
  * 6/5/2016
  * Amanda Tenhoff
  * This code is for changing the colors of shapes
  * using audio input.
  * This particular file makes the shapes
  * grow and shrink with frequency.
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
  //println("in setup");
  testInput  = new Input();
  background(0);
}

void draw()
{
  float  note = testInput.getFreqAsHz();
/*  float  x1;
  float  x2;

  for (int i=0; i< testInput.input.bufferSize()-1; i++)
  {
    stroke(40+note/7, 20+note/7, 80+note/7);
    x1 = map( i, 0, testInput.input.bufferSize(), 0, width );
    x2 = map( i+1, 0, testInput.input.bufferSize(), 0, width );
    line(x1, 200+testInput.input.mix.get(i)*100, x2, 200+testInput.input.mix.get(i+1)*100);
  }
*/
  stroke(255);
  fill(255-(40+note/7), 255-(20+note/7), 255-(80+note/7));
  rectMode(CENTER);
  rect(500,200,note/7,note/7);
  
}