/*
 * Posterize - reduce the number of reds, greens, blues to 4 each.
 */
 
void postLNM(PImage img, int[] colors) {
  img.loadPixels();
  for(int row = 0; row < img.height; row++)
    for(int col = 0; col < img.width; col++)
    {
      color c = img.get(col, row);
      float r = red(c);
      float g = green(c);
      float b = blue(c);
 
      if (r < 64) {
         r = colors[0];
      }  else if (r < 128) {
         r = colors[1];
      } else if (r < 192) {
         r = colors[2];
      } else {
         r = colors[3];
      }
 
      if (g < 64) {
        g = colors[4];
      } else if (g < 128) {
        g = colors[5];
      } else if (g < 192) {
        g = colors[6];
      } else {
        g = colors[7];
      }
 
      if (b < 64) {
        b = colors[8];
      } else if (b < 128) {
        b = colors[9];
      } else if (b < 192) {
        b = colors[10];
      } else {
        b = colors[11];
      }
 
     img.set(col, row, color(r, g, b));
    }
 
  img.updatePixels();
}
