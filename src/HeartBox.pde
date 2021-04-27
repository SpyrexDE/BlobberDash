class HeartBox extends UiComponent
{
  ArrayList<HeartStick> heartSticks = new ArrayList<HeartStick>();
  int spaceing = 15;
  int yPos = 45;

  int lastXPos = 50;

  public HeartBox() {
    shaderLevel = 1;
    for (int lives = player.lives; lives > 0; lives--) {
      lastXPos += spaceing;
      HeartStick ht = new HeartStick(new PVector(lastXPos, yPos), color(176, 255, 28));
      heartSticks.add(ht);
    }
  }


  public void onPlayerHealthChange(String type, int amount) {
    if (type == "damage") {
      for (int i = amount; i > 0; i--) {
        try{
          heartSticks.get(heartSticks.size() - 1).damage();
          lastXPos -= spaceing;
        }catch(Exception ignore){}
      }
    } else if(type == "heal"){
      for (int i = amount; i > 0; i--) {
        try{
          lastXPos += spaceing;
          HeartStick ht = new HeartStick(new PVector(lastXPos, yPos), color(176, 255, 28));
          heartSticks.add(ht);
          ht.heal();
        }catch(Exception ignore){}
      }
    }
  }
  
  
  void update(){
    super.update();
    noFill();
    stroke(color(176, 255, 28));
    strokeWeight(10);
    rect(50, yPos - 25, player.maxLives * spaceing + spaceing, 50);
  }
  
}

class HeartStick extends UiComponent
{
  float w = 10;
  float h = 30;
  PVector pos;
  color col;
  float opacity = 256;
  boolean hitted = false;
  boolean healed = false;
  boolean healing = false;

  public HeartStick(PVector _pos, color _col) {
    pos = _pos;
    col = _col;
  }

  void update() {
    if(!hitted){
      rectMode(CENTER);
      noStroke();
      fill(col, opacity); 
      rect(pos.x, pos.y, w, h);
      rectMode(CORNER);
    } else{
      if(opacity > 0){
        opacity -= 5;
        w += 2;
        h += 4;
        
        rectMode(CENTER);
        noStroke();
        fill(col, opacity); 
        rect(pos.x, pos.y, w, h);
        rectMode(CORNER);
      }else{
        free();
      }
    }
    
    if(healed){
      if(w > 10 | h > 30){
        opacity += 15;
        w -= 1;
        h -= 3;
        
        rectMode(CENTER);
        noStroke();
        fill(col, opacity); 
        rect(pos.x, pos.y, w, h);
        rectMode(CORNER);
      } else {
        opacity = 255;
        healed = false;
      }
    }
    
  }

  void damage() {
    hb.heartSticks.remove(this); 
    hitted = true;
  }
  
  void heal() {
     opacity = 0;
     w = 20;
     h = 60;
     
     healed = true;
  }
  
}