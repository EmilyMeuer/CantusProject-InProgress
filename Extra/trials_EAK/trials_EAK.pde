
MultipleInputs a;





void setup (){
  
  a = new MultipleInputs("WM parts - Tenor.mp3");
  
  a.add("WM parts - Bass.mp3");

}

void draw() {
  InputPitch tenor;
  tenor = a.get(0);
  
  InputPitch bass = a.get(1);
  float w = tenor.getAmplitude();
  
}