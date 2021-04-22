// LaToya McIntyre
// Bouncing Ball with speed modifier

float x = 0;
float speed = 1;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  x = x + speed;

  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(x,100,32,32);
  
  text("("+ x +", 100)" ,x,80);
}

void keyPressed(){
  if(keyCode == UP){
   speed *= 1.25;
 } 
 
 if(keyCode == DOWN){
   speed *= 0.8; 
 }
  
}

void mousePressed(){
  save("ball.jpg");
}
