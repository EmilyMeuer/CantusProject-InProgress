import java.util.ArrayList;

/*
  Emily Meuer
 06/07/2016
 
 ArrayList wrapper class to enable easy dealings with multiple inputs.
 */

class MultipleInputs
{
  ArrayList<Input>  multipleInputs;

  /**
   * Constructor for creating an empty MultipleInputs object.
   */
  MultipleInputs()
  {
    this.multipleInputs = new ArrayList<Input>();
  } // constructor

  /**
   * Constructor for creating a new MultipleInputs object from an array of Strings
   * that correspond to names of audio files to be made into Input objects.
   */
  MultipleInputs(String[] inputNames)
  {
    if (inputNames == null) {  
      throw new IllegalArgumentException("MultipleInputsClass.constructor(String[]): String[] parameter " + inputNames + " is null.");
    }
    println("length = " + inputNames.length);
    this.multipleInputs  = new ArrayList<Input>();

    for (int i = 0; i < inputNames.length; i++)
    {
      this.multipleInputs.add(new Input(inputNames[i]));
    } // for
  } // constructor(String[])

  /**
   * Constructor for creating a new MultipleInputs object from an array of Input objects; 
   * simply fills the ArrayList instance var w/the given Input objects.
   */
  MultipleInputs(Input[] inputs)
  {
    if (inputs == null) {  
      throw new IllegalArgumentException("MultipleInputsClass.constructor(Input[]): Input[] parameter " + inputs + " is null.");
    }

    this.multipleInputs  = new ArrayList<Input>();

    for (int i = 0; i < inputs.length; i++)
    {
      this.multipleInputs.add(inputs[i]);
    } // for
  } // constructor(String[])

  /**
   * Constructor for creating a new MultipleInputs object from one audio file.
   *
   * @param  inputName  String corresponding to the name of an audio file.
   */
  MultipleInputs(String inputName)
  {
    this.multipleInputs  = new ArrayList<Input>();

    this.multipleInputs.add(new Input(inputName));
  } // constructor(String[])

  /**
   * Constructor for creating a new MultipleInputs object from one Input object.
   *
   * @param  input  Input object to be added to the ArrayList instance var.
   */
  MultipleInputs(Input input)
  {
    this.multipleInputs  = new ArrayList<Input>();

    this.multipleInputs.add(input);
  } // constructor(String[])

  Input get(int i)
  {
    return this.multipleInputs.get(i);
  } // get

  void add(String filename)
  {
    this.multipleInputs.add(new Input(filename));
  } // add

  void add(Input Input)
  {
    this.multipleInputs.add(Input);
  } // add

  int size()
  {
    return this.multipleInputs.size();
  } // size
} // MultipleInputs