/*
 *  Negative
 *
 *  Create a negative of the given picture.
 *  Implementation of the Processing filter(INVERT)
 *
 *  Created May 2007 by rtomlinson
 *  Modified Sep 24 2007 by spc
 */

/* negaM(myImage)
 *  reverse the image by subtracting each color value from max color value through direct access
 *  (assume 255).
 */
 
void negaM(PImage myImage) {
  myImage.loadPixels();

  for (int y = 0; y < myImage.height; y++) { // each row     
    for (int x = 0; x < myImage.width; x++) { // each column         
      int i = y*myImage.width + x; // compute index         
      color c = myImage.pixels[i];         
      c = color(255-red(c), 255-green(c), 255-blue(c));  
      myImage.pixels[i] = c;
    }
  }
  
  myImage.updatePixels();

}
