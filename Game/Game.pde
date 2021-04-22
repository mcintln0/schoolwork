/**
 * LaToya McIntyre
 * Battleship
 * Player 1
 * CS 276
 * Fall 2019
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress gamerIP, puredata;
int xCoord, yCoord;
int shipCount = 0;
boolean turn = true;
boolean gameStarted = false;
boolean newMsg = false;
PImage bg;
OscMessage gameMove, nexTurn, hitShots;
Battleship[] ship = new Battleship[5];

//grid representations
color[][] grid = new color[10][10];
color[][] oGrid = new color[10][10];

void setup() {
  size(1000, 1000);
  bg = loadImage("battle.jpg");
  image(bg, 0, 0);

  setupGame();
  drawGrid();

  /* start oscP5, listening for incoming messages at port 9001 */
  oscP5 = new OscP5(this, 9001);

  /* Replace numbers with IP address, and port of opponnent   */
  gamerIP = new NetAddress("127.0.0.1", 12000);

  /* Puredata port and ip adddress */
  puredata = new NetAddress("127.0.0.1", 8000);

  for (int i = 0; i< 5; i++)
    ship[i] = new Battleship(50, 150);
}

void draw() {
  if (newMsg == true) {
    drawGrid();
    drawShips(ship);
    newMsg = false;
  }
}

void mousePressed() {

  //Setup your ships
  //Each ship is three squares wide and one square tall

  if (!gameStarted && shipCount < 5) {
    ship[shipCount].gridDraw(mouseX, mouseY, 3);
    shipCount++;
  } else if ( !gameStarted && shipCount == 5) {
    gameStarted = true;
    gameMove = new OscMessage("/start"); 
    gameMove.add("Ready!");
    ready();
    oscP5.send(gameMove, gamerIP);
    gameMove.clear();
  }
  /* ------------------------------------------------------------*/
  /* Once the game has started the players will alternate moves */


  if (turn && gameStarted) {
    /* in the following different ways of creating osc messages are shown by example */

    //The shot
    gameMove = new OscMessage("/shot");

    //Change player to opponent
    gameMove.add(2);

    if (mouseX >= 750 && mouseX <= 950) {

      //Add info of which grid was shot and update ship Count
      updateGridOpp(mouseX, mouseY);
      gameMove.add(shipCount);

      /* send the message */
      oscP5.send(gameMove, gamerIP);
      gameMove.clear();
      turn = false;
      
      
      hitShots = new OscMessage("/shot");
      hitShots.add(440);
      hitShots.add(75);

      /* send the message */
      oscP5.send(hitShots, puredata);
      hitShots.clear();

    }
  }
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage nexTurn) {

  if (nexTurn.checkAddrPattern("/start") == true) {
    if (nexTurn.get(1).stringValue().equals("Ready!")) {
      println("Start the Game");
      gameMove = new OscMessage("/shot");

      /* send the message */
      oscP5.send(gameMove, gamerIP);
      gameMove.clear();
    }
  }

  // Player 1
  if (nexTurn.get(0).intValue() == 1) {
    turn = true;
  } else {
    turn = false;
  }


  // check the addrPattern then trigger the necessary functions
  if (nexTurn.checkAddrPattern("/shot") == true) {
    int gridColA = nexTurn.get(1).intValue();
    int gridRowA = nexTurn.get(2).intValue();
    checkShips(mouseX, mouseY);


    // Update player grid based on opponent's shot
    updateGridPlayer(gridColA, gridRowA);

    //Update ships Left
    updateShipCount(nexTurn.get(3).intValue());
  }  

  // Print who's turn it is and where the last shot landed
  //nexTurn.print();
  println(" Player's Turn: " + nexTurn.get(0).intValue());
  println(" Square Attacked: ["+ nexTurn.get(1).intValue()+ "]" +
    "["+ nexTurn.get(2).intValue() + "]");
  println(" Opponent Ships Left: "+ nexTurn.get(3).intValue());

  if ( nexTurn.get(3).intValue() == 0 || shipCount == 0) {
    textSize(200);
    rect(0, 0, width, height);
    fill(255);
    text("GAMEOVER", width/2-textWidth("GAMEOVER"), 500);
  }

  newMsg = true;
}
