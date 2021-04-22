/**
 * LaToya McIntyre
 * Battleship
 * Player 1
 * CS 276
 * Fall 2019
 */

//Checks to see if a ship has been hit yet

void checkShips(float x, float y) {
 for ( int shp = 0; shp < 5; shp++) {
    ship[shp].isHit(x, y);
  } 
}

void drawShips(Battleship[] boats){
  for(int i =0; i<boats.length; i++)
    boats[i].draw(boats[i].xCoord +25,
                  boats[i].yCoord,
                  boats[i].boatWidth, 
                  boats[i].boatHeight,3 );
  
}
