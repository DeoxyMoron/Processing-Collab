class Timer {
  Label label, label2;
  float PctComplete;
  float step;
  int startFrame, frameDuration, framesElapsed;
  
  Timer(){
    label = new Label();
    label2 = new Label();
    
    label.setPosition(20,60);
    label2.setPosition(20,120);
    
    PctComplete = 1.0;
    
    step = 1/60.0; //Based on default Framerate
  }
  
  int getFramesElapsed(){
    return framesElapsed;
  }
  
  float getProgress(){
    return PctComplete;
  }
  
  void setFrameTime(int f_){
    frameDuration = f_; //set the total number of frames the animation will take to complete
    step = 1/float(f_); //set the step for incrementing the progress percentage
  }
  
  void setStep(float step_){
    step = step_;
  }
  
  void update(){
    
    if (framesElapsed<frameDuration){
      PctComplete += step;
      framesElapsed = frameCount - startFrame;
      //time = millis()-startTime;
      //time = frameCount - startTime;
    } else{
      PctComplete = 1.0; // correct for deviations in progress 
    }
  }
  
  void reset(){
    PctComplete = 0.0;
    //startTime = millis();
    startFrame = frameCount;
    framesElapsed = frameCount - startFrame;
    
  }
  
  //Stuff for Labels//
  void setTextPos(float x, float y){
    label.setPosition(x,y);
  }
  void display(){
    //label.drawText(str(getTime()));
    label.drawText(str(getProgress()));
    label2.drawText(str(getFramesElapsed()));
  }
  void show(){
    display();
  }
}

class Label {
  float xPos, yPos;
  
  Label(){
    xPos = 10;
    yPos = -60; 
  }
  
  Label(float xPos_,float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }  
  void drawText(String t){
    text(t,xPos,yPos);
  }
  
  void setPosition(float x_, float y_){
    xPos = x_;
    yPos = y_;
  }
  
}