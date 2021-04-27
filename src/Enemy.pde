class Enemy extends Obj
{
  float xPos;
  float yPos;
  float targetX;
  float targetY;
  float w = 30;
  float h = 30;
  float speed = 0.05;
  color col = color(200, 0, 0);
  boolean st = false;
  boolean canWalk = false;
  boolean vulnerable = false;
  boolean dead = false;
  int opacitiy = 256;
  float walkTime = 1.0;
  float walkTimer = walkTime;
  float vulnerableTime = 5.0;
  float vulnerableTimer = 5.0;
  int lives = 5;
  float difficultyLvl = 0.5;

  public Enemy() {
    shaderLevel = 2;
  }

  void spawn(float x, float y)
  {
    xPos = x;
    yPos = y;

    targetX = player.posX;
    targetY =player.posY;
  }

  void spawn(float x, float y, float wid, float hei, color colo, boolean stroke, int disappSpeed)
  {
    xPos = x;
    yPos = y;
    col = colo;
    st = stroke;
    w = wid;
    h = hei;

    targetX = player.posX;
    targetY =player.posY;
  }

  void _draw_Ellipse()
  {
    fill(col, opacitiy);
    if (!st) {
      noStroke();
    }

    ellipse(xPos, yPos, w, h);
  }

  void update() {
    super.update();
    if (!dead) {
      xPos = lerp(xPos, targetX, speed);
      yPos = lerp(yPos, targetY, speed);
      if (vulnerable) {
        checkForPlayerHitted();
      } else if (vulnerableTimer > 0) {
        vulnerableTimer -= 0.1;
      } else {
        vulnerable = true;
      }

      _draw_Ellipse();
      _draw_Tiles();
      if (walkTimer > 0)
      {
        walkTimer -= 0.01;
        canWalk = false;
      } else {
        walkTimer = walkTime + random(-difficultyLvl,difficultyLvl);
        canWalk = true;
        targetX = player.posX;
        targetY =player.posY;
      }

      checkForTargetReached();
    } else
    {
      opacitiy = 0;
      free();
    }
  }

  void checkForTargetReached()
  {
    if (dist(xPos, yPos, targetX, targetY) < 1)
    {
      //Target Reached
    }
  }

  void checkForPlayerHitted()
  {
    if (dist(xPos, yPos, player.posX, player.posY) < w+h/2)
    {
      damage(1);
      player.damage(1);
      _spawn_Hit_Effect(xPos, yPos);
    }
  }

  void damage(int amount)
  {
    lives -= amount;
    vulnerable = false;
    vulnerableTimer = vulnerableTime;
    if (lives <= 0)
    {
      dead = true;
    }
  }

  void _draw_Tiles() {
    HoverTile ht = new HoverTile();
    ht.spawn(xPos, yPos, 30, 30, color(256, 0, 0), false, 5);
    objects.add(ht); 
  }

  void _spawn_Hit_Effect(float x, float y) {
    HitEffect he = new HitEffect();
    he.spawn(x, y, color(255, 0, 0));
    objects.add(he); 
  }
}