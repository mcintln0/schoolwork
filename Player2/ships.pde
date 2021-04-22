/**
 * LaToya McIntyre
 * Battleship
 * Player 2
 * CS 276
 * Fall 2019
 */


class Battleship {
  float xCoord, yCoord;
  int boatWidth, boatHeight;
  int hitCount = 0;

  Battleship(int w, int h) {
    boatWidth = w;
    boatHeight = h;
  }


  // The shape of the ship is added to the board on the player's screen
  void draw(float xB, float yB, int circles) {
    xCoord = xB;
    yCoord = yB;
    fill(0, 0, 125, 200);
    ellipse(xB, yB, boatWidth, boatHeight);
    //circles on the battleship
    fill(125, 0, 125);
    for (int i = 0; i< circles; i++) {
      ellipse(xB, (yB-30)+20*i, 20, 20);
    }
  }

  // Adding ships based on the grid
  void gridDraw(float mX, float mY, int circles) {
    //  translate(200,200);
    for (int i=0; i<10; i++) 
      for (int j=0; j<10; j++) {
        int x = 200 + i*50;
        int y = 200 + j*50;
        if (mX > x && mX < (x + 50) && mY > y && mY < (y + 50)) {
          xCoord = 200 + i*50;
          yCoord = 200 + j*50;
          fill(0, 0, 125, 200);

          ellipse(xCoord+25, yCoord, boatWidth, boatHeight);
          //circles on the battleship
          fill(125, 0, 125);
          for (int c = 0; c< circles; c++) {
            ellipse(xCoord+25, (yCoord-30)+25*c, 20, 20);
          }
        }
      }
  }



  // Redrawing
  void draw(float xB, float yB, int bW, int bH, int circles) {
    fill(0, 0, 125, 200);
    ellipse(xB, yB, bW, bH);
    //circles on the battleship
    fill(125, 0, 125);
    for (int i = 0; i< circles; i++) {
      ellipse(xB, (yB-30)+20*i, 20, 20);
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
      hitCount++;

      /*
      //Trigger sound if ship was hit
       hitShots = new OscMessage("/hit"); 
       hitShots.add("/damaged");
       hitShots.add(4);
       oscP5.send(hitShots, gamerIP); */

      if (hitCount == 4)
        isDead();
      return true;
    } else {
      return false;
    }
  }

  void isDead() {
    shipCount--;
    /*
    //Trigger sound if ship was hit
     hitShots = new OscMessage("/hit"); 
     hitShots.add("/dead");
     hitShots.add(10);
     oscP5.send(hitShots, gamerIP);
     }
     */
  }
}
