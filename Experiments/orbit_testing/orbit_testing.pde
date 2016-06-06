void setup(){
  size(800,800); 
  background(125);
  smooth(8);
  noStroke();
}

int size = 30;
float distance = 60;
float theta=0;
float orbitspeed = .03;



void draw(){
  
  background(125);
  
  pushMatrix();
  
  //SetPosition of Group
  translate(mouseX,mouseY);
  
  
  
  //Circle 1
  pushMatrix();
  rotate(theta);
  translate(distance*sin(theta/3),0);
  fill(0,255,0);
  ellipse(0,0,size,size);
  theta += orbitspeed;
  popMatrix();
  
  //Circle 2
  pushMatrix();
  rotate(theta+PI);
  translate(distance*sin(theta/3),0);
  fill(255,0,0);
  ellipse(0,0,size,size);
  theta += orbitspeed;
  popMatrix();
  
  
  /*
  //Circle 3
  pushMatrix();
  rotate(theta+HALF_PI);
  translate(50,0);
  fill(0,255,0);
  ellipse(0,0,size,size);
  theta += orbitspeed;
  popMatrix();
  
  //Circle 4
  pushMatrix();
  rotate(theta+PI+HALF_PI);
  translate(50,0);
  fill(0,255,0);
  ellipse(0,0,size,size);
  theta += orbitspeed;
  popMatrix();
  */
  
  
  popMatrix();
}