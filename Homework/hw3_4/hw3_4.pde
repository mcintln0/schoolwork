// LaToya McIntyre
// Stock Scroller

PFont font;
float x1;
int i = 0;
String[] stockInfo;

void setup() {
  size(500, 500);
  font = createFont("SourceCodePro-Light", 36);
  textFont(font);
  fill(0);
  stockInfo = loadStrings("stocks.txt");
  x1 = 0;
}


void draw() {
  background(204);
  textAlign(LEFT);
  text(stockInfo[i],x1, 100); 
  x1 += 5;
  
  //Makes the next line wait until the first is off screen
  float tracker = textWidth(stockInfo[i]);
  if (x1 > width + tracker){
    x1 = -tracker;
    i++;
  if ( i>= stockInfo.length)
    i = 0;
  }
}
