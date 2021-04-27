class HitEffect extends Obj
{
  float xPos;
  float yPos;
  float w = 20;
  float h = 20;
  color col = color(256, 256, 256);
  boolean st = false;
  boolean spawned = false;
  int opacity = 256;
  int disappearSpeed = 5;


  public HitEffect() {
    
    shaderLevel = 2;
  }

  void spawn(float x, float y)
  {
    xPos = x;
    yPos = y;

    spawned = true;
  }

  void spawn(float x, float y, color colo)
  {
    xPos = x;
    yPos = y;
    col = colo;
    spawned = true;
  }

  void spawn(float x, float y, float wid, float hei, color colo, boolean stroke, int disappSpeed)
  {
    xPos = x;
    yPos = y;
    col = colo;
    st = stroke;
    w = wid;
    h = hei;
    disappearSpeed = disappSpeed;

    spawned = true;
  }

  void _draw_Ellipse()
  {
    fill(col, opacity);
    if (!st) {
      noStroke();
    }

    ellipse(xPos, yPos, w, h);
  }

  void update() {
    super.update();
    if (spawned) {
      if (opacity > 0)
      {
        opacity -= disappearSpeed;
        w += 5.0;
        h += 5.0;

        _draw_Ellipse();
      } else
      {
        free();
      }
    }
  }
}
