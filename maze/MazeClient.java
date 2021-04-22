package CS257.maze;

// LaToya McIntyre
// CS 257 -- Extra Credit
// Creates Maze

import CS257.maze.*;
import objectdraw.*;
import java.awt.*;
import java.util.*;
import java.io.*;

public class MazeClient extends WindowController{
  
private int count = 0;
  public static void main(String[] args){
    new MazeClient().startController(1000,1000);   
  }

  public void begin() {
    try{
      new MazeMaker("Maze.txt", canvas);
      new MazeSolver("Maze.txt", canvas);
    }catch (FileNotFoundException e){
     System.out.printf("File not found"); }
  }

  public void onMousePress(Location p){
    count++;
    canvas.clear();
    try{
     if(count == 1){
      new MazeMaker("Maze2.txt", canvas);
      new MazeSolver("Maze2.txt", canvas);
     }else if(count == 2){
      new MazeMaker("Maze3.txt", new Color(40,199,252),new Color(165,26,235),
                    canvas);
      new MazeSolver("Maze3.txt", canvas);
     }else if(count >= 3){
    new MazeMaker("NameMaze.txt",canvas);
    new MazeSolver("NameMaze.txt",canvas);
     }
    }catch (FileNotFoundException e){
     System.out.printf("File not found"); }  }


}
