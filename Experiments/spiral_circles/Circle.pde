//A type of shape

class Circle {
  int size;
  PVector position;
  float t=0.0;
  float deltaT;
  Spiral spiral;
  
  Circle(int size_){
    size = size_;
    spiral = new Spiral();
    position = new PVector(0,0);
    deltaT = .01;
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
    ellipse(position.x, position.y, size, size);  
  }
}