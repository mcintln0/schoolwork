/*
 *  Negative
 *
 *  Create a negative of the given picture.
 *  Implementation of the Processing filter(INVERT)
 *
 *  Created May 2007 by rtomlinson
 *  Modified Sep 24 2007 by spc
 */

/* negativize(myImage)
 *  reverse the image by subtracting each color value from max color value
 *  (assume 255).
 */
 
void negativize(PImage myImage) {
  myImage.loadPixels();

  for (int col = 0; col < myImage.width; col++) {
    for (int row = 0; row < myImage.height; row ++) {
      color c = myImage.get(col, row);
      // this is all there is to it
      c = color(255 - red(c), 255 - green(c), 255 - blue(c));
      myImage.set(col, row, c);
    }
  }  

  myImage.updatePixels();
}
