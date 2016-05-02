Circle circle;
Circle circle2;

int sceneSelection = 1;

void setup(){
  size(600,600);
  circle = new Circle(20);
  circle2 = new Circle(20);
  background(185);
  
}
void draw (){
  if (sceneSelection==0){
   scene1(); 
  } else if (sceneSelection==1){
   scene2(); 
  }

}

void mousePressed(){
  background(185);
  //circle.setSpeed(2); 
  circle.reset();
  circle2.reset();
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