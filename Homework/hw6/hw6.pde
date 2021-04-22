// LaToya McIntyre
// Map a sound to an image


import processing.sound.*;
SoundFile sounds;
AudioSample sam, imgS;
PImage soundimage;

void setup() {
  size(1000, 1000);
  sounds = new SoundFile (this, "11 A Change Is Gonna Come.mp3");
  sam = interim(sounds);

  soundimage = sound2image( sam, 0.03, -0.03);
//  soundimage = loadImage( "flower.jpg");


  imgS = image2sound(soundimage, 0.03, -0.03);
  noLoop();
}

void draw() {
  image(soundimage, 0, 0);
  save("point.jpeg");
  println("Image is :" + soundimage.width + " by " + soundimage.height); 
  println("\nSoundfile is: " + sounds.duration() + "secs");
  println("\nSoundfile has: " + sounds.channels() + " channels");
}

void mousePressed() {
  
  // play the image loaded sound
  imgS.play(2);
}
