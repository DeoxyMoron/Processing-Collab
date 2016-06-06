Circle c1;

void setup(){
  size(800,800); 
  background(125);
  smooth(8);
  noStroke();
  
  c1 = new Circle();
}

void draw(){
  background(125);
  translate(width/2,height/2);
  c1.display();
}

class Circle{
  
  PVector position;
  PVector end_position;
  PVector start_position;
  int size;
  
  float moveTime;
  
  
  float distance = 60;
  float theta=0;
  float orbitspeed = .03;
  
  Circle(){
    position = new PVector(0,0);
    end_position = new PVector(0,0);
    size = 50;
    moveTime = 1/60.0;
  }
  
  void update(){
    position.x = lerp(position.x, end_position.x, .05);
    position.y = lerp(position.y, end_position.y, .05);
  }
  
  void display(){
    
    update();
    pushMatrix();
    fill(0,255,0);
    
   //Reset Coordinate system
    translate(position.x,position.y);
    
    
    ellipse(0,0,size,size);

    //Circle 1
    pushMatrix();
    rotate(theta);
    translate(distance,0);
    fill(255,0,0);
    ellipse(0,0,size,size);
    theta += orbitspeed;
    popMatrix();
    
    //Circle 2
    pushMatrix();
    rotate(theta+PI);
    translate(distance,0);
    fill(255,0,0);
    ellipse(0,0,size,size);
    theta += orbitspeed;
    popMatrix();
    
    popMatrix();
  }
  
  void setPosition(float x, float y){
    position.set(x,y);
    end_position.set(x,y);
  }
  
  void moveTo(float x, float y){
    end_position.set(x,y);
  }
}


void keyPressed(){
  //Input Modulation
  if (keyCode == UP){
    c1.setPosition(50,50);
  } else if (keyCode == DOWN){
    c1.moveTo(100,100);
  } else if (keyCode == LEFT){
  } else if (keyCode == RIGHT){
  }
}


void mousePressed(){
  c1.moveTo(mouseX-width/2,mouseY-height/2); 
}