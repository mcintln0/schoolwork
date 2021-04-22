// LaToya McIntyre
// Restrict the possible percentage values between 0 and 1
// Then modifying the amplitude based on the restrained percentage

void modify(AudioSample b, float percentage){
  
  // restrict the percentage to a value between 0 and 1
  percentage = constrain(percentage, 0, 1.0);

  // modify the amplitude of the file
  b.amp(percentage);
}
