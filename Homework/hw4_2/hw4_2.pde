PImage img;
int pointsize = 5;

void setup() {
  size(189,252);
  img = loadImage("IMG_1316.JPG");
  img.resize(189, 252);
  background(255);
  smooth();
}

void draw() {
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Back to shapes! Instead of setting a pixel, we use the color 
  // from a pixel to draw a circle.
  fill(r,g,b,100);
  ellipse(x,y,pointsize,pointsize); 
}
