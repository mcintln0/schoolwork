// LaToya McIntyre
// A function designed to convert frame float values into pixels

PImage sound2image( AudioSample sample, float high, float low) {

  float[] frames = new float[sample.frames() * sample.channels()];
  sample.read(frames);

  // create an image with an area equal to the 
  // number of samples of the sound file
  PImage img = createImage(ceil(sqrt(sample.frames())), ceil(sqrt(sample.frames())), RGB);  
  img.loadPixels();


  // map the sounds to pixels depending on threshold values
  for ( int i = 0; i < frames.length; i++) {

    if ( frames[i] > high) {
      img.pixels[i] = color(255, 0, 0);
    } else if ( frames[i] < low) {
      img.pixels[i] = color(0, 0, 255);
    } else {
      img.pixels[i] = color(0, 255, 0);
    }
  }
  println( "High threshold " + high + "\nlow threshold " + low);
  img.updatePixels();

  return img;
}
