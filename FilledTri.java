import objectdraw.*;
import java.awt.*;

public class FilledTri{
  
  private Line [] tri;

  public FilledTri(double x, double y, double width, double height,
               DrawingCanvas canvas){

    tri = new Line[(int)(width)];

    for(int i = 0; i<tri.length; i++){

      tri[i] = new Line(x+width/2,y,
                        x+i,y+height,canvas);
    }
  }

  public FilledTri(Location p, double width, double height,
                        DrawingCanvas canvas){
    this(p.getX(),p.getY(),width,height,canvas);
  }

  // Mutator methods
  public void setColor(Color c){
    for(Line m: tri)
     m.setColor(c);
  }

  public void move( double dx, double dy){
    for(Line m: tri)
      m.move(dx,dy);
  }

  public void moveTo( double x, double y){
    move(x-tri[0].getStart().getX(),y-tri[0].getStart().getY());

  }

  public void moveTo(Location p){
    move(p.getX()-tri[0].getStart().getX(),
         p.getY()-tri[0].getStart().getY());
  }


  public void hide(){
    for(Line m: tri)
      m.hide();
  }

  public void show(){
    for(Line m: tri)
     m.show();
  }


}

