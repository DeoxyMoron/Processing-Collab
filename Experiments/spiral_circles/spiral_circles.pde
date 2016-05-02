Circle circle;
Circle circle2;

Spiral spiral;
Spiral spiral2;

int scene = 3;

void setup(){
  size(600,600);
  circle = new Circle(20);
  circle2 = new Circle(20);
  background(185);
  
  spiral = new Spiral();
  spiral.freeze();
  
  spiral2 = new Spiral(.1, 1, 2, 3000, 0, 4500);
  spiral2.freeze();
  
}
void draw (){
  background(185);
  if (scene==0){
   scene1(); 
  } else if (scene==1){
   scene2(); 
  } else if (scene==2){
   scene3(); 
  } else if (scene==3){
   scene4(); 
  }
  
}

void keyPressed(){
  if (keyCode == UP){

    spiral.updateDeltaT(-.01);
    
    spiral2.updateDeltaT(-.0001);
    
  } else if (keyCode == DOWN){

    spiral.updateDeltaT(.01);
    
    spiral2.updateDeltaT(.0001);
    
  } else if (keyCode == LEFT){
    spiral.updateNumObjects(1);
    
    //spiral2.updateAmp(.001);
    spiral2.updateNumObjects(-50);
    
  } else if (keyCode == RIGHT){
    spiral.updateNumObjects(-1);
    spiral2.updateNumObjects(50);
    
    //spiral2.updateAmp(-.001);
  }
  
  
}
void scene4(){
  translate(width/2,height/2);
  fill(244,244,244,125);
  spiral2.update();
  spiral2.display();
  
  fill(244,0,244,125);
  spiral.update();
  spiral.display(); 
}
void scene3(){
  translate(width/2,height/2);
  spiral.update();
  spiral.display(); 

  
}


void scene1(){
  translate(width/2,height/2);
  circle.spiral();
  circle.setSpeed(1);
  circle.display();
  circle2.spiral();
  circle2.setColor(255,255,0);
  circle2.setSpeed(3);
  circle2.display();
}

void scene2(){
  translate(width/2,height/2);
  circle.spiral();
  circle.setSpeed(2);
  circle.display();

}



void mousePressed(){
  //background(185);
  //circle.setSpeed(2); 
  //circle.reset();
  //circle2.reset();
}