/**
 * LaToya McIntyre
 * Battleship
 * Player 1
 * CS 276
 * Fall 2019
 */
 
// Create the Attack port for the opponent and your ship viewing port

void setupGame() {
  
  //Player Label
  fill(255);
  textSize(32);
  text("PLAYER ONE", 50, 60);
  
  //Label for Opponent's Grid
  fill(255,0,0);
  textSize(25);
  text("Opponent's Grid", 750, 30);
  
  //Opponent's Ships Left
  textSize(25);
  fill(0);
  String s ="Opponent's Ships Remaining: ";
  rect(100,750, textWidth(s) + 10, 30);
  fill(255);   
  text(s, 100, 750, textWidth(s), 100);  
  text(5, textWidth(s)+ 95 , 775 );
  
  //Ready button  
  push();
  fill(125, 0, 0);
  rect(50, 100, 130, 60);
  fill(0);
  textSize(30);
  text("READY", 65, 140);
  pop();
  
  //current player's screen
  for (int cpX = 0; cpX<10; cpX++)
    for ( int cpY =0; cpY<10; cpY++)
      grid[cpX][cpY] = color(255);


  //mini version of opponent's screen
  for (int opX = 0; opX <10 ; opX++)
    for ( int opY =0; opY <10; opY++)
      oGrid[opX][opY] = color(255);
}


//Redraw the grids in order to keep the grid up to date
void drawGrid() {
  //player
  push();
  translate(200, 200);
  for (int col=0; col<10; col++) 
    for (int row=0; row<10;row++) { 
      fill(grid[col][row]);
      square(col*50, row*50, 50);
    }
  pop();

  //opponent
  push();
  translate(750, 50);
  for (int oCol=0; oCol<10; oCol++) 
    for (int oRow=0; oRow<10; oRow++) { 
      fill(oGrid[oCol][oRow]);
      square(oCol*20, oRow*20, 20);
    }
  pop();
}

void ready(){
    //Ready button  
  push();
  fill(0, 125, 0);
  rect(50, 100, 130, 60);
  fill(0);
  textSize(30);
  text("READY", 65, 140);
  pop();
  
};

void updateShipCount(int count){
  textSize(25);
  fill(0);
  String s ="Opponent's Ships Remaining: ";
  rect(100,750, textWidth(s) + 10, 30);
  fill(255);   
  text(s, 100, 750, textWidth(s), 100);  
  text(count, textWidth(s)+ 95 , 775 );
}
