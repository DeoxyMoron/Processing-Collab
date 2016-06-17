class Shape{
  Timer timer, timerRot;
  PVector position, startPos, pathVector;
  float theta, thetaStart, thetaPath;
  
  int shapeSize;
  
  PVector[] positions;
  
  Shape(){
    shapeSize = 75;
    
    timer = new Timer(); //Position
    timerRot = new Timer(); //Rotation
    
    //Position Vectors
    position = new PVector(0.0,0.0);
    startPos = new PVector(0.0,0.0);
    pathVector = new PVector(0.0,0.0);
    
    //Rotation
    theta = 0.0;
    
    //Trails
    positions = new PVector[10];
    
    for (int i =0; i<positions.length;i++){
      positions[i] = new PVector();
    }
    
    println(positions);
    
    
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
    timer.setFrameTime(frames);
    timer.reset();
    

  }

  void move(){
    //MoveTimer
    float pct = timer.getProgress();
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
  void rotation(){
    float pct = timerRot.getProgress();
    theta = thetaStart + pct*thetaPath;
  }

  void update(){
    //UpdateTimers
    timer.update();
    timerRot.update();
    
    move();
    rotation();
   
    trail();
  }
  
  void trail(){
    print(positions.length);
    for (int i = positions.length-1; i>0;i--){
      positions[i].set(positions[i-1].x,positions[i-1].y);
      //positions[1].set(positions[0].x,positions[0].y);
    }
    positions[0].set(position.x,position.y);
    
    println(positions);
  }
  void trail2(){
    PVector test = new PVector();
     for(int i = positions.length-2; i >2; i--) { 
       positions[i-1].set(positions[i].x, positions[i].y);
    }
    
    positions[0].set(position.x,position.y);
    
    println(positions);
    //println(positions[0]);
  }
  
  void display(){

    //translate(width/2,height/2);
    

    //DrawTimer
    drawTimer();
    
    drawTrails();
    
    //Draw Main Shape
    drawMain();
 
  }
  
  void drawMain(){
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
    timer.show();
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

  void drawTrails(){
    println("DAR");
    for (int i =positions.length; i>0;i--){
    //for (int i =0; i<positions.length;i++){
      
      //Draw (based on DrawMain())
      PVector posOld = positions[i-1];
      println(positions[i-1].x);
      pushMatrix();
      translate(positions[i-1].x,positions[i-1].y);
      rotate(theta);
       
       //Shapes
      if (i % 2 == 0){
        fill(255,9,23,125-(i*5)-20);
      } else{
        fill(9,255,23,125-(i*5)-20);
      }
      
      rectMode(CENTER);
      rect(0,0,shapeSize-i*8,shapeSize-i*8);
      
      popMatrix();      
      
      
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