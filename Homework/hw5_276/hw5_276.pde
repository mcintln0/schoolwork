// LaToya McIntyre
// Manipulate three sound files through pitch modification, volume changes
// and normalization

import processing.sound.*;
SoundFile fileA, fileB, fileC, orgA, orgB;
AudioSample pitchC;
String currentSound;

void setup() {
  size(256, 200);
  background(125, 0, 125);

  // load sounds into a new SoundFile
  fileA = new SoundFile(this, "ay.wav");
  fileB = new SoundFile(this, "square440.wav");
  fileC = new SoundFile(this, "bassoon-c4.wav");

  // Unmodified sound files
  orgA = new SoundFile(this, "ay.wav");
  orgB = new SoundFile(this, "square440.wav");

  // Modifying the Soundfiles
  normalize(fileA);
  modify(fileB, .2);
  pitchC = pitchChange(fileC);
  
  noLoop();
}


void draw() {

  fill(0);

  // Soundfile A

  // currentSound string is updated for each sound played
  currentSound = "Ay.wav unmodifed";
  println(currentSound);
  orgA.play();

  delay(1500);

  currentSound = "Ay.wav normalized";
    println(currentSound);
  fileA.play();

  delay(1500);

  // Soundfile B

  currentSound = "square440.wav unmodifed";
  println(currentSound);
  orgB.play();
  delay(1500);


  currentSound = "square440.wav volume change";
    println(currentSound);
  fileB.play();
  delay(1500);

  // Soundfile C

  currentSound = "bassoon-c4.wav unmodifed";
    println(currentSound);
  fileC.play();
  delay(2000);
  // The basssoon song is longer than the others. Needed a manual stop
  fileC.stop();

  currentSound = "bassoon-c4.wav pitch changed";
  println(currentSound);
  pitchC.play();
  delay(1500);

}
