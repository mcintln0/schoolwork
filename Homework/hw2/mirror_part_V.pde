// Create a vertical mirror image of the given object
// starting and ending at the specified coordinates
  void mirrorPartV(PImage pi, double sx, double sy, double fx, double fy) {
    if(sx> fx || sy > fy || sy > pi.height || sx > pi.width){
      println("The values entered are invalid");
      exit();
    }
    color leftPixel;
    
    double finishX = fx;
    double finishY = fy;
 
    pi.loadPixels();
    // loop through all columns
    for (double startX = sx; startX < finishX; startX++) {
      for (double startY = sy; startY < finishY; startY++) {
          leftPixel = pi.get((int)startX, (int)startY);
          pi.set((int)(pi.width - 1 - startX), (int)startY, leftPixel);
       }
    }
    pi.updatePixels();
  }
