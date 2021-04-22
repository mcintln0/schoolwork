import processing.video.*;

// Size of each cell in the grid, ratio of window size to video size
int videoScale = 8;
// Number of columns and rows in our system
int cols, rows;
// Variable to hold onto Capture object
Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, "FaceTime HD Camera");
  video.start();
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {

  video.loadPixels();

  // Pick a random point
  int x = int(random(video.width));
  int y = int(random(video.height));
  int loc = x + y*video.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
  noStroke();
  
  // Back to shapes! Instead of setting a pixel, we use the color 
  // from a pixel to draw a circle.
  fill(r,g,b,100);
  ellipse(x,y,5,5); 
   
}
