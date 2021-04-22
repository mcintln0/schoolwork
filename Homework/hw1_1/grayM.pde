/*
 *  Grayscale
 *  grayscale(image)
 *    edit image through direct access
 */
void grayM(PImage pi) {
   // for each pixel in pixels array
   pi.loadPixels();
  
  for (int y = 0; y < pi.height; y++) { // each row     
    for (int x = 0; x < pi.width; x++) { // each column         
      int i = y*pi.width + x; // compute index         
      color c = pi.pixels[i];         
      float gray = red(c) + green(c) + blue(c);
      gray /= 3;
      c = color(gray, gray, gray);
      pi.pixels[i] = c;
    }
  }
    
  pi.updatePixels();

}
