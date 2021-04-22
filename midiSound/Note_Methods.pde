void invokeNoteHandler(int note, int velocity, String bus_name) {
  try {
    Class[] cls = new Class[2];
    cls[0] = int.class;
    cls[1] = int.class;

    if (bus_name.startsWith("MidiBus") ) {
      Method handler = this.getClass().getMethod( "onGridNote" + note, cls );
      currentVelocity = velocity;
      if (velocity > 0) {
        midiToFreq(note);
        noteP = note;
        handler.invoke(this, velocity, note);
      }
    } else { 
      println("Something went wrong. idk what it is.");
    }
  } 
  catch (Exception e) { 
    println("* * * * * * Error handling note " + note + ", velocity " + 
      velocity +  ", bus_name " + bus_name + "  * * * * * *  ");
    e.printStackTrace();
  }
}

/*----- Group C ------*/

void onGridNote36(int vel, int note) {
  colorR = (int)random(0, 255);
  colorG = constantC + note + (int)random(75, 100);
  colorB = (int)random(0, 255);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote37(int vel, int note) {
  colorR = (int)random(0, 255);
  colorG = constantC + note + (int)random(75, 100);
  colorB = (int)random(0, 255);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote38(int vel, int note) {
  colorR = (int)random(0, 255);
  colorG = constantC + note + (int)random(75, 100);
  colorB = (int)random(0, 255);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote39(int vel, int note) {
  colorR = (int)random(0, 255);
  colorG = constantC + note + (int)random(75, 100);
  colorB = (int)random(0, 255);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote40(int vel, int note) {
  colorR = (int)random(100, 255) - note;
  colorG = constantC+note;
  colorB = (int)random(100, 201) + note;
  noteShape = "square";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote41(int vel, int note) {
  colorR = (int)random(100, 255) - note;
  colorG = constantC+note;
  colorB = (int)random(100, 201) + note;
  noteShape = "square";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote42(int vel, int note) {
  colorR = (int)random(100, 255) - note;
  colorG = constantC+note;
  colorB = (int)random(100, 201) + note;
  noteShape = "square";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote43(int vel, int note) {
  colorR = (int)random(100, 255) - note;
  colorG = constantC+note;
  colorB = (int)random(100, 201) + note;
  noteShape = "square";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote44(int vel, int note) {
  colorR = note + (int)random(50, 150);
  colorG = constantC+note;
  colorB = 255-(note + (int)random(20));
  noteShape = "circle";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote45(int vel, int note) {
  colorR = note + (int)random(50, 150);
  colorG = constantC+note;
  colorB = 255-(note + (int)random(20));
  noteShape = "circle";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote46(int vel, int note) {
  colorR = note + (int)random(50, 150);
  colorG = constantC+note;
  colorB = 255-(note + (int)random(20));
  noteShape = "circle";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote47(int vel, int note) {
  colorR = note + (int)random(50, 150);
  colorG = constantC+note;
  colorB = 255-(note + (int)random(20));
  noteShape = "circle";
  dimensionA = (random(100)*vel)%width;
  dimensionB = (random(50)*vel)%height;
  dimensionC = note;
}

void onGridNote48(int vel, int note) {
  colorR = note + (int)random(50, 100);
  colorG = constantC+note;
  colorB = note + (int)random(50, 100);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote49(int vel, int note) {
  colorR = note + (int)random(50, 100);
  colorG = constantC+note;
  colorB = note + (int)random(50, 100);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote50(int vel, int note) {
  colorR = note + (int)random(50, 100);
  colorG = constantC+note;
  colorB = note + (int)random(50, 100);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

void onGridNote51(int vel, int note) {
  colorR = note + (int)random(50, 100);
  colorG = constantC+note;
  colorB = note + (int)random(50, 100);
  noteShape = "ellipse";
  dimensionA = (random(50)*vel)%width;
  dimensionB = (random(100)*vel)%height;
  dimensionC = note;
  dimensionD = note;
}

/*----- End of Group C ------*/

/*----- Group D ------ */
void onGridNote52(int vel, int note) {
  backgroundR++;
}

void onGridNote53(int vel, int note) {
  backgroundG++;
}

void onGridNote54(int vel, int note) {
  backgroundB++;
}

void onGridNote55(int vel, int note) {
  backgroundA++;
}

void onGridNote56(int vel, int note) {
  backgroundR--;
}

void onGridNote57(int vel, int note) {
  backgroundG--;
}

void onGridNote58(int vel, int note) {
  backgroundB--;
}

void onGridNote59(int vel, int note) {
  backgroundA--;
}

void onGridNote60(int vel, int note){
  frameR+=5;
}

void onGridNote61(int vel, int note){
  frameR-=5;
}

void onGridNote62(int vel, int note){
  saveFrame("lit.jpg");
}

void onGridNote63(int vel, int note){
}


/* -------- End of Group D -----*/


//Knob Functions

void onGridNote22(int vel, int note) {
  constantAlpha = vel + note;
}

void onGridNote23(int vel, int note) {
  constantC = vel-note;
}

void onGridNote24(int vel, int note) {
  constantScaleSq = vel;
}

void onGridNote25(int vel, int note) {
  constantScaleCi = vel;
}
