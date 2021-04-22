/**
 * LaToya McIntyre
 * Battleship
 * Player 1
 * CS 276
 * Fall 2019
 */

// Update miniature grid and send grid info to opponent

void updateGridOpp(float mX, float mY) {
  // updates the player's grid
  for (int i=0; i<10; i++) 
    for (int j=0; j<10; j++) {
      int x = 750 + i*20;
      int y = 50  + j*20;
      if (mX > x && mX < (x + 20) && mY > y && mY < (y + 20)) {
        oGrid[i][j] = color(0, 0, 125);
        gameMove.add(new int[]{i, j});
      }
    }

  drawGrid();
  drawShips(ship);
}
