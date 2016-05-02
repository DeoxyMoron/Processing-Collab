//A type of motion

class Spiral {
  float amp;
  float period;
  
  Spiral(){
    amp = 5;
    period = 1;
  }
  
  float x1(float t){
  return amp*t*sin(t/period);
  }

  float y1(float t){
    return amp*t*cos(t/period);  
  }

}