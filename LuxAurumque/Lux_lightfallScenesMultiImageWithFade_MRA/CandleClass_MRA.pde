class Candle {
  float xGlow;
  float yGlow;
  float xSpaced;
  float size;
  float curFreq;
  float speed;
  float gravity;
  float deg;
  float redTint;
  float greenTint;
  float blueTint;
  float sizeAdjust;
  
//Constructors with input variables
 Candle(float inDeg, float inRedTint, float inGreenTint, float inBlueTint, float inXSpaced, float inSizeAdjust){
   deg = inDeg;
   redTint = inRedTint;
   greenTint = inGreenTint;
   blueTint = inBlueTint;
   xSpaced = inXSpaced;
   sizeAdjust = inSizeAdjust;
   speed = 0;
   gravity = height/100;
 }

//methods

 void fall() {
    xGlow = xSpaced;
    size = 0.02*width*sizeAdjust;
    yGlow = yGlow + speed;
    speed = speed + gravity;
    if (yGlow>height+(height/50)){
      speed = speed * -0.3;
      yGlow = height+height/50;
    }
  }//void fall

  void resetYDrop(){
    yGlow = -height/10;
  }
  
  void hover(float inFreq, float inAmp) {
    xGlow = xSpaced;
    yGlow = height - inFreq*2;
    size = inAmp*width/2*sizeAdjust;
    constrain(yGlow,0,height);
  }//void hover
  
  void circle(float inAmp, float inXCenter, float inYCenter) {
    float rad = 100+5000*inAmp;
    xGlow = cos(radians(deg))*rad+inXCenter;
    yGlow = sin(radians(deg))*rad+inYCenter;
    constrain(xGlow, 0, width);
    constrain(yGlow, 0, height);
    size = inAmp*width/2*sizeAdjust;
    if (inAmp < 0.01) {
      deg = random(360);
    }
  }
 
 void freqPoints (float inFreq, float inAmp){
   size = inAmp*width*2*sizeAdjust;
   curFreq = inFreq;
   if ((curFreq > 250) && (curFreq < 300)){
     xGlow = 0.114*width;
     yGlow = 0.310*height;
   }
   if ((curFreq > 300) && (curFreq < 350)){
     xGlow = 0.813*width;
     yGlow = 0.388*height;
   }
   if (curFreq > 350){
     xGlow = 0.520*width;
     yGlow = 0.129*height;
   }
 }//void angels
 
 void highlight(float inAmp, float inXGlow, float inYGlow) {
   size = inAmp*width*1.5*sizeAdjust;
   xGlow = inXGlow;
   yGlow = inYGlow;
 }
 
 float getXGlow(){
   return xGlow;
 }
 float getYGlow(){
   return yGlow;
 }
 float getSize(){
 return size;
 }
 float getRedTint(){
    return redTint/100;
 }
 float getGreenTint(){
    return greenTint/100;
 }
 float getBlueTint(){
    return blueTint/100;
 }
}//class Shine