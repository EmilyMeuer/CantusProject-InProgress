float l = 50;
float rad = 60;
float n = 6;
float angle1 = radians(180-(180*(n-2))/n);
float angle2 = radians(-108);

void setup(){
  background(0);
  size(600,600);
  strokeWeight(3);
  stroke(s);
}

void draw() {
  translate(width/2, height/2);
  for (int j = 0; j < n; j++){
    rotate(angle2);
//    translate(0,l);
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
  }
}