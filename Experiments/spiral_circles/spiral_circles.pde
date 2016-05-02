Circle circle;
Circle circle2;

void setup(){
  size(600,600);
  circle = new Circle(20);
  circle2 = new Circle(20);
  background(185);
  circle.setSpeed(3);
}
void draw (){
  
  fill(255,125);
  //rotate(radians(90));
  translate(width/2,height/2);
  circle.spiral();
  
  //circle.modTimeSinAbs();
  //circle2.spiral(-.1);
  circle.display();
  //circle2.display();
  
}

void mousePressed(){
  background(185);
  circle.setSpeed(2); 
  circle.reset();
}