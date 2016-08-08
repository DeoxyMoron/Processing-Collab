class Shape{
  //Class with a shape that can move and rotate according to commands
  
  Timer timerPos, timerRot;
  PVector position, startPos, pathVector;
  float theta, thetaStart, thetaPath;
  
  int shapeSize;

  //Constants for shape and trail choice
  int SQUARE = 0;

  Shape(){
    shapeSize = 75;
    
    timerPos = new Timer(); //Position
    timerRot = new Timer(); //Rotation
    
    //Position Vectors
    position = new PVector(0.0,0.0);
    startPos = new PVector(0.0,0.0);
    pathVector = new PVector(0.0,0.0);
    
    //Rotation
    theta = 0.0;
  }
  
  void moveTo(float x, float y, int frames){
    //Moves to an absolute position over the course of the frames given
    //X and Y are the end position coordinates
    
    //Save start position
    startPos.set(position.x,position.y);
    
    //Subtract end position from start postion, resulting vector is the difference
    //This vector will be multiplied by the progress percentage to generate a step
    pathVector.set(x-position.x,y-position.y); 
    
    //PositionTimer
    timerPos.setFrameTime(frames);
    timerPos.reset();
  }

  void move(){
    //MoveTimer
    float pct = timerPos.getProgress();
    //println(pct);
    //position.set(startPos.x+pct*(endPos.x-startPos.x),startPos.y+pct*(endPos.y-startPos.y));
    position.set(startPos.x+pct*pathVector.x,startPos.y+pct*pathVector.y);
  }
  
  void rotateTo(float t, int frames){
     //Rotates to an absolute orientation
     
     //Save starting rotation
     thetaStart = theta;
     //Save direction??????????
     thetaPath = t - theta;   
     
    //RotationTimer
    timerRot.setFrameTime(frames);
    timerRot.reset();
  }
  
  void rotateAbout(){
    
    
  }
  void rotation(){
    float pct = timerRot.getProgress();
    theta = thetaStart + pct*thetaPath;
  }

  void update(){
    //UpdateTimers
    timerPos.update();
    timerRot.update();
    
    move();
    rotation();
  }
  
  void display(){
    //translate(width/2,height/2);
    //DrawTimer
    drawTimer();
    //Draw Main Shape
    drawMain();
 
  }
  
  void drawMain(){
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
     
     //Shapes
     //fill(9,125,23,125);
    fill(9,125,23,200);
    rectMode(CENTER);
    translate(100,0);
    rect(0,0,shapeSize,shapeSize);
    popMatrix();
  }
 
  void drawMain(int type){
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
     
     //Shapes
     //fill(9,125,23,125);
    fill(9,125,23,50);
    rectMode(CENTER);
    rect(0,0,shapeSize,shapeSize);
    popMatrix();
  }  
  
  void drawTimer(){
    timerPos.show();
    //timer2.show();
    //DrawTimer on keydown only
    if (keyPressed == true) {
      if (keyCode == UP){
        //timer.reset();
      }
      if (keyCode == DOWN){
        //timer2.reset();
      }
    }
  }
}

class Circle extends Shape{
  Circle(){
    super();
  }
  
  void drawMain(){
    ellipse(position.x,position.y,30,30);
  }
}