PImage img,img1,img2,img3;

void setup(){
background(0);
size (1200,1000);
img = loadImage("IMG_6570.JPG");
img1 = loadImage("IMG_6584.JPG");
img2 = loadImage("IMG_6656.JPG");
img3 = loadImage("IMG_6717.JPG");
image(img,0,0,300,300);
image(img1,300,0,300,300);
image(img2,600,0,300,300);
image(img3,900,0,300,300);
noLoop(); //Needed bc otherwise it fades to black
}

void draw(){
  grayscale(img);
  image(img, 0, 300, 300,300);
  sepia(img1);
  image(img1, 300, 300, 300,300);
  charcoalish(img2);
  image(img2, 600,300,300,300);
  posterize(img3);
  image(img3, 900,300,300,300);


}
