/*
  05/30/2016
 Emily Meuer
 
 Daft Punk Visualization
 
 { Look into arcs: https://processing.org/reference/arc_.html }
 
 { Background boxes/stripes - like GeoDash }
 { Background line - GeoDash, Fractating/Fractal by Herzilo }
 
 *** Line through the shapes - to begin;
 Break at beat-boxing - hop out individually. -- only one beatboxer?
 
 Beat-boxing:
 - circle growing larger
 - circle w/in a circle / two circles moving away from each other
 
 Use PVector to move shapes?
 
 --
 Deal with this at some point:
 ==== JavaSound Minim Error ====
 ==== Couldn't find a sketchPath method on the file loading object provided!
 ==== File recording will be disabled.
 
 ==== JavaSound Minim Error ====
 ==== Couldn't find a createInput method in the file loading object provided!
 ==== File loading will be disabled.
 
 */

PShape circle;
Input  input;

void settings()
{
  size(400, 400);
}

void setup()
{
  background(0);

  input  = new Input();
  circle  = createShape(ELLIPSE, 0, 0, 100, 100);
}

void draw()
{
  background(0);

  color yellow = color(255, 255, 0);
  circle.setStroke(yellow);
  circle.setStrokeWeight(25);
  circle.setFill(color(0));

  println("freq: " + input.getFreqAsHz() + "; amplitude = " + input.getAmplitude());

  input.setFreq();
  translate(width/2, (height - input.adjustedFreq.asHz()/2));

  shape(circle);

  //ellipse(width/2, input.getFreqAsHz()/2, 100, 100); //input.getAmplitude(), input.getAmplitude());
}