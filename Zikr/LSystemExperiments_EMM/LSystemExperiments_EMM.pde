/** 
 * Emily Meuer
 * 06/04/2016
 * 
 * Originally "PenroseTile":
 *
 * "Penrose Tile L-System 
 * by Geraldine Sarmiento.
 *  
 * This code was based on Patrick Dwyer's L-System class."
 *
 * To make an LSystem: 
 * simulate(numOfGenerations) in setup,
 * then render() in draw.
 *
 */

PenroseLSystem ds;
Input  input;
LSystem  ls;

void setup() {
  size(640, 360);
  ds = new PenroseLSystem();
  ds.simulate(4);

  ls = new LSystem();
  ls.simulate(4);
  
  input = new Input();
}

void draw() {
  background(0);
  if(input.getAmplitude() > .5)
  stroke(0 + input.getFreqAsHz()/7);
//  ls.render();
  ds.render();
}