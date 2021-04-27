class PlayerBomb extends Obj {
  PVector pos;

  color col = color(255, 255, 255);
  color col2 = color(255, 0, 0);
  color col3 = color(255, 255, 255);

  boolean blinkingGoalReached = false; //if true -> Exploding
  int blinkCount = 4;
  float blinkTime = 2;
  float blinkTimer = blinkTime;
  boolean onOff = false;

  boolean imploding = true;
  float circleR = 30;

  float implodeR = 80;
  int implodeOpacity = 0;

  float explodeR = 0;
  int explodeOpacity = 255;

  boolean exploding = false;
  boolean exploded = false;


  public PlayerBomb(PVector _pos)
  {
    shaderLevel = 2;
    pos = _pos;
  }

  void update() {
    super.update();
    noStroke(); 

    //blinkingGoalReached
    if (!exploding) {        //if not exploding at the moment
      if (blinkTimer > 0) {
        blinkTimer -=0.1;
        if (onOff) {
          fill(col);
          circle(pos.x, pos.y, circleR);
        } else {
          fill(col2);
          circle(pos.x, pos.y, circleR);
        }
      } else {
        blinkCount -= 1;
        blinkTimer = blinkTime;
        if (onOff) {
          onOff = false;
        } else {
          onOff = true;
        }
      }
    }

    if (blinkCount == 0) {    //Check if BlinkingGoal Reached
      blinkingGoalReached = true;
    }

    if (blinkingGoalReached) {  //if blinkingGoal Reched -> Explosion
      if (imploding) {
        if (implodeR > 20) {  //schon etwas vorher exploden
          implodeOpacity += 8;
          implodeR -= 1.0;
        } else {
          imploding = false;
          exploding = true;
        }
        fill(col3, implodeOpacity);
        circle(pos.x, pos.y, implodeR);
      } else {
        explodeR += 12.0;
        explodeOpacity -= 6;
        fill(col3, explodeOpacity);
        circle(pos.x, pos.y, explodeR);
        checkDmg();
      }


      if (imploding == false && explodeOpacity <= 0) {
        free();
      }
    }
  }
  
  void checkDmg(){
    for (int i=objects.size()-1; i>=0; i--){          //HIER WEITER MACHEN!!! POSFÜR ALLE OBJEKTE MACHEN
      //if (objects.get(i).pos){
        
      //}
    }
  }
  
  
}

class EnemyBomb1 {
}
