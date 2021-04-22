// LaToya McIntyre
// CS276
// HW 4

PImage img, img3;

void setup(){
  background(255);
  size(500,500);
  img = loadImage("IMG_1404.JPG");
  img3 = loadImage("IMG_0846.jpg");
  img.resize(252,189);
  img3.resize(140,189);
  image(img, 0,0);
  image(img3, 255,0);  
  noLoop();
}

void draw(){
    PImage img2 = blur(img);
    PImage img4 = blur(img3);
    charcoalish(img2);
    charcoalish(img4);
    image( img2, 0,200);
    image( img4, 255,200);
}
  
