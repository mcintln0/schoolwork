// LaToya McIntyre
// modifies the echo of the sample by manipulating the max delay,
// the feedback, and the delay time itself

void echo(float del){
  delay.time(del);
  delay.feedback(del);
  
}
