PImage      one;
PImage      two;
PImage      three;
PImage      four;
PImage      five;
PImage      six;
PImage      seven;
PImage      eight;
PImage      nine;

MultipleInputs a_one;
MultipleInputs b_two;
MultipleInputs c_three;
MultipleInputs d_four;
MultipleInputs e_five;
MultipleInputs f_six;
MultipleInputs g_seven;
MultipleInputs h_eight;
MultipleInputs i_nine;



/*FFT         fft;
AudioInput  input;
int         level;
Minim       minim;*/

void setup()
{
  fullScreen();
  
 /* minim  = new Minim(this);
  input = minim.getLineIn();*/
  
  one  = loadImage("one.jpeg");
  two  = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  
  one.resize(width/4,height/4); 
  two.resize(width/2,height/4); 
  three.resize(width/4,height/4); 
  four.resize(width/4,height/2); 
  five.resize(width/2,height/2); 
  six.resize(width/4,height/2); 
  seven.resize(width/4,height/4); 
  eight.resize(width/2,height/4); 
  nine.resize(width/4,height/4); 
  
  a_one = new MultipleInputs("WM parts - Tenor.mp3");
  b_two = new MultipleInputs("WM parts - Tenor.mp3");
  c_three = new MultipleInputs("WM parts - Tenor.mp3");
  d_four = new MultipleInputs("WM parts - Tenor.mp3");
  e_five = new MultipleInputs("WM parts - Tenor.mp3");
  f_six = new MultipleInputs("WM parts - Tenor.mp3");
  g_seven = new MultipleInputs("WM parts - Tenor.mp3");
  h_eight = new MultipleInputs("WM parts - Tenor.mp3");
  i_nine = new MultipleInputs("WM parts - Tenor.mp3");
  
}

void draw()
{
  
  image (one,0,0);
  image (two,width/4,0);
  image (three,(3*(width/4)),0);
  image (four,0,height/4);
  image (five,width/4,height/4);
  image (six,(3*(width/4)),height/4);
  image (seven,0,(3*(height/4)));
  image (eight,width/4,(3*(height/4)));
  image (nine,(3*(width/4)),(3*(height/4)));
  
 /* // volume of input:
  level  = (int)Math.floor(input.mix.level() * 1500);
  background(pepper);
  
  
  // volume used to adjust the transparency:
  tint(255,(Math.min(level,255)));
  image(piano,0,0,384,640);*/
}