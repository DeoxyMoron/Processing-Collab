//A type of shape

class Circle {
  int size;
  PVector position;
  float t=0.0;
  Spiral spiral;
  
  Circle(int size_){
    size = size_;
    spiral = new Spiral();
    position = new PVector(0,0);
  }

  void spiral(float deltaT){
    position.set(spiral.x1(t),spiral.y1(t));
    t+= deltaT;
  }
  
  void display(){
    ellipse(position.x, position.y, size, size);  
  }
}