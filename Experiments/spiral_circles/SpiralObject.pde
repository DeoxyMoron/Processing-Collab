//A type of object

class Spiral {
  float amp;
  float period;
  float t;
  float deltaT;
  
  int numObjects, maxObjects, minObjects;
  
  String MODE = "build";
  
  Spiral(){
    amp = 5;
    period = 1;
    deltaT = 2;
    t = 0.0;
    numObjects = 13;
    minObjects = 0;
    maxObjects = 40;
  }
  
  void display(){
    //ellipse(x1(t),y1(t),10,10);
  }
  
  
  void update(){
    if (MODE == "build"){
      t+= deltaT;
      ellipse(x1(t),y1(t),10,10);
    } else {
      
      for (int i=0; i<numObjects; i++){
        ellipse(x1(t),y1(t),10,10);
        t+=deltaT;
      }
      t=0;
    }
  }
    
  void freeze(){
    setMode("freeze");
  }
  
  void setMode(String mode_){
    MODE = mode_;
  }
  
  void setNumObjects(int n){
    //Sets number of objects in the spiral
    numObjects = n; 
  }
  
  void updateNumObjects(int n ){
    //Increment the number of objects by n
    numObjects += n;
    numObjects = constrain(numObjects,minObjects,maxObjects);
  }

  void setDeltaT(float t_){
    //Sets the rate of change in T
    deltaT = t_; 
  }

  void updateDeltaT(float t_){
    //increment the change in t by the t_
    deltaT += t_; 
  }
  
  float x1(float t){
  return amp*t*sin(t/period);
  }

  float y1(float t){
    return amp*t*cos(t/period);  
  }

}



//class CircleChild {

  
//}