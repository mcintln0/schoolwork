void setup(){
  size(100,100);
  noStroke();
}

void draw(){
  background(0);
  int mx = constrain(mouseX, 35, 65);
  int my = constrain(mouseY, 40,60);
  fill(102);
  rect(20,25,60,50);
  fill(125,5,125);
  ellipse(mx,my,30,30);
  save("20_20.jpg");
}
