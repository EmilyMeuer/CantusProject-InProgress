class Raindrop {
  float xDrop;
  float yDrop;
  float size;
  float speed;
  float gravity;
//Constructor with input variable
  Raindrop(float inputXDrop){
    xDrop = inputXDrop;
    yDrop = -height/10;
    speed = 0;
    gravity = 5;
    size = 0.03*width;
  }

  void fall() {
    yDrop = yDrop + speed;
    speed = speed + gravity;
    if (yDrop>height+(height/10)){
      speed = speed * -0.3;
      yDrop = height+10;
    }
  }//void fall
  
  void hover(float inFreq, float inAmp) {
    yDrop = height - inFreq*3;
    size = inAmp*width/2;
    constrain(yDrop,0,height);
  }//void hover
  
  float getXDrop(){
    return xDrop;
  }
  float getYDrop(){
    return yDrop;
  }
  float getSize(){
    return size;
  }
  void resetYDrop(){
    yDrop = -height/10;
  }
}//class Raindrop