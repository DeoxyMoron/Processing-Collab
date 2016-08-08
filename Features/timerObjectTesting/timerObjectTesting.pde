//MultiTrail shape;
TrailingShape shape,shape2,shape3;

Circle circle;
void setup(){
  size(1000,1000); 
  noStroke();
  smooth(8);
  shape = new TrailingShape();
  shape2 = new TrailingShape();
  shape3 = new TrailingShape();
  
  shape.setColor(9,12,200);
  shape2.setColor(200,12,200);
  shape3.setColor(10,200,12);

  
  //circle = new Circle();
  frameRate(50);
}

void draw(){
  background(185);
  //fill(225,255,255,25);
  rectMode(CORNER);
  //rect(0,0,width,height);
  
  //translate(width/2,height/2);

  shape.update();
  shape.display();
 
  shape2.update();
  shape2.display();

  shape3.update();
  shape3.display();
  
  /*
  fill(255,0,0);
  ellipse(400,100,10,10);
  ellipse(width/2,height/2,10,10);
  
  */
  
  //shape.moveTo(mouseX,mouseY,10);

}


void mousePressed(){
    //shape.rotateAbout(); 
    //shape.moveTo(mouseX,mouseY,10);
    
    if (mouseButton == LEFT) {
        shape2.moveTo(mouseX,mouseY,8);
    }    
     if (mouseButton == RIGHT) {
        shape3.moveTo(mouseX,mouseY,12);
    }           
}

void keyPressed(){
  if (keyCode == UP){
    shape.moveTo(mouseX,mouseY,10);
    
  }
  
  if (keyCode == DOWN){
     shape.moveTo(width/2,height/2,10);
  }
  
  if (keyCode == LEFT){
     shape.rotateTo(-2*PI,30);
     shape2.rotateTo(2*PI,45);
  }
  
  if (keyCode == RIGHT){
     shape.rotateTo(PI/4,30);
     shape2.rotateTo(-2*PI/3,15);
  }  
}