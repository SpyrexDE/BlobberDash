class Obj {
  
  PVector pos;
  int shaderLevel;
  
  public Obj() {
    objects.add(this);
  }
  
  void update() 
  {
    checkVisibility();
  }
  
  void checkVisibility() 
  {
    if(pos != null){
      if(pos.x < -10){
        free();
      }else if(pos.y < -10){
        free();
      }else if(pos.x > windowWidth){
        free();
      }else if(pos.y > windowHeight){
        free();
      }
    }
  }
  void free() 
  {
    objects.remove(this);
  }
}
