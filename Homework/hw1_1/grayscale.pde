/*
 *  Grayscale
 *
 *  Convert image to grayscale.
 *
 *  Whenever R=G=B, you get gray;  to get the intensity of the gray, 
 *  average the rgb values.  Output the old and new RGB values and 
 *  display a grayscaled image
 *
 *  Implements the Processing function filter(GRAY);
 *
 *  Created May 2007 by rtomlinson
 *  Modified 24 Sep 2007 by spc
 */
 
  void grayscale(PImage pi) {
    // for each pixel in pixels array
    pi.loadPixels();

    for (int col = 0; col < pi.width; col++) {
      for (int row = 0; row < pi.height; row ++) {
        // grab the color
        color c = pi.get(col, row);
        // grayscale intensity is average of RGB values
        float gray = red(c) + green(c) + blue(c);
        gray /= 3;
        c = color(gray, gray, gray);
        pi.set(col, row, c);
      }
    }

    pi.updatePixels();
  }
