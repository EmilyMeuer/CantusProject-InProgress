"Hello, World!".postln;

(
  5 + 5;
)
(
  var x;
  x = 5;
  x + x;
)

(
   var greeter =
   {
      arg name;
      ( "Hello" + name ).postln;
   };

   greeter.value( "Samantha" );
   greeter.value( "Jermain" );
   nil;
)

(
// the following would only work if getinput and add were defined:
   postln( add( getinput, getinput ) );
)

// Playing sound:
s.boot;
(
{ SinOsc.ar( 440, 0, 0.2 ); }.play;
)

(
{ SinOsc.ar( [[440, 445, 450, 455, 460, 465],
              [440, 445, 450, 455, 460, 465]],
             0,
             0.2 ); }.play;
)