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
send("192.168.0.42",s, 0, 0);
)

// Now all that I need to do is send that oscBundle ^ to Processing.  (Will I be able to get my float[] right away, or will I have to put that into the bundle separately?

// Examples from the tutorial: "http://doc.sccode.org/Tutorials/Getting-Started/11-Busses.html"

In.ar(0, 1); // returns an OutputProxy
In.ar(0, 4); // returns an OutputProxy[]

s.reboot; // this will restart the server and thus reset the bus allocators

b = Bus.control(s, 2);    // a 2 channel control Bus
b.index;         // this should be zero
b.numChannels         // Bus also has a numChannels method
c = Bus.control(s);
c.numChannels;        // the default number of channels is 1
c.index;        // note that this is 2; b uses 0 and 1

// world's most expensive patchcord (use headphones to avoid feedback)
{ SoundIn.ar(0) }.play;

// stereo version
{ SoundIn.ar([0, 1]) }.play;

// scope input; silent output
{ Amplitude.kr(SoundIn.ar([0,1])); }.scope;

// from Node Messaging: "http://doc.sccode.org/Guides/NodeMessaging.html"
(
SynthDef("grain", {
    Out.ar(0, Line.kr(0.1, 0, 0.01, doneAction:2) * FSinOsc.ar(12000))
}).send(s);
)

(
Routine({
    20.do({
        s.sendMsg("/s_new", "grain", -1);
        1.0.wait;
    })
}).play;
)