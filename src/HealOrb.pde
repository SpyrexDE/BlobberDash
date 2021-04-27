class HealOrb extends Obj
{
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  float targetX;
  float targetY;
  float w = 10;
  float h = 10;
  float speed = 0.05;
  color col = color(176, 255, 28);
  boolean st = false;
  boolean canWalk = false;
  boolean dead = false;
  int opacitiy = 256;
  float walkTime = 2.0;
  float walkTimer = walkTime;


  public HealOrb() {
    
    shaderLevel = 2;
  }

  void spawn(float x, float y)
  {
    xPos = x;
    yPos = y;

    targetX = getRandomXDirection();
    targetY = getRandomYDirection();
  }

  void spawn(float x, float y, float wid, float hei, color colo, boolean stroke, int disappSpeed)
  {
    xPos = x;
    yPos = y;
    col = colo;
    st = stroke;
    w = wid;
    h = hei;

    targetX = getRandomXDirection();
    targetY = getRandomYDirection();
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
      checkForPlayerHitted();

      _draw_Ellipse();
      _draw_Tiles();
      if (walkTimer > 0)
      {
        walkTimer -= 0.1;
        canWalk = false;
      } else {
        walkTimer = walkTime;
        canWalk = true;
        targetX = getRandomXDirection();
        targetY = getRandomYDirection();
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
      player.heal(1);
      _spawn_Hit_Effect(xPos, yPos);
      dead = true;
    }
  }


  void _draw_Tiles() {
    HoverTile ht = new HoverTile();
    ht.spawn(xPos, yPos, 10, 10, color(176, 255, 28), false, 5);
    objects.add(ht);
  }


  void _spawn_Hit_Effect(float x, float y) {
    HitEffect he = new HitEffect();
    he.spawn(x, y, 10, 10, color(176, 255, 28), false, 5);
    objects.add(he);
  }

  float getRandomXDirection() {
    xVel = xVel/2 + random(-100, 100);
    return xPos + yVel;
  }
  float getRandomYDirection() {
    yVel = yVel/2 + random(-100, 100);
    return yPos + yVel;
  }
}
