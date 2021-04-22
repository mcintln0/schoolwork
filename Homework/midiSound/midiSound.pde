// LaToya McIntyre
// Fall 2019

/* Use the midi and sound library to trigger sounds based on the notes pressed
 * Definitely worked as intended. Just took a while to figure out the kinks.
 */

import themidibus.*;
import java.lang.reflect.Method;
import javax.sound.midi.MidiMessage; 
import processing.sound.*;

MidiBus myBus;
SinOsc sinOsc, sOsc;
String noteShape;
int colorR, colorG, colorB, noteP, currentVelocity;
int backgroundR, backgroundG, backgroundB, backgroundA;
int frameR;
int constantAlpha, constantC, constantScaleSq, constantScaleCi;
float dimensionA, dimensionB, dimensionC, dimensionD;

void setup() {
  size(1000, 1000);
  background(0);
  // MidiBus.list(); 
  myBus = new MidiBus(this, 1, 1); 
  constantAlpha = 255;
  constantScaleSq = 1;
  constantScaleCi = 1;
  colorR = 0;
  colorG = 0;
  colorB = 0;
  noteP = 0;
  currentVelocity = 0;

  dimensionA = 0;
  dimensionB = 0;
  dimensionC = 0;
  dimensionD = 0; 

  backgroundR = 0;
  backgroundG = 0;
  backgroundB = 0;
  backgroundA = 50;

  frameR = 60;

  // Create triangle wave and envelope 
  sinOsc = new SinOsc(this);
  sOsc = new SinOsc(this);
  
}

void draw() {
  frameRate(frameR);
  noStroke();
  fill(backgroundR, backgroundG, backgroundB, backgroundA);
  rect(0, 0, width, height);

  if (currentVelocity>0) {
    sinOsc.play(midiToFreq(noteP+24), 0.8);
    sOsc.play(midiToFreq(noteP+12), 0.4);
  } else{
    noteOff();
  }

  makeShape();
}

void makeShape() {
  fill( colorR, colorG, colorB, constantAlpha);
  if (noteShape == "ellipse") {
    ellipse( dimensionA, dimensionB, dimensionC, dimensionD+constantScaleCi);
  } else if (noteShape == "square") {
    square(dimensionA, dimensionB, dimensionC + constantScaleSq);
  } else if ( noteShape == "circle") {
    circle(dimensionA, dimensionB, dimensionC + constantScaleCi);
  }
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) {
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);
  println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  invokeNoteHandler(note, vel, bus_name);
}

void noteOff() {
  sOsc.stop();
  sinOsc.stop();
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}
