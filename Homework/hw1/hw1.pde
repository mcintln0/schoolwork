/* LaToya McIntyre
* Posterizing Sketch
* Edits a photo, with two different arrays of posterizing values
*/

PImage img,img2;
int[] values1 =  {125,255,20,45,89,100,235,137,109,37,29,178};
int[]  values2 = {200,100,79,10,48,72,123,53,91,204,176,17};

  
void setup(){
  size(750,250);
  img = loadImage("IMG_2768.JPG");
  img.resize(250,200);
  img2 = img;
  image(img,0,0);
  noLoop();
}

void draw(){
 postLNM(img, values1);
  image(img,250,0);
  postLNM(img, values2);
  image(img2,500,0);
  save("postLNM.JPG"); 

}
