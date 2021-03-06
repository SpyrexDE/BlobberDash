class BombBox extends UiComponent
{
  ArrayList<BombStick> bombSticks = new ArrayList<BombStick>();
  int spaceing = 15;
  int yPos = 100;

  int lastXPos = 50;

  public BombBox() {
    shaderLevel = 1;
    for (int lives = player.lives; lives > 0; lives--) {
      lastXPos += spaceing;
      BombStick bs = new BombStick(new PVector(lastXPos + 5, yPos + 15), color(176, 255, 28));
      bombSticks.add(bs);
    }
  }


  public void onPlayerBombsChange(String type, int amount) {
    if (type == "damage") {
      for (int i = amount; i > 0; i--) {
        try{
          bombSticks.get(bombSticks.size() - 1).damage();
        }catch(Exception ignore){}
      }
    }
  }
  
  
  void update(){
    super.update();
    noFill();
    stroke(color(176, 255, 28));
    strokeWeight(10);
    rect(55, yPos - 10, player.maxLives * spaceing + spaceing, 50);
  }
  
}

class BombStick extends UiComponent
{
  float w = 10;
  float h = 30;
  PVector pos;
  color col;
  float opacity = 256;
  boolean hitted = false;

  public BombStick(PVector _pos, color _col) {
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
    }else{
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
  }

  void damage() {
    bb.bombSticks.remove(this); 
    hitted = true;
  }
}