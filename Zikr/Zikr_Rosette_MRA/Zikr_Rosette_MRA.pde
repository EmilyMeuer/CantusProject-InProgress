float l = 50;

void setup(){
  background(0);
  size(600,600);
  strokeWeight(3);
}

void draw() {
  translate(50,50);
  rosette();
  translate(0,l*6);
  rosette();
  translate(0,l*6);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(0,-l*6);
  rosette();
  translate(l*5.2,0);
  rosette();
  translate(0,l*6);
  rosette();
  translate(0,l*6);
  rosette();
}

void rosette() {
  float n = 6;
  float angle1 = radians(180-(180*(n-2))/n);
  float angle2 = radians(240);
  int b = 50;
  for (int j = 0; j < n; j++){
    rotate(angle2);
    stroke(150,0,b);
    for (int i = 0; i < n; i++){ //draws one hexagon
      line(0,0,0,l);
      translate(0,l);
      rotate(angle1);
      if (i == 3){
        rotate(-angle1);
        pushMatrix();
        rotate(angle1);
      }
    }//one hexagon
    popMatrix();
    b += 30;
  }
}