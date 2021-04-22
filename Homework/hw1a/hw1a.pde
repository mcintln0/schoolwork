/* LaToya McIntyre
* Thresholding Sketch
* Produces a thresholded image based on the mouse placement
*/

PImage img, img2;

void setup(){
   size(1000,1000);
  img = loadImage("IMG_1438.JPG");
  img.resize(500,500);
  image(img,0,0);
 
}

void draw(){
  float range = map(mouseX, 0, width, 0, 250);

  fill(0);
  rect(500,0,500,500);
  img2 = threshold(img, range);
  image(img2,500,0);
  
}
