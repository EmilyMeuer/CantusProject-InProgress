package testPackage;

class Demo
{
  int var;
  
  Demo(int var)
  {
    this.var = var;
  } // constructor
  
  void test()
  {
    text("var = " + this.var, width/4,height/4);
  }
} // class