Square square;
void setup(){
  size(500,500); 
  noStroke();
  square = new Square();
  frameRate(60);
}

void draw(){
  background(185);
  square.update();
  square.display();
}

class Timer {
  Label label, label2;
  float PctComplete;
  float step;
  int startTime;
  float time = 0.0;
  
  Timer(){
    label = new Label();
    label2 = new Label();
    
    label.setPosition(20,60);
    label2.setPosition(20,120);
    
    PctComplete = 1.0;
    
    step = 1/60.0; //Based on default Framerate
  }
  
  float getTime(){
    return time; 
  }
  
  float getProgress(){
    return PctComplete;
  }
  
  void setFrameTime(int frames){
    step = 1/float(frames);
  }
  
  void setStep(float step_){
    step = step_;
  }
  
  void update(){
    if (PctComplete<1.0){
      PctComplete += step;
      //time = millis()-startTime;
      time = frameCount - startTime;
    } 
    
    if (PctComplete>1.0){
      PctComplete = 1.0;
    }
  }
  
  void reset(){
    PctComplete = 0.0;
    //startTime = millis();
    startTime = frameCount;
    
  }
  
  //Stuff for Labels//
  void setTextPos(float x, float y){
    label.setPosition(x,y);
  }
  void display(){
    //label.drawText(str(getTime()));
    label.drawText(str(getProgress()));
    label2.drawText(str(getTime()));
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



class Square{
  Timer timer, timer2;
  PVector position, startPos, endPos, stepVector;
  
  Square(){
    timer = new Timer();
    timer2 = new Timer();
    
    position = new PVector(0.0,0.0);
    startPos = new PVector(0.0,0.0);
    endPos = new PVector(0.0,0.0);
    stepVector = new PVector(0.0,0.0);
  }
  
  void display(){
    pushMatrix();
    //translate(width/2,height/2);
    
    //Draw Main Shape
    drawMain();
    //DrawTimer
    drawTimer();

    popMatrix();  
  }
  
  void drawMain(){
    fill(9,125,23);
    rectMode(CENTER);
    rect(position.x,position.y,40,40);   
  }
  
  void moveTo(float x, float y, int frames){
    //endPos.set(x,y);
    //position.set(x,y);
    startPos.set(position.x,position.y);
    stepVector.set(x-position.x,y-position.y);
    
    timer.setFrameTime(frames);
    timer.reset();
  }

  void move(){
    //MoveTimer
    float pct = timer.getProgress();
    println(pct);
    //position.set(startPos.x+pct*(endPos.x-startPos.x),startPos.y+pct*(endPos.y-startPos.y));
    position.set(startPos.x+pct*stepVector.x,startPos.y+pct*stepVector.y);
  }

  void update(){
    timer.update();
    move(); 
    
    
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
  
}



void keyPressed(){
  if (keyCode == UP){
    square.moveTo(200,200,60);
    
  }
  
  if (keyCode == DOWN){
     square.moveTo(width/2,height/2,60);
  }
  
  if (keyCode == LEFT){
     square.moveTo(0,0,60);
  }
  
}