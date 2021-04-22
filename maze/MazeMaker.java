package CS257.maze;

// LaToya McIntyre
// Class of 2020
// March 2018

/*

General

This is the MazeMaker. In a seperate client create a file that will be used to
construct the maze. Below are instructions on how best to create this file.

----------------------------------Construction--------------------------------

Start the file with: 

"Size int"  --represents the dimensions of the individual squares in the grid
"Width in"t --represents the number of squares in the width and height of the 
              grid
"Start int int int int" -- in order the values represent x and y coordinate
                           of the top left point where the grid starts and the 
                           row and column number of the starting point

        !!!Leaving out any of the above will cause an error message!!!

The Maze should be designed using North, South, East and West (as written). The captilization and spelling is important when it comes to making any paths that
will veer away from the main path. Using an "*" before any of the directional 
paths will allow an alternative path to be created without forgetting the ending 
square of the main path. 

Ex. *North 5
	**South 3
    *West 3
 -- DO NOT PUT A SPACE BETWEEN THE ASTERICK AND THE DIRECTION

These can stacked without causing any errors but it is up to the user to make
sure there maze has a start and finish. The program does not check to make sure 
your maze can be solved. All directions should be followed with an integer 
indicating the number of squares that will be covered by the maze in the 
intended direction. The integer does not include the square that you land on nor 
the starting square. If any of the path goes outside of the grid an error will
occur. The best way to trace these errors is ith the MazeTester client. 


End the file with:
"Finish 0" -- this tells the annotate the finish point of the maze. Without this
              the program will still run but the user might not know where the
              maze ends

*/

import objectdraw.*;
import java.awt.*;
import java.util.*;
import java.io.*;

public class MazeMaker{

  private FilledRect[][] grid;
  private Scanner maze;
  private String word;					
  private int number, size, width, startX, startY, insetX,insetY, gridR, gridC;
  private FilledRect fin;

  public MazeMaker(String filename, Color pathColor, Color mazeColor,
                   DrawingCanvas canvas) throws 	
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
    grid = new FilledRect[width][width];				
    for(int i = 0; i< grid.length; i++)
      for(int j = 0; j<grid[i].length;j++){			
        grid[i][j]=new FilledRect(startX+size*j, startY+size*i, 	
                                  size,size,canvas);
        grid[i][j].setColor(mazeColor);
      } // End for loop

    // Annotates the start point
    if(startX+insetX*size > startX+width*size){ // starts from the right
      new Text("Start", startX+insetX*size+size, startY+insetY*size,canvas);
    }else if(startX+insetX*size <= startX){          // starts from left
      new Text("Start", startX+insetX*size-size-5, startY+insetY*size,canvas);
    }else if(startY+insetY*size <= startY){          // starts from the top
      new Text("Start", startX+insetX*size, startY+insetY*size-size,canvas);
    }else{                                           // starts from the bottom
    new Text("Start", startX+insetX*size, startY+insetY*size+size,canvas);
    }

    // Creates the border for the maze
    new FramedRect( (double) startX, (double) startY, (double)(width*size),
                    (double) (width*size),canvas).setColor(Color.BLUE);

    create(filename,pathColor, canvas);
 									
  } // Ends the MazeMaker


  public MazeMaker(String filename, DrawingCanvas canvas) throws 	
                                         FileNotFoundException{
    this(filename, Color.WHITE, Color.BLACK, canvas);
  }


  public MazeMaker(String filename, Color mazeColor, DrawingCanvas canvas) 
                   throws FileNotFoundException{
    this(filename, Color.WHITE, mazeColor , canvas);
  }

  public void create(String filename, Color pathColor, DrawingCanvas canvas){
    gridR = insetY;
    gridC = insetX;
    grid[gridR][gridC].setColor(pathColor);

    solution(pathColor, canvas);

  } // Ends Create Method

  public void solution(Color pathColor, DrawingCanvas canvas){
    word = maze.next();
    number = maze.nextInt();

    while( maze.hasNext() ){

      if( word.equalsIgnoreCase("North") ){
        for(int i = 1; i<=number; i++)
          grid[gridR-i][gridC].setColor(pathColor);
        gridR = gridR-number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("South") ){
        for(int i = 1; i<=number; i++)
          grid[gridR+i][gridC].setColor(pathColor);
        gridR=gridR+number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("East") ){
        for(int i = 1; i<=number; i++)
          grid[gridR][gridC+i].setColor(pathColor);
        gridC=gridC+number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("West") ){
        for(int i = 1; i<=number; i++)
          grid[gridR][gridC-i].setColor(pathColor);
        gridC=gridC-number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if(word.startsWith("*") ){
        int tempR = gridR;
        int tempC = gridC;
        increment(0, tempR, tempC, pathColor);

      } // Ends if statements

      if( word.equalsIgnoreCase("Finish") ){

        // Annotates the fin point
        if(fin.getY() <= startY){                         // ends at top
          new Text("Finish",fin.getX(),(double)(fin.getY()-size), canvas);
        }else if(fin.getY() >= startY+width*size-size){    // ends at bottom
          new Text("Finish",fin.getX(),(double)(fin.getY()+2*size), canvas);
        }else if(fin.getX() >= startX+width*size-size){   // ends right
          new Text("Finish",(double)(fin.getX()+size+5),fin.getY(),canvas);
        }else{                                            // ends left
          new Text("Finish",(double)(fin.getX()-2*size),fin.getY(), canvas);
        }
      }

    } // End while loop

  } // End solution method


  public void increment(int incrementLevel, int tR, int tC, Color pathColor){

    while(word.startsWith("*",incrementLevel) ){

      if(word.startsWith("*",incrementLevel+1) ){
        increment(incrementLevel+1, tR, tC,pathColor);

      }else if( word.endsWith("North") ){
        for(int i = 1; i<=number; i++)
             grid[tR-i][tC].setColor(pathColor);
        tR = tR-number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("South") ){
        for(int i = 1; i<=number; i++)
             grid[tR+i][tC].setColor(pathColor);
        tR=tR+number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("East") ){
        for(int i = 1; i<=number; i++)
             grid[tR][tC+i].setColor(pathColor);
        tC+=number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("West") ){
        for(int i = 1; i<=number; i++)
           grid[tR][tC-i].setColor(pathColor);
         tC-=number;
         word = maze.next();
         number = maze.nextInt();

      } // Ends if statements

    } // Ends while loop

  } // End increment method
 
} // End File
