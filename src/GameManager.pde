class GameManager extends Obj {

  public GameManager() {
    player = new Player();
    hb = new HeartBox();
    //bb = new BombBox();
    noCursor();

    gState = GameState.INGAME;
    
  }


  void update() {
    super.update();
    checkInput();
  }

  void checkInput() {
    if (mousePressed && (mouseButton == RIGHT))
    {
      if (canSpawn) {
        canSpawn = false;
        spawnTimer = 5.0;
        Enemy en = new Enemy();
        en.spawn(mouseX, mouseY);
      }
    } else {
      canSpawn = true;
    }


    if (!canSpawn) {
      spawnTimer -= 0.1;
      if (spawnTimer <= 0) {
        canSpawn = true;
      }
    }
    
    if (!canSpawnBomb) {
      bombSpawnTimer -= 0.1;
      if (bombSpawnTimer <= 0) {
        canSpawnBomb = true;
      }
    }
    
    
  }

  void spawnHealOrb()
  {
    if (canSpawn) {
      canSpawn = false;
      spawnTimer = 5.0;
      HealOrb ho = new HealOrb();
      ho.spawn(200, 300);
    }
  }
}