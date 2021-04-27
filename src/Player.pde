class Player extends Obj
{
  float posX;
  float posY;
  int lives = 20;
  int maxLives = 20;

  public Player(){
    shaderLevel = 2;
  }

  void update() {
    super.update();
    posX = mouseX;
    posY = mouseY;

    _draw_Tiles();
    
    checkInput();
  }


  public void damage(int value) {
    lives -= value;
      hb.onPlayerHealthChange("damage", value);
    if (lives <= 0) {
      objects.clear();
      openGameOver();
    }
  }

  public void heal(int value) {
    if(lives < maxLives){
      lives += value;
      hb.onPlayerHealthChange("heal", value);
    }
  }

  void _draw_Tiles() {
    HoverTile ht = new HoverTile();
    ht.spawn(mouseX, mouseY);
    objects.add(ht);
  }


  void checkInput() {
    if (keyPressed) {
      if (key == ' ' || key == ' ') {
        if(canSpawnBomb){
          new PlayerBomb(new PVector(posX, posY));
          canSpawnBomb = false;
          bombSpawnTimer = 5.0;
        }
      }else{
        canSpawnBomb = true;
      }
    }
  }
}