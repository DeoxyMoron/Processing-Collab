class MultiTrail extends Shape{
  
  TrailingShape shapeR, shapeG, shapeB;
  
  MultiTrail(){
    super();
    shapeR = new TrailingShape();
    shapeG = new TrailingShape();
    shapeB = new TrailingShape();
    
    shapeR.setOffsets(-50,-50);
    shapeG.setOffsets(50,-50);
    shapeB.setOffsets(0,50);
  }
  void update(){
    //UpdateTimers
    timerPos.update();
    timerRot.update();
    
    move();
    rotation();
    
    shapeR.update();
    shapeG.update();
    shapeB.update();

    shapeR.moveTo(position.x,position.y,10);
    shapeG.moveTo(position.x,position.y,10);
    shapeB.moveTo(position.x,position.y,10);
    
    shapeR.rotateTo(theta,10);
    shapeG.rotateTo(theta,10);
    shapeB.rotateTo(theta,10);  
    
    shapeR.display();
    shapeG.display();
    shapeB.display();
  }  

  
  
  void displasy(){
    shapeR.display();
    shapeG.display();
    shapeB.display();
  } 
  
  
}