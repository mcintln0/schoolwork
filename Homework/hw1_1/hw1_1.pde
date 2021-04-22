/*
 * LaToya McIntyre
 * CS276
 * HW 1
 * Use grayscale and negativize on three images
 * to determine the timings
 */

PImage small,medium,large;
double a,b,c,d,e,f;

void setup() {
 
  small = loadImage("IMG_9650.JPG");
  medium = loadImage("IMG_3097.JPG");
  large = loadImage("IMG_6714.JPG");
  small.resize(250,250);
  medium.resize(500,500);
  large.resize(1000,1000);
  image(small, 0, 0);
  image(medium,0,250);
  image(large, 0,750);
  size(3000, 2000);
  noLoop();
}

void draw() {
  //Timing for the small picture
  a = System.currentTimeMillis();
  gM(small);
  b = System.currentTimeMillis();
  
  //Timing for the medium picture
  c = System.currentTimeMillis();
  gM(medium);
  d = System.currentTimeMillis();
  
  //Timing for the large picture
  e = System.currentTimeMillis();
  gM(large);
  f = System.currentTimeMillis();
  
  println("Single Loop Negativize Time for small image", b - a, "\n Average time per pixel", 
          (b - a)/( 250*250));
  println("Single Loop Negativize Time for medium image", d - c, "\n Average time per pixel", 
          (d-c)/( 500*500));
 println("Single Loop Negativize Time for large image", f-e, "\n Average time per pixel", 
          (f-e)/( 1000*1000));          
  image(small, 250,0);
  image(medium,250,250);
  image(large,1000,750);
 // save("negative.png");
}
