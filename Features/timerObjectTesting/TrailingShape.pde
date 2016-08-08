class TrailingShape extends Shape{
  
   //PVector[] positions; 
  
  int TRAIL_1 = 0;
  int TRAIL_2 = 0;
  
  int numTrails;
  float[] mx;
  float[] my;
  float[] mt; 
  
  PVector[] positions;
  
  float XOffset, YOffset;
  
  int color_r = 125;
  int color_g = 125;
  int color_b = 125;
  
  TrailingShape(){
    super();
    //Trails - Method 2
    numTrails = 10;
    
    //Stores position and thetas
    mx = new float[numTrails];
    my = new float[numTrails];
    mt = new float[numTrails];
    
    XOffset = 0.0;
    YOffset = 0.0;
  }
  
   void setOffsets(float x_, float y_){
    XOffset = x_;
    YOffset = y_;   
   }
   
   void setColor(int r, int g, int b){
     color_r = r;
     color_g = g;
     color_b = b;
   }

   void display(){
    //translate(width/2,height/2);
    //DrawTimer
    //drawTimer();
    //Draw Main Shape
    //drawMain();
    drawTrails();
 
  }
  
  void drawTrails(){
    int which = frameCount % numTrails;
    mx[which] = position.x;
    my[which] = position.y;
    mt[which] = theta;
    
    for (int i=0; i<numTrails;i++){
      int index = (which+1+i) % numTrails;
 
      pushMatrix();
      translate(mx[index]+XOffset,my[index]+YOffset);
      rotate(mt[index]);
       
       //Shapes
      if (i % 2 == 0){
        //fill(255,9,23,125);
      } else{
        //fill(9,125,23,125);
      }
      
      fill(color_r,color_g,color_b,125+i*5);
      
      rectMode(CENTER);
      rect(0,0,shapeSize*i/numTrails,shapeSize*i/numTrails);
      
      popMatrix();            
      
      
    }
  } 
}


  /*
  void drawTrails(int whatefver){
    println("DAR");
    for (int i =positions.length; i>0;i--){
    //for (int i =0; i<positions.length;i++){
      
      //Draw (based on DrawMain())
      PVector posOld = positions[i-1];
      println(positions[i-1].x);
      pushMatrix();
      translate(positions[i-1].x,positions[i-1].y);
      rotate(theta);
       
       //Shapes
      if (i % 2 == 0){
        fill(125,9,23,125-(i*5)-20);
      } else{
        fill(9,125,23,125-(i*5)-20);
      }
      
      rectMode(CENTER);
      rect(0,0,shapeSize-i*8,shapeSize-i*8);
      
      popMatrix();      
      
      
    }
  }
  
  
  
   
  void trailOld(){
    //print(positions.length);
    for (int i = positions.length-1; i>0;i--){
      positions[i].set(positions[i-1].x,positions[i-1].y);
      //positions[1].set(positions[0].x,positions[0].y);
    }
    positions[0].set(position.x,position.y);
    
    println(positions);
  }
  
  void trail2(){
    PVector test = new PVector();
     for(int i = positions.length-2; i >2; i--) { 
       positions[i-1].set(positions[i].x, positions[i].y);
    }
    
    positions[0].set(position.x,position.y);
    
    println(positions);
    //println(positions[0]);
  }
 
  */