// LaToya McIntyre
// A clap-on clap-off method to control when shapes are made

void clapMode(int clapCount, float vol){
    stroke(0);
    
    // Then start drawing shapes, sizes according to volume
    // until there is another clapp
    if(clapCount%2 == 1){
      makeShape(vol, shapeC[(int)random(0, 3)]);
        println("on");
    }else{
        println("off");
    }
     
}

void makeShape(float vol, String currentShape) {
  delay(10);
  fill( random(50, 125), random(75), random(50, 125));
  if (currentShape == "ellipse") {
    ellipse( random(20, width/vol), random(height/vol), vol * 30, vol * 30);
  } else if (currentShape == "square") {
    square( random(20, width/vol), random(height/vol), vol * 30);
  } else if ( currentShape == "circle") {
    circle( random(20, width/vol), random(height/vol), vol * 30);
  }
}
