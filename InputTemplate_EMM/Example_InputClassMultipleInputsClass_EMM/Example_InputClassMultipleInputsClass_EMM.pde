/**
 * Emily Meuer
 * created 06/13/2016
 *
 * How to use the Input and MultipleInputs classes.
 */
 
MultipleInputs  multInputsA;
MultipleInputs  multInputsB1;
MultipleInputs  multInputsB2;
Input           singleInput;

void setup()
{
  size(500,500);
  background(255, 150, 250);
  //  There are 3 ways to create ("initialize") a MultipleInputs object:
  
  // Number 1: pass no arguments (that is, don't give it any parameters) and create an empty MultipleInputs:
  multInputsA = new MultipleInputs();
  // This new object - multInputsA - is empty; its basically an array, ready and waiting to hold Input objects.
  
  // Chances are that you will want to fill it with something, which you can do with the add() method:
  multInputsA.add("DP parts - Bass 1.mp3");
  multInputsA.add("DP parts - Bass 2.mp3");
  multInputsA.add("DP parts - Tenor 1.mp3");
  multInputsA.add("DP parts - Tenor 2.mp3");
  // While this add() isn't strictly necessary, having an empty MultipleInputs doesn't really do you much good,
  // so if you use method no. 1 to make your MultipleInputs, you'll probalby end up filling it like this, with add(String).
  
  // Number 2:
  // This method takes an array of filenames as Strings; there are two ways to go about it:
  //   v. 1 - create the Array first, then pass it to the constructor: (constructor = the function "MultipleInputs()")
  String[] filenames = { "DP parts - Bass 1.mp3",
                         "DP parts - Bass 2.mp3",
                         "DP parts - Tenor 1.mp3",
                         "DP parts - Tenor 2.mp3"  
                       };
   multInputsB1 = new MultipleInputs(filenames);
   
   //  v. 2 - create the array and the new MultipleInputs object all in one fell swoop (my personal favorite):
   multInputsB2 = new MultipleInputs(new String[] { "DP parts - Bass 1.mp3", 
                                                    "DP parts - Bass 2.mp3", 
                                                    "DP parts - Tenor 1.mp3", 
                                                    "DP parts - Tenor 2.mp3" 
                                                  });
                           // Not strictly necessary to put them each on their own line - but doesn't it look nice? ;)
   
   // Number 3:
   // Pass an array of Input objects.
   // This method is just the same as Number2, except that you have to initialize the Input objects first,
   // then put them in an array (as in no. 2), then pass them to the constructor (also as in no. 2).
   // If you want to see this method, I'll put it in here, but I don't see why you wouldn't just always want to use method 2. :)
} // setup()

void draw()
{
  // Using a MultipleInputs object:
  
  // this is the absolutely necessary line:
  multInputsA.get(0);
  
  // ^ that is an Input object.  You can either save it as a variable for further use...
  Input curInput;
  curInput = multInputsA.get(0);
  // ... or use it directly:
  float pitch = multInputsA.get(0).getAdjustedFundAsHz();
  
  // for reference, the following line has the same result as the previous one:
  float samePitch = curInput.getAdjustedFundAsHz();
  
  // Once you have an Input object, you can call the following functions:
  
  curInput.getAdjustedFund();  //  returns a Frequency object with the current fundamental of the Input, 
                               // but only for frequencies above a particular amplitude (see "setSensitivity()").
  curInput.getAdjustedFundAsHz();        // returns the current fundamental of the Input in hertz as a float,
                                         // adjusted, as above, to ignore frequencies below a certain amplitude.
  curInput.getAdjustedFundAsMidiNote();  // returns the current fundamental of the Input as a midi note, as a float.
                                        // adjusted, as above, to ignore frequencies below a certain amplitude.
  curInput.getAmplitude();    // returns the amplitude of the Input -- that is, [input or player].mix.level;
  curInput.setSensitivity(0.5);  // sets the amplitude level below which the adjusted fundamental should ignore a frequency.
  
  // You will probably not want to use these, as they are highly sensitive to background noise:
  curInput.getFund();      // returns a Frequency object with the current fundamental of the input;
                           // does not ignore small amplitudes and so is highly affected by background noise.
  curInput.getFundAsHz();  // returns the current fundamental of the Input in hertz as a float; does not ignore low amplitudes.
  curInput.getFundAsMidiNote(); // returns the current fundamental of the Input as a midi note, as a float; does not ignore low amplitudes.
  
  // But we're all good on the fact that those lines did nothing, correct?  That is, they called the functions,
  // but unless I either use those numbers - e.g.,
  background(curInput.getAdjustedFundAsHz() / 2, 0, curInput.getAdjustedFundAsHz() / 3);

  // - or store them as variables, - e.g.,
  float curAmp = curInput.getAmplitude();
  // - they do nothing.  They have no effect on the program.  They sit there in space, never able to be reached by man.
  
  // (and maybe your prof's used this in 130, but "curAmp" = "current amplitude"; non significat "why", ut Latine. ;))
  
  // (For more color variance - and another example of using these classes - , 
  //comment out line 91 (setting the background above) and uncomment line 93 (below):)
//  background(curInput.getAdjustedFundAsHz() / 2, 0, multInputsA.get(1).getAdjustedFundAsHz() / 3);
} // draw()