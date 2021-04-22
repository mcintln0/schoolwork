PImage img,img1,img2;

void setup(){
background(0);
size (500,700);
img = loadImage("IMG_1201.png");
img.resize(240,320);
img2 =  loadImage("IMG_1201.png");
img2.resize(240,320);
image(img,0,0);
noLoop();
}

void draw(){
  mirrorPartH(img, 50,50,150,200 );
  image(img, 240, 0);
  mirrorPartV(img2, 50,50,150,200);
  image(img2, 0, 320);
  save("mirror.jpg");
}
