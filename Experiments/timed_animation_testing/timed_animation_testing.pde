Circle circle;

void setup(){
  size(800,800);
  smooth(4);
  frameRate(60.0);
  circle = new Circle();
}

boolean countTime = true;

void draw(){
 background(125);
 textSize(40);
 
 drawGrid();
 
 translate(width/2,height/2);
 circle.timer();
 circle.update();
 circle.display();

}

void drawGrid(){
  stroke(0);
  for (int i = 0; i < width; i+=50){
  line(i,0,i,height);
  }
  for (int i = 0; i < height; i+=50){
  line(0,i,height,i);
  }
  ellipse(width/2,height/2,12,12);
}



class Circle{
 PVector startPos;
 PVector endPos;
 PVector stepVec; // Path vector calculated from startPos and endPos
 PVector pos; // Current pos
 
 
 float distance;
 float pctComplete=1.0; // tracks animation progress
 
 float framesDuration;
 float step_Frames;
 
 //Timer stuff
  String sFrame, sTime;
  float startTime, startFrame;
  float durationFrame, durationTime;
  float endFrame;

 
 Circle(){
   pos = new PVector(0.0,0.0);
   startPos = new PVector(0,0);
   endPos = new PVector(0,0);
   stepVec = new PVector(0,0);
   
   endFrame = 60;
   framesDuration = 60.0; //complete actions in 60 frames;
   step_Frames = 1/framesDuration;
 }
 
 void update(){
   pctComplete += step_Frames;
   
   if (pctComplete<1.0){
     //pos.add(stepVec); //Method 1
     pos.set(startPos.x+pow(pctComplete,step_Frames*2+2)*(endPos.x-startPos.x),startPos.y+pow(pctComplete,3)*(endPos.y-startPos.y));
     
   }
 }
 
 void getPosition(){
   println(pos); 
 }
 
 void moveTo(float x, float y){
   //Restart animation timers
    startTime = millis();
    startFrame = frameCount;
    durationFrame=0;
    durationTime=0;
    
    // Restart animation progress tracker
    pctComplete =0;
    
   //Set End and Start
   endPos.set(x,y); 
   startPos.set(pos.x,pos.y);
   
   //Make Copy of EndPos Vec
   PVector _tempVec = new PVector();
   _tempVec = endPos.copy();
   
   //Generates the Vector to increment by in updates, based on the frames steps
   
   stepVec.set( _tempVec.sub(startPos).div(framesDuration)); 
 }
 
  void moveTo(float x, float y, float frames){
   endFrame = frames;
   framesDuration = frames; //complete actions in 60 frames;
   step_Frames = 1/framesDuration;    
    
   //Restart animation timers
    startTime = millis();
    startFrame = frameCount;
    durationFrame=0;
    durationTime=0;
    
    // Restart animation progress tracker
    pctComplete =0;
    
   //Set End and Start
   endPos.set(x,y); 
   startPos.set(pos.x,pos.y);
   
   
   
   
   //Make Copy of EndPos Vec
   PVector _tempVec = new PVector();
   _tempVec = endPos.copy();
   
   //Generates the Vector to increment by in updates, based on the frames steps
   
   stepVec.set( _tempVec.sub(startPos).div(framesDuration)); 
   
   
   }
   
 void moveLeft(float x, float frames){
     moveTo(pos.x-x,pos.y,frames);
 }
 
  void moveRight(float x, float frames){
     moveTo(pos.x+x,pos.y,frames);
 }
 
 void display(){
   noStroke();
   pushMatrix();
   scale(1,-1);//Realign coordinate system
   translate(pos.x,pos.y);
   fill(255,0,0);
   ellipse(0,0,30,30);
   popMatrix();
 }

  void timer(){
     if (countTime){ 
       if (durationFrame<endFrame){
         //update
         durationFrame = frameCount-startFrame;
         sFrame = str(durationFrame);
         
         durationTime = millis()-startTime;
         sTime = str(durationTime);
       }
   }
    
   fill(0, 102, 153);
   text(sFrame, 10, 60);
   
    fill(0, 102, 153);
   text(sTime, 10, 120);
  }

}

float secondsToFrames(float sec){
  println(frameRate);
  return sec*60.0;
}

float BPM = 120;
float beatsToFrames(float beats){
  return beats/BPM*60*60.0;
}

void keyPressed(){
  //Input Modulation
  if (keyCode == UP){
    println(secondsToFrames(1));
    circle.moveTo(-300,300,beatsToFrames(2));
  } else if (keyCode == DOWN){
    circle.moveTo(0,0,beatsToFrames(2));
  } else if (keyCode == LEFT){
    circle.moveTo(-300,300,beatsToFrames(2));
  } else if (keyCode == RIGHT){
    circle.moveTo(300,300,beatsToFrames(2));
    
    
  }
}