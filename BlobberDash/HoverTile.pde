class HoverTile extends Obj
{
  float xPos;
  float yPos;
  float w = 20;
  float h = 20;
  color col = color(256, 256, 256);
  boolean st = false;
  boolean spawned = false;
  int opacitiy = 256;
  int disappearSpeed = 5;


  public HoverTile() {
    
    shaderLevel = 2;
  }

  void spawn(float x, float y)
  {
    xPos = x;
    yPos = y;

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
    fill(col, opacitiy);
    if (!st) {
      noStroke();
    }

    ellipse(xPos, yPos, w, h);
  }

  void update() {
    super.update();
    if (spawned) {
      if (opacitiy > 0 && w != 0 && h!= 0)
      {
        opacitiy -= disappearSpeed;
        w -= 0.5;
        h -= 0.5;

        _draw_Ellipse();
      } else
      {
        free();
      }
    }
  }
}
