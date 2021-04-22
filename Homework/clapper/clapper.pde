// LaToya McIntyre
// Modified the function to start making shapes based
// on a clap-on clap-off methodology

/* ------------- */

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 20-6: Sound thresholding
// Modified to use Minim by spc 11/11/09

import ddf.minim.*;

Minim minim;
AudioInput in;

// Tested this in a space with the air conditioning on.
// Worked better with a louder measure of silence

float clapLevel = 0.9;  // How loud is a clap
float threshold = 0.7; // How quiet is silence

boolean clapping = false;
String[] shapeC = {"square", "circle", "ellipse"};
int count;

void setup() {
  size(400, 400);
  minim = new Minim(this);
  minim.debugOn();

  // connect to the builtin iMac microphone
  in = minim.getLineIn(Minim.MONO, 512);

  smooth();
  background(255);
  frameRate(30);
}

void draw() {
  // Get the overall volume level (between 0 and 1.0)
  // scaled by 1000 (because volume isn't what it used to be!)
  float vol = in.mix.level() * 200;
  println(vol);

  // If the volume is greater than 0.9, and we were 
  // not previously clapping, then we are clapping! 
  if (vol > clapLevel && !clapping) { 
    clapping = true; // now clapping!
    count++;
    println(count);
  } else if (clapping && vol < threshold) { 
    // Otherwise, if we were just clapping and the volume level has gone down below 0.25, then we are no longer clapping!
    clapping = false;
  }

  //starts drawing shapes based on a clap-on clap-off system
  clapMode( count, vol);

  // Graph the overall volume
  // First draw a background strip (a left bar)
  fill(200);
  rect(0, 0, 20, height);

  // Then draw a rectangle size according to volume
  fill(100);
  rect(0, height-vol*height/2, 20, vol*height/2);
}


// Close the sound engine
void stop() {
  in.close();
  minim.stop();
  super.stop();
}
