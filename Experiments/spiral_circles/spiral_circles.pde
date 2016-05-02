Circle circle;
Circle circle2;

void setup(){
  size(600,600);
  circle = new Circle(20);
  circle2 = new Circle(20);
  background(185);
  
}
void draw (){
  
  fill(255,125);
  //rotate(radians(90));
  translate(width/2,height/2);
  
  circle.spiral();
  circle.setSpeed(1);
  circle.display();
  
  circle2.spiral();
  circle2.setColor(255,255,0);
  circle2.setSpeed(3);
  circle2.display();
  
  
  
  
  //circle.modTimeSinAbs();
  //circle2.spiral(-.1);
  //circle2.display();
  
}

void mousePressed(){
  background(185);
  //circle.setSpeed(2); 
  circle.reset();
  circle2.reset();
}