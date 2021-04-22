/* LaToya McIntyre
 * Create a collage using transparency
 * the transparency levels are generated 
 * through the mask function 
 */
 
PImage img, img2;

void setup(){
background(255);
img2 = loadImage("IMG_1201.png");
img = loadImage("IMG_1201.png");
img.mask(img);
size(480,635);
noLoop();
}

void draw(){
 //The original image
 pushMatrix();
 tint(255,200);
 image(img2,0,0);
 popMatrix();
 
 pushMatrix();
 // A second copy of the image with a 50% transparency
 rotate(-150);
 translate(width/2,0);
 tint(255,128);
 img2.resize(288, 381);
 image(img2, 50,50);
 popMatrix();
 
 pushMatrix();
 rotate(50);
 translate(25,0);
 tint(128,0,0,128);
 img2.resize(96, 127);
 image(img2, 0,25);
 popMatrix();
 
 //A third copy of the image utilizing the masked image
 //Underneath is a rect to make sure the  mask is visible
 tint(128,0,128);
 rotate(50);
 img.resize(192,254);
 fill(255,200);
 rect(250,150,192,254);
 image(img, 250,150);
 save("collage.jpg");
}
