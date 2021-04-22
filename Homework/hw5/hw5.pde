

PImage img;

void setup(){
  selectInput("Select a photo to process:", "fileSelected");
  size(600,600);
  background(255);
  while(img == null){
    delay(100);
  }
    img.resize(width/2, height/2);
    image(img, 0,0);
  }


void draw(){
  text("Coordinates of the mouse:" + mouseX +","+ mouseY, width/2 +10, 50);
  text("Red value:" + red(img.get(mouseX, mouseY)), width/2 +10, 70);
  text("Blue value:" + blue(img.get(mouseX, mouseY)), width/2 +10, 90);
  text("Green value:" + green(img.get(mouseX, mouseY)), width/2 +10, 110);

}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    img = loadImage(selection.getAbsolutePath());
  }
}
