//A Kind of Group class?/??
// For moving up and down

class DuoCircle{
  Circle c1 = new Circle(30);
  Circle c2 = new Circle(30);
  Circle r = new Circle(10);
  
  float progress = 1.0;
  
  PVector position = new PVector(0,0);
  
  
 DuoCircle(){
   position.x = 0;
   position.y = 150;
   
   //update
   r.setColor(0,255,0);
   r.setPosition(position.x,position.y);
   c1.setPosition(position.x,position.y);
   c2.setPosition(position.x,position.y);
  }
 
 void display(){
   r.display();
   c1.display();
   c2.display();
 }
 
 void drawReference(){
   r.setPosition(position.x, position.y);
   r.display();
 }
 
 void moveRefDown(){
   r.moveY(1);
   r.display();
 }
 
 void repel(){
   //Spreads out Circles over time
    c1.moveX(-5);
    c2.moveX(5);
    c1.display();
    c2.display();
    drawReference();
 }

 void attract(){
   //Attracts  Circles over time
   // Infinite
    c1.moveX(5);
    c2.moveX(-5);
    c1.display();
    c2.display();
    drawReference();
 }
 
 void groupMoveY(float y){
   position.set(position.x,position.y+y);
 }
 
  void unisonMove(int x){
   //Moves both circles along the X axis simultaneously
    c1.moveX(x);
    c2.moveX(x);
    c1.display();
    c2.display();
    drawReference();
 }
 
  void reset(){
    progress =0.0; 
  }
  void repel(float amt){
    if (progress<1.0){
      //Repel for a certain distance
      float dist = amt/10;
      progress += dist/amt;
      
      c1.moveX(-dist);
      c2.moveX(dist);
    }
    c1.display();
    c2.display();
    drawReference();
 }
 
  void attract(float amt){
    if (progress<1.0){
      //Repel for a certain distance
      float dist = amt/10;
      progress += dist/amt;
      
      c1.moveX(dist);
      c2.moveX(-dist);
    }
    c1.display();
    c2.display();
    drawReference();
 }
 
  void playSeq(int i){
    if (i == 0){
      println("1");
      repel(50);
      reset();
      println("2");
      attract(50);
    }
  }
  
 
}