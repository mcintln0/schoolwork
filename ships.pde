class Battleship {
  float xCoord, yCoord;
  int boatWidth, boatHeight;
  int hitCount = 0;
  
  Battleship(int w, int h) {
    boatWidth = w;
    boatHeight = h;
  }


  // The shape of the ship is added to the board on the player's screen
  void draw(float xB, float yB, float wB, float hB, int circles) {
    xCoord = xB;
    yCoord = yB;
    ellipseMode(CORNERS);
    ellipse(xB, yB, xB+wB, yB + hB);
    //circles on the battleship
    for (int i = 0; i< circles; i++) {
      float j = yB+(xB+5)*(i+1);
      ellipse(xB+5, j+5*i, 35, j+5*i+ 20);
    }
  }

  float[] getLocation() {
    //sends an array of the starting (x,y) and ending (x,y)
    float[] info = {xCoord, yCoord, boatWidth, boatHeight};
    return info;
  }
  
  boolean isHit(float shotX, float shotY) {
    if ( (shotX >= xCoord) && (shotX <= xCoord + boatWidth) && 
      (shotY >= yCoord && shotY <= yCoord + boatHeight)) {
      nexTurn.add("You got me :/");
      hitCount++;
      return true;
    } else {
      nexTurn.add("Missed Me :P ");
      return false;
    }
  }

  boolean isDead() {
    if ( hitCount == boatHeight) 
      return true;
    else
      return false;
  }
}
