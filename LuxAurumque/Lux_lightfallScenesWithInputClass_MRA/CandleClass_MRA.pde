class Candle {
  float xGlow;
  float yGlow;
  float xFall;
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
 Candle(float inDeg, float inRedTint, float inGreenTint, float inBlueTint, float inXFall, float inSizeAdjust){
   deg = inDeg;
   redTint = inRedTint;
   greenTint = inGreenTint;
   blueTint = inBlueTint;
   sizeAdjust = inSizeAdjust;
   xFall = inXFall;
   yGlow = -height/10;
   speed = 0;
   gravity = 5;
 }
  Candle(float inDeg, float inRedTint, float inGreenTint, float inBlueTint, float inXFall){
   deg = inDeg;
   redTint = inRedTint;
   greenTint = inGreenTint;
   blueTint = inBlueTint;
   xFall = inXFall;
   yGlow = -height/10;
   speed = 0;
   gravity = 5;
   size = 0.03*width;
 }

//methods

 void fall() {
    xGlow = xFall;
    size = 0.02*width;
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
    yGlow = height - inFreq*2;
    size = inAmp*width/2;
    constrain(yGlow,0,height);
  }//void hover
  
  void circle(float inAmp) {
    float rad = 100+5000*inAmp;
    xGlow = cos(radians(deg))*rad+width/1.5;
    yGlow = sin(radians(deg))*rad+height/3;
    constrain(xGlow, 0, width);
    constrain(yGlow, 0, height);
    size = inAmp*width/2;
    if (inAmp < 0.01) {
      deg = random(360);
    }
  }
 
 void angels (float inFreq, float inAmp){
   size = inAmp*width*2;
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
 
 void nativity(float inAmp) {
   size = inAmp*width;
   xGlow = 0.50*width;
   yGlow = 0.60*height;
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
    return redTint;
 }
 float getGreenTint(){
    return greenTint;
 }
 float getBlueTint(){
    return blueTint;
 }
 float getSizeAdjust(){
   return sizeAdjust;
 }
}//class Shine