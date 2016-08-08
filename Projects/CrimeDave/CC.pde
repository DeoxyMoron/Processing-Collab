class CC_Note{
  int channel;
  int value;
  
  CC_Note(){
   
  }
  CC_Note(int channel_){
    channel = channel_;
    value = 0;
  }  
  int getValue(){
    return value;  
  }
  
  void setValue(int value_){
    value = value_;
    
    bassCircle.setDiameter(1.0*value);
    println("Value: "+value);
  }
  
  int getChannel(){
    return channel;
  }
}