// LaToya McIntyre
// Normalize the audioSample

void normalize(AudioSample chan) {
  float largest;
  float[] samples = new float [chan.frames()];
 
  // read samples from AudioSample into samples array
  chan.read(samples);
 
  // find the largest amplitude in the sample buffer
  largest = maxSample(samples);
  println(largest);
 
  // compute a multiplier
  float mult = 1.0 / largest;
 
  // apply the multiplier to every sample
  for (int i = 0; i < samples.length; i++) {
    samples[i] *= mult;
  }
 
  // write the samples back into the sample buffer
  chan.write(samples);
}

float maxSample(float[] samples) {
  float largest = 0;
  for (int i = 0; i < samples.length; i++) {
    float absolute = abs(samples[i]);
    if (largest < absolute)
      largest = absolute;
  }
  return largest;
}
 
