/**
 * Battleship
 * Player 1
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress gamerIP;
int xCoord, yCoord;
int shipCount = 0;
boolean turn = true;
boolean newMsg = false;
boolean gameStarted = true;
OscMessage gameMove, nexTurn;
Battleship[] ship = new Battleship[5];

//grid representations
color[][] grid = new color[10][10];
color[][] oGrid = new color[10][10];

void setup() {
  size(1000, 1000);
  background(color(101, 101, 101));


  setupGame();
  drawGrid();

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 9001);
  println("ip address" + oscP5.ip());

  /* Replace numbers with IP address, and port of opponnent   */
  gamerIP = new NetAddress("157.92.123.59", 12000);

  for (int i = 0; i<5; i++)
    ship[i] = new Battleship(150, 50);

}

void draw() {
    if (newMsg) {
    // try drawing a rectangle at the sent coordinates
    fill(random(256), random(256), random(256));
    rect((float) xCoord, (float) yCoord, 30, 50);
    newMsg = false;
    } 
}

void mouseClicked() {

  //Setup your ships
  //Each ship is three squares wide and one square tall
/*
  if (!gameStarted && shipCount < 5) {
    ship[shipCount].draw(mouseX, mouseY, 150, 50, 3);
    shipCount++;
    gameMove = new OscMessage("/start"); 
    gameMove.add("Not Ready!");
    oscP5.send(startGame, gamerIP);
    gameMove.clear();
  } else if ( !gameStarted && shipCount >= 5) {
    gameStarted = true;
    gameMove = new OscMessage("/start"); 
    gameMove.add("Ready!");
    oscP5.send(startGame, gamerIP);
    gameMove.clear();
  }

  /* Once the game has started the players will alternate moves */


  if (turn && gameStarted) {
    /* in the following different ways of creating osc messages are shown by example */

    //The shot
    gameMove = new OscMessage("/shot");

    //Change player to opponent
    gameMove.add(2);

    //Add info of which grid was shot
    updateGridOpp(mouseX, mouseY);
    checkShips(mouseX, mouseY);

    /* send the message */
    oscP5.send(gameMove, gamerIP);
    //gameMove.clear();
  }
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage nexTurn) {
  print("### received an osc message.");

  if (nexTurn.checkAddrPattern("/start") == true) {
    if (nexTurn.get(1).stringValue().equals("Ready!")) {
      println("Start the Game");
      gameMove = new OscMessage("/shot");

      // Change to player 2
      gameMove.add(2);

      //Add info of which grid was shot
      updateGridOpp(mouseX, mouseY);

      /* send the message */
      oscP5.send(gameMove, gamerIP);
      println("did it make it");
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

    // Update player grid based on opponent;s shot
    updateGridPlayer(gridColA, gridRowA);
  }  

  /* print the address pattern and the typetag of the received OscMessage */
  println(" addrpattern: "+ nexTurn.addrPattern());
  println(" typetag: " + nexTurn.typetag());
  //nexTurn.print();
  println(" Player's Turn: " + nexTurn.get(0).intValue());
  println(" Square Attacked: ["+ nexTurn.get(1).intValue()+ "]" +
    "["+ nexTurn.get(2).intValue() + "]");
    newMsg = true;
}
