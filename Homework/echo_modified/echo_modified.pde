// LaToya McIntyre
// Echo a sound file through a different function

import processing.sound.*;
AudioSample ayA;
Delay delay;
float range;

void setup() {
  size(256, 200);
  background(125, 0, 125);

  // load sounds into a new SoundFile
  ayA = new SoundFile(this, "thisisatest.wav");
  
  // Echo sound file
  delay =  new Delay(this);  
   
  delay.process(ayA,2);
  
  // Wanted to make it interactive but I got too many error messages,
  // so I modifed my function slightly to make it work. 
    ayA.play();
}


void draw() {

  // constrain the delay value
  range = constrain(mouseX, 0,2);
  
  // Function takes a float value to modifiy the echo
  echo(range);
}
  
