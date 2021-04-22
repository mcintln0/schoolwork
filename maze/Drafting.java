package CS257.maze;

// LaToya McIntyre
// CS257
// March 2018
// Rough draft of the maze

import objectdraw.*;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class Drafting extends WindowController implements ActionListener{


  public static void main (String[] args) {
    new Drafting().startController(800,800); 
  }


  FilledRect[][] grid =new FilledRect[20][20];
  private JComboBox<String> color;
  private Color valueChosen;
 


 public void onMousePress(Location p){
    for(int i = 0; i< grid.length; i++)
      for(int j = 0; j<grid[i].length;j++)
        if( grid[i][j].contains(p) )
          grid[i][j].setColor(valueChosen);
      
  }



  public void begin(){

    new Text("Use the selection bar and the grid to draft your maze",
             50,650,canvas);

    for(int i = 0; i< grid.length; i++)
      for(int j = 0; j<grid[i].length;j++){
        grid[i][j]=new FilledRect(10*i, 10*j, 20,20,canvas);
        new FramedRect(10*i, 10*j, 20,20,canvas);
        grid[i][j].setColor(Color.WHITE);
      }
  
    color = new JComboBox<String>();
      color.addItem("North");
      color.addItem("East");
      color.addItem("South");
      color.addItem("West");
      color.addItem("Undo");
      color.addItem("False");
      color.addItem("Start");
      color.addItem("End");

      color.setSelectedItem("Start");
      valueChosen = new Color(40,199,252);

    Container contentPane=getContentPane();
    contentPane.add(color, BorderLayout.SOUTH);
    contentPane.validate(); 

    color.addActionListener(this);
  }

  public void actionPerformed(ActionEvent evt){
    if(evt.getSource() == color){
      Object newValue = color.getSelectedItem(); 
      if ( newValue.equals("North") ) {
         valueChosen = Color.RED;
      }else if(newValue.equals("East") ) {
         valueChosen = Color.GREEN;
      }else if(newValue.equals("South") ) {
         valueChosen = new Color(40,199,252);
      }else if(newValue.equals("West") ) {
         valueChosen = new Color(165,26,235);
      }else if(newValue.equals("False") ) {
         valueChosen = new Color(235,231,26);
      }else if(newValue.equals("Start") ) {
         valueChosen = Color.ORANGE;
      }else if(newValue.equals("End") ) {
         valueChosen = new Color(200,200,200);
      }else{
         valueChosen = Color.WHITE;
      }
    }
  }
}
