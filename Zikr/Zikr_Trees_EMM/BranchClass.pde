// could make leaf array

class Branch
{
  float   angle;
  PVector begin;
  PVector end;
  boolean  finished;
  
  Branch(PVector begin, PVector end)
  {
    this.begin  = begin;
    this.end    = end;
    this.finished  = false;
    this.angle  = PI / 3;
  } // constructor
  
  void show()
  {
    stroke(255);
    line(this.begin.x, this.begin.y, this.end.x, this.end.y);
  } // show
  
  //merge these duplicate branches into one function:
  Branch branchA()
  {
    PVector  dir  = PVector.sub(end,begin);
    dir.rotate(angle);
    dir.mult(0.67);
    PVector  newEnd  = PVector.add(this.end, dir);
    Branch right  = new Branch(this.end, newEnd);
    return right;
  } // branch
  
  Branch branchB()
  {
    PVector  dir  = PVector.sub(end,begin);
    dir.rotate(-angle);
    dir.mult(0.67);
    PVector  newEnd  = PVector.add(this.end, dir);
    Branch left  = new Branch(this.end, newEnd);
    return left;
  } // branch
} // Branch