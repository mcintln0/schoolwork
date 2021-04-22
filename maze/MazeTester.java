package CS257.maze;

// LaToya McIntyre

/*

This is the MazeTester. It allows you to make the maze and see each process step
by step. If you are unsure of what you maze will look like, or want to test run
before showing others, this is the best class to use. Each block is outlined,
and all directions are color coded, to make it easier to see how your code is
being processed. Each additional path you make branching off the main path is
also color coded so that editing is easier to do.

*/

import objectdraw.*;
import java.awt.*;
import java.util.*;
import java.io.*;

public class MazeTester{

  private FilledRect[][] grid;
  private Scanner maze;
  private String word;					
  private int number, size, width, startX, startY, insetX,insetY, gridR, gridC;
  private FilledRect fin;
  private Text start;

  public MazeTester(String filename, DrawingCanvas canvas) throws 	
                                           FileNotFoundException{
    start = new Text("Start", startX+insetX*size+size, 
                                startY+insetY*size,canvas);
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

    // Creates the grid
    grid = new FilledRect[width][width];				
    for(int i = 0; i< grid.length; i++)
      for(int j = 0; j<grid[i].length;j++){			
        grid[i][j]=new FilledRect(startX+size*j, startY+size*i, 	
                                  size,size,canvas);
        new FramedRect(startX+size*j, startY+size*i, 	
                                  size,size,canvas).setColor(Color.WHITE);
      }

    // Annotates the start point
    start.sendToFront();
    start.setColor(Color.RED);
    if(startX+insetX*size > startX+width*size){ // starts from the right
      start.moveTo(startX+insetX*size+size, startY+insetY*size);
    }else if(startX+insetX*size <= startX){          // starts from left
      start.moveTo(startX+insetX*size-size-5, startY+insetY*size);
    }else if(startY+insetY*size <= startY){          // starts from the top
      start.moveTo(startX+insetX*size, startY+insetY*size-size);
    }else{                                           // starts from the bottom
      start.moveTo(startX+insetX*size, startY+insetY*size+size);
    }

    new FramedRect( (double) startX, (double) startY, (double)(width*size),
                    (double) (width*size),canvas).setColor(Color.BLUE);

    create(filename,canvas);
 									
  } // Ends the MazeMaker

  public void create(String filename, DrawingCanvas canvas){
    gridR = insetY;
    gridC = insetX;
    grid[gridR][gridC].setColor(Color.WHITE);

    solution(canvas);

  } // Ends Create Method

  public void solution(DrawingCanvas canvas){
    word = maze.next();
    number = maze.nextInt();

    while( maze.hasNext() ){
	System.out.printf("\n word %s num %d", word, number);
      if( word.equalsIgnoreCase("North") ){
        for(int i = 1; i<=number; i++)
          grid[gridR-i][gridC].setColor(Color.RED);
        gridR = gridR-number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("South") ){
        for(int i = 1; i<=number; i++)
          grid[gridR+i][gridC].setColor(Color.BLUE);
        gridR=gridR+number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("East") ){
        for(int i = 1; i<=number; i++)
          grid[gridR][gridC+i].setColor(Color.ORANGE);
        gridC=gridC+number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if( word.equalsIgnoreCase("West") ){
        for(int i = 1; i<=number; i++)
          grid[gridR][gridC-i].setColor(Color.GREEN);
        gridC=gridC-number;
        word = maze.next();
        number = maze.nextInt();
        fin = grid[gridR][gridC];

      }else if(word.startsWith("*") ){
        int tempR = gridR;
        int tempC = gridC;
        increment(0, tempR, tempC);

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


  public void increment(int incrementLevel, int tR, int tC){

    while(word.startsWith("*",incrementLevel) ){
	System.out.printf("\n word %s num %d", word, number);
      if(word.startsWith("*",incrementLevel+1) ){
        increment(incrementLevel+1, tR, tC);

      }else if( word.endsWith("North") ){
        for(int i = 1; i<=number; i++)
             grid[tR-i][tC].setColor(Color.WHITE);
        tR = tR-number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("South") ){
        for(int i = 1; i<=number; i++)
             grid[tR+i][tC].setColor(new Color(165,26,235));
        tR=tR+number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("East") ){
        for(int i = 1; i<=number; i++)
             grid[tR][tC+i].setColor(Color.GRAY);
        tC+=number;
        word = maze.next();
        number = maze.nextInt();

      }else if( word.endsWith("West") ){
        for(int i = 1; i<=number; i++)
           grid[tR][tC-i].setColor(Color.YELLOW);
         tC-=number;
         word = maze.next();
         number = maze.nextInt();

      } // Ends if statements

    } // Ends while loop

  } // End increment method
 
} // End File