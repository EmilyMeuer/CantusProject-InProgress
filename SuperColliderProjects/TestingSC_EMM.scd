/*
Emily Meuer
06/20/2016

Trying to figure out how to use SuperCollider.

Notes:
- ar = audio rate
- kr = control rate
*/

s.boot;
x = Synth.basicNew("default", s); // Create without sending
s.sendBundle(nil, x.newMsg;); // Now send a message; create at the head of s' default group
s.queryAllNodes;
x.free;

// After creation, use instance methods newMsg, addToHeadMsg, addToTailMsg, addBeforeMsg, addAfterMsg, addReplaceMsg to instantiate this synth on the server. See Instance Methods below.

{ [SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)] }.play;

{ SoundIn.ar(2)}.value;
"Hello!";

f = { "Function evaluated".postln; };
f.value;

{ SoundIn.ar(0, 1, 0) }.scope(zoom: 10);

SoundIn.dumpFullInterface
SoundIn.browse;

(
var oscBundle;
oscBundle = SoundIn.asOSCArgBundle;
oscBundle.value;
)
// Now all that I need to do is send that oscBundle ^ to Processing.  (Will I be able to get my float[] right away, or will I have to put that into the bundle separately?