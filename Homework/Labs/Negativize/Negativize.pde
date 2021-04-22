/*
 *  Negative
 *
 *  Create a negative of the given picture.
 *  Implementation of the Processing filter(INVERT)
 *
 *  Created May 2007 by rtomlinson
 *  Modified Sep 24 2007 by spc
 */

PImage myImage;
double a;

void setup() {
  myImage = loadImage("phoeky.png");
   myImage.resize(500,500);
  image(myImage, 0, 0);
  size(1200, 1000);

  noLoop();
}

void draw() {
  a = System.currentTimeMillis();
  negativize(myImage);
  println("Total Time", System.currentTimeMillis() - a, "\n Average time per pixel", 
          (System.currentTimeMillis() - a)/( 500*500));
  image(myImage, 600,0);
  save("negative.png");
}

/* negativize(myImage)
 *  reverse the image by subtracting each color value from max color value
 *  (assume 255).
 */
void negativize(PImage myImage) {

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



  /* myImage.loadPixels();
   
   for (int col = 0; col < myImage.width; col++) {
   for (int row = 0; row < myImage.height; row ++) {
   color c = myImage.get(col, row);
   // this is all there is to it
   c = color(255 - red(c), 255 - green(c), 255 - blue(c));
   myImage.set(col, row, c);
   }
   }  
   
   myImage.updatePixels();*/
}
