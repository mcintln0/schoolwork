void gM(PImage pi) {
   // for each pixel in pixels array
   pi.loadPixels();
  
  for (int i = 0; i < pi.pixels.length; i++) { // all pixels              
      color c = pi.pixels[i];         
      float gray = red(c) + green(c) + blue(c);
      gray /= 3;
      c = color(gray, gray, gray);
      pi.pixels[i] = c;
    }
    
  pi.updatePixels();

}
