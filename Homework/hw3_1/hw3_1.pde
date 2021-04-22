// LaToya McIntyre
// Random scrolling Words

PFont font;
float x1 = 0.0;
float x2 = 0.0;
float x3 = 0.0;
int i = (int)random(0,4);
int j = (int)random(0,4);
int k = (int)random(0,4);
String[] words = {"one", "two", "three", "four", "five"};

void setup(){
  size(150,150);
  font = createFont("SourceCodePro-Light",36);
  textFont(font);
  fill(0);
}

void draw(){
  background(204);
  fill(0);
  text(words[i], x1, 50);
  fill(128,0,128);
  text(words[j], x2, 75);
  fill(0,128,0);
  text(words[k], x3, 100);
  
  x1+= 1.0;
  if(x1 >100)
    x1 = -200;
  
  x2 -= 0.8;
  if(x2 <-200)
  x2= 100;
  
  x3+= .5;
  if(x3 > 150)
  x3 = 20;
}

void mousePressed(){
  save("type.jpg");
}
