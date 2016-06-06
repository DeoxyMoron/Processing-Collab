//A type of shape

class Circle {
  int size;
  PVector position;
  float t=0.0;
  float deltaT;
  color c;
  Spiral spiral;
  
  Circle(int size_){
    size = size_;
    spiral = new Spiral();
    position = new PVector(0,0);
    deltaT = .01;
    c = color(255,255,255);
  }
  
  void setColor(int r, int g, int b){
    c = color(r,g,b);
  }

  void setPosition(PVector p){
    position.set(p.x,p.y);
  }
  
  void setPosition(float x, float y){
    position.set(x,y);
  }
  
  PVector getPosition(){
    return position;
  }
  
  void moveX(float x){
    position.set(position.x+x,position.y); 
  }
  
  void moveY(float y){
    position.set(position.x,position.y+y); 
  }
  
  void moveX(int x, int t){
    int startT = millis();
    while (startT>t){
      position.set(position.x+1,position.y);
      startT+=1;
      display();
    }
  }
  
  void spiral(){
    position.set(spiral.x1(t),spiral.y1(t));
    update();
  }
  
  void reset(){
    t = 0; 
  }

  void update(){
    t+= deltaT;
    println(deltaT);
  }
  
  float modTimeSinAbs(){
    //Modulates t
    return 2*abs(sin(deltaT));
  }
  
  void setSpeed(float t){
    deltaT = t;
  }
  
  void display(){
    pushMatrix();
    fill(c);
    ellipse(position.x, position.y, size, size);
    popMatrix();
  }
  
  void playSeq(int i){
    if (i == 0){
      println("asdfsdf");
      moveX(50,3);
    }
  }
}