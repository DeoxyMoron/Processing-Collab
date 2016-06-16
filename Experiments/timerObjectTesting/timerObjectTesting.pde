Shape square;
void setup(){
  size(500,500); 
  noStroke();
  square = new Shape();
  frameRate(1);
}

void draw(){
  background(185);
  square.update();
  square.display();
}

class Shape{
  Timer timer, timer2;
  PVector position, startPos, endPos, stepVector;
  
  Shape(){
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
    //println(pct);
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

class Circle extends Shape{
  Circle(){
    super();
  }
  
  void drawMain(){
    ellipse(position.x,position.y,30,30);
  }
}


void keyPressed(){
  if (keyCode == UP){
    square.moveTo(200,200,10);
    
  }
  
  if (keyCode == DOWN){
     square.moveTo(width/2,height/2,10);
  }
  
  if (keyCode == LEFT){
     square.moveTo(0,0,10);
  }
  
}