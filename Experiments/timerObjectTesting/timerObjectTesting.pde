Shape square;
Circle circle;
void setup(){
  size(1000,1000); 
  noStroke();
  smooth(8);
  square = new Shape();
  circle = new Circle();
  frameRate(60);
}

void draw(){
  background(185);
  
  //translate(width/2,height/2);

  square.update();
  square.display();
  
  fill(255,0,0);
  ellipse(400,100,10,10);
  ellipse(width/2,height/2,10,10);

}




void keyPressed(){
  if (keyCode == UP){
    square.moveTo(mouseX,mouseY,10);
    
  }
  
  if (keyCode == DOWN){
     square.moveTo(width/2,height/2,20);
  }
  
  if (keyCode == LEFT){
     square.rotateTo(-2*PI,30);
  }
  
  if (keyCode == RIGHT){
     square.rotateTo(PI/4,30);
  }  
}