void nM(PImage myImage) {
  
  myImage.loadPixels();

  for (int i = 0; i < myImage.pixels.length; i++) { // all pixels              
      color c = myImage.pixels[i];         
      c = color(255-red(c), 255-green(c), 255-blue(c));  
      myImage.pixels[i] = c;
  }
  myImage.updatePixels();

}
