Input testInput;

void settings()
{
   fullScreen();
}

void setup()
{
   testInput  = new Input();
}

void draw()
{ 
  background(255);
  
  float a;
  a = testInput.getFreqAsHz()/5;
  
  if (a<190){
  fill(0,a+50,0);
  ellipse(500,500,100,100);
  }
  
  if (a>190 && a<200);{
  fill(a,0,0);
  ellipse(500,500,100,100);
  }
  
  if (a>200){
  fill(0,0,a);
  ellipse(500,500,100,100);
  }
  
}