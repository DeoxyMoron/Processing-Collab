
float t;
int size = 30;

void setup(){
  size(600,600); 
}
void draw (){
  translate(width/2,height/2);
  ellipse(x1(t),y1(t), size, size);  
  t+=.1;
}


float x1(float t){
  return 5*t*sin(t);
}

float y1(float t){
  return 5*t*cos(t);  
}