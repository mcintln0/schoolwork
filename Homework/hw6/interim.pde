// LaToya McIntyre
// Converts the soundfile into an Audiosample

AudioSample interim( SoundFile ac) {
  AudioSample dest;

  // load the sound to be copied
  int initialSize = ac.frames();
  float[] samples = new float [initialSize];
  float[] copy = new float [initialSize];

  // read SoundFile's sample buffer into array
  ac.read(samples);

  // copy every sample from SoundFile to sample 
  for (int j = 0; j < initialSize; j++) {
    
    // copy every  sample from original's sound buffer
    copy[j] = samples[j];
  }

  dest = new AudioSample(this, copy);
  return dest;
}
