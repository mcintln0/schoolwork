// LaToya McIntyre
// A function designed to convert pixels to frame float values

AudioSample image2sound( PImage image, float high, float low) {

  // load pixels from the image
  image.loadPixels();

  // create frames for the audiosample
  float[] fram = new float[ceil(image.width * image.height)];

  // map the sounds to pixels depending on threshold values
  for ( int i = 0; i < image.pixels.length; i++) {

    if (red(image.pixels[i]) == 255) {
     fram[i] = high;
    } else if ( blue( image.pixels[i]) == 255 ) {
      fram[i] = low;
    } else {
      // green values are 0
     fram[i] = 0;
    }
  }
  
  println( "High threshold " + high + "\nLow threshold " + low);
  AudioSample samp = new AudioSample( this, fram);
  return samp;
}
