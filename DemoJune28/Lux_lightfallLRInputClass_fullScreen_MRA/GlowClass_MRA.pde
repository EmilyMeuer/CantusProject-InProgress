class Glow {
  float xGlow;
  float yGlow;
  float size;
  float curFreq;
 //Constructor with input variable
 Glow(){
   xGlow = 0;
   yGlow = 0;
   scene = 1;
 }
 void angels (float inFreq, float inAmp){
   size = inAmp*width;
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
 float getRTint(){
    return 90;
 }
 float getGTint(){
    return 90;
 }
 float getBTint(){
    return 100;
 }
}//class Shine