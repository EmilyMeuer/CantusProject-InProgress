class Raindrop {
  float xDrop;
  float yDrop;
  float size;
  float speed;
  float gravity;
  float sizeAdjust = 0.25;
//Constructor with input variable
    Raindrop () {
    xDrop = random(width);
    yDrop = -height/10;
    speed = 0;
    gravity = 5;
    size = 0.03*width;
  }

  void fall() {
    yDrop = yDrop + speed;
    speed = speed + gravity;
    if (yDrop>height+(height/50)){
      speed = speed * -0.3;
      yDrop = height+height/50;
    }
  }//void fall

  void resetYDrop(){
    yDrop = -height/10;
    xDrop = random(width);
  }
  
  void hover(float inFreq, float inAmp) {
    yDrop = height - inFreq*2;
    size = inAmp*width*sizeAdjust;
    constrain(yDrop,0,height);
  }//void hover
  
  void circle(float inAmp) {
    float deg;
    float rad = 100;
//    pushMatrix();
    translate(width/2, height/2);
    deg = random(360);
    xDrop = cos(deg)*rad;
    yDrop = sin(deg)*rad;
    size = inAmp*width/2;
//    popMatrix();
  }
  
  float getXDrop(){
    return xDrop;
  }
  float getYDrop(){
    return yDrop;
  }
  float getSize(){
    return size;
  }
  float getRTint(){
    return 100;
  }
  float getGTint(){
    return 85;
  }
  float getBTint(){
    return 50;
  }
}//class Raindrop