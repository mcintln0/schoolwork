package CS257.maze;


// LaToya McIntyre
// Class of 2020
// April 2018

/*

This is the MazeSolver. After the Maze file has been created, use the MazeMaker 
and the MazeSolver simultaneously to watch your maze being solved. Instructions
for how to create the file can be found in the MazeMaker file.

              ** Note this only works for solvable mazes! **

--------------------------------------------------------------------------------


*/

import objectdraw.*;
import java.awt.*;
import java.util.*;
import java.io.*;

public class MazeSolver extends ActiveObject{

  private FilledOval[][] grid;
  private Scanner maze;
  private String word;					
  private int number, size, width, startX, startY, insetX,insetY, gridR, gridC;

  public MazeSolver(String filename,DrawingCanvas canvas) throws 	
                                           FileNotFoundException{
    insetX = -1;
    maze = new Scanner(new File (filename));

    while( insetX == -1){

      word = maze.next();
      number = maze.nextInt();

      if( word.equalsIgnoreCase("size") ){
        size = number;							
				
      }else if( word.equalsIgnoreCase("width") ){
        width = number;

      }else if( word.equalsIgnoreCase("start") ){
        startX = number;
        startY = maze.nextInt();
        insetY = maze.nextInt();						
        insetX = maze.nextInt();
      }

    } // Ends the while statement

    // Create the 'empty' grid
    grid = new FilledOval[width][width];				
    for(int i = 0; i< grid.length; i++)
      for(int j = 0; j<grid[i].length;j++){			
        grid[i][j] = new FilledOval(startX+size*j, startY+size*i, 	
                                  size,size,canvas);
        grid[i][j].setColor(Color.RED);
        grid[i][j].sendToBack();
      } // End for loop

    gridR = insetY;
    gridC = insetX;
    grid[gridR][gridC].sendToFront();
    start();
				
  } // Ends the MazeSolver

  public void run(){
    solve();
    int r = 0, g = 0, b = 0;
    int dr = 1;
    int db = 100; //(int)(255/path.size());
    grid[insetY][insetX].setColor(new Color(r,g,b) );
    for( FilledOval o :path ){
      o.sendToFront();
      o.setColor(new Color(r,g,b) );
      pause(50);
      /* if(!(0<=r && r<255) ){
        dr = -dr;
      }else if(r<=0){
        r=0;
        dr = 1;   
      }
      if(!(0<b && b<=255) ){
        b = db = 0;
      } */

      b=Math.abs((b+db))%255;
      r=Math.abs((r+dr))%255;
      

    }

  }

  private ArrayList<FilledOval> path = new ArrayList<FilledOval>();

  public void solve(){

        word = maze.next();
        number = maze.nextInt();

    while( maze.hasNext() ){
      if( word.equalsIgnoreCase("North") ){
        for(int i = 1; i<=number; i++)
          path.add(grid[gridR-i][gridC]);
        gridR = gridR-number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.equalsIgnoreCase("South") ){
        for(int i = 1; i<=number; i++)
          path.add(grid[gridR+i][gridC]);
        gridR=gridR+number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.equalsIgnoreCase("East") ){
        for(int i = 1; i<=number; i++)
          path.add(grid[gridR][gridC+i]);
        gridC=gridC+number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.equalsIgnoreCase("West") ){
        for(int i = 1; i<=number; i++)
          path.add(grid[gridR][gridC-i]);
        gridC=gridC-number;
        word = maze.next();
        number = maze.nextInt();

      }else if(word.startsWith("*") ){
        word = maze.next();
        number = maze.nextInt();
      } // Ends if statements

    } // End while loop

  } // End solution method
 
} // End File
