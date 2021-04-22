// LaToya McIntyre
// Randomize the path of the word AREA

PFont font;
float angle = 0.0;
float xoff = 0.0;
String s  ="AREA";

void setup(){
  size(200,200);
  font = createFont("SourceCodePro-Light",48);
  textFont(font);
  fill(0);
}

void draw(){
  background(204);
  angle += 0.05;
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  for(int i =0; i< s.length(); i++){
    float c = sin(angle + i/PI);
    textSize((c+1.0)*15+10);
    fill(128,0,128);
    text(s.charAt(i), i*20+n, n);
  }

}
