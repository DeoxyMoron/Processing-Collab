Circle circle;
Circle circle2;

Spiral spiral;
Spiral spiral2;

DuoCircle duoCircle;

PVector test_pos;

int scene = 0; //SCENE SETUP: Chooses the Scene

void setup(){
  size(600,600);
  result = new int[width*height][3];
  smooth(8);
  noStroke();
  circle = new Circle(20);
  circle2 = new Circle(20);
  
  duoCircle = new DuoCircle();
  
  duoCircle.reset();
  
  background(185);
  
  //Establish Objects
  /*
  
    test_pos = new PVector(5,0);
  circle2.setPosition(test_pos);
  
  
  spiral = new Spiral();
  spiral.freeze();
  
  spiral2 = new Spiral(.1, 1, 2, 3000, 0, 4500);
  spiral2.freeze();
  */
}
int[][] result;
float time;
int samplesPerFrame = 1;
int numFrames = 3000;        
float shutterAngle = .75;
void draw(){
  for (int i=0; i<width*height; i++)
    for (int a=0; a<3; a++)
      result[i][a] = 0;

  for (int sa=0; sa<samplesPerFrame; sa++) {
    time = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
    draw_();
    loadPixels();
    for (int i=0; i<pixels.length; i++) {
      result[i][0] += pixels[i] >> 16 & 0xff;
      result[i][1] += pixels[i] >> 8 & 0xff;
      result[i][2] += pixels[i] & 0xff;
    }
  }
}

void draw_(){
  background(185);
  pushMatrix();
  if (scene==0){
   scene0(); 
  } else if (scene==1){
   scene1();
  } else if (scene==2){
   scene2(); 
  } else if (scene==3){
   scene3(); 
  } else if (scene==4){
   scene4(); 
  }
  popMatrix();
  
}

void scene0(){
  translate(width/2,height/2);
  duoCircle.display();
  duoCircle.repel(150);
}

void scene1(){
  /*
  translate(width/2,height/2);
  circle.moveX(1);
  circle.display();
  
  */
  println(duoCircle.position.y);
  translate(width/2,height/2-1);
  duoCircle.groupMoveY(-1);
  duoCircle.display();
}

void scene2(){

  duoCircle.attract(50);
}

void scene3(){
  translate(width/2,height/2);
  duoCircle.unisonMove(-5);
}

void scene4(){
  translate(width/2,height/2);
  duoCircle.unisonMove(5);
}

void keyPressed(){
  //Input Modulation
  if (keyCode == UP){
    scene=1;
  } else if (keyCode == DOWN){
    duoCircle.reset();
    scene = 2;
  } else if (keyCode == LEFT){
    scene = 3;
    //circle.playSeq(0);
    /*
    spiral.updateNumObjects(1);
    //spiral2.updateAmp(.001);
    spiral2.updateNumObjects(-50);
    */
  } else if (keyCode == RIGHT){
    duoCircle.reset();
    translate(width/2,height/2);
  duoCircle.repel(300);
  }
  
  
}










void mousePressed(){
  //background(185);
  //circle.setSpeed(2); 
  //circle.reset();
  //circle2.reset();
}