import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

void setup()
{
  size(1200, 800, P2D);
  frameRate(100);
  background(100, 0, 0);
  fx = new PostFX(this);
 
  openMenu();
    
}


//switch(gState){
//case START: openMenu(); break;
//case INGAME: openInGame(); break;
//case GAMEOVER: openGameOver(); break;
//}

void draw()
{
  //surface.setSize(windowWidth,windowHeight);
  clear();  //Leere Zeichenfläche

  ArrayList<Obj> l0 = new ArrayList<Obj>();
  ArrayList<Obj> l1 = new ArrayList<Obj>();
  ArrayList<Obj> l2 = new ArrayList<Obj>();
  
  for (int i=objects.size()-1; i>=0; i--)
  {
    try {
      switch(objects.get(i).shaderLevel){
        case 0: l0.add(objects.get(i)); break;
        case 1: l1.add(objects.get(i)); break;
        case 2: l2.add(objects.get(i)); break;
      }
      
    }
    catch(Exception ignore) {
    }
  }
  
  for (int i=l2.size()-1; i>=0; i--){
    l2.get(i).update();
  }  
  postProcessVignette();
  for (int i=l1.size()-1; i>=0; i--){
    l1.get(i).update();
  }
  postProcessGlow();
  for (int i=l0.size()-1; i>=0; i--){
    l0.get(i).update();
  }

}

void postProcessGlow() {
  fx.render()
  .bloom(0.05, 40, 80)
  .compose();
}
void postProcessVignette() {
  fx.render()
  .vignette(0.5, 0.5)
  .compose();
}

void postProcessCA() {
  fx.render()
  .chromaticAberration()
  .compose();
}

void drawNonUI() {
  for (int i=objects.size()-1; i>=0; i--)
  {
    try {
      if (!(objects.get(i) instanceof UiComponent)) {
        objects.get(i).update();
      }
    }
    catch(Exception ignore) {
    }
  }
}

void drawUI() {
  for (int i=objects.size()-1; i>=0; i--)
  {
    try {
      if (objects.get(i) instanceof UiComponent) {
        objects.get(i).update();
      }
    }
    catch(Exception ignore) {
    }
  }
}

void mouseWheel(MouseEvent event) {
  if(gState == GameState.INGAME){
    HealOrb ho = new HealOrb();
    ho.spawn(400,200);
  }
}

void openMenu() {
  new StartMenu();
}

void openGameOver() {
  new GameOver();
}

void openGame() {
  new GameManager();
}
