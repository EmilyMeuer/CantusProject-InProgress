//import sound.input;

Input testInput;

void setup()
{
//  size(700,700);
  testInput  = new Input();
  println("this is setup() and should be called before draw()).");
}

void draw()
{
  println("midi: " + testInput.getFreqAsMidiNote() + "  hz: " + testInput.getFreqAsHz());
//    background(testInput.getFreqAsMidiNote()/5, 0, 0);
}