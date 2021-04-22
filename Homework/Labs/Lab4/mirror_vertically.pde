// Note: this code example only shows the function needed to perform the operation.
// You need to provide your own setup() and draw() or other functions to test it.

// Function to mirror an image around a vertical line 

void mirrorVertical(PImage pi) {
    int middlePoint = pi.width / 2;
    color leftPixel, rightPixel;

    pi.loadPixels();
    // loop through all rows
    for (int y = 0; y < pi.height; y++) {
       // loop through all columns
       for (int x = 0; x < middlePoint; x++) {
          leftPixel = pi.get(x, y);
          // this is the method without a separate DestinationX variable
          // put the color into the pixel at (width-1) - x
          pi.set(pi.width - 1 - x, y, leftPixel);
       }
    }
    pi.updatePixels();
} 
