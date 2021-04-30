class StartMenu extends Obj {

  Label l1;

  public StartMenu() {
    cursor();
    gState = GameState.START;
    l1 = new Label("Drücke Leertaste um zu starten.", 60, color(176, 255, 28), new PVector(200, 300));
  }

  void update() {
    super.update();
    checkInput();
  }

  void checkInput() {
    if (keyPressed) {
      if (key == ' ' || key == ' ') {
        objects.clear();
        openGame();
      }
    }
  }
}

class GameOver extends Obj {


  public GameOver() {
    cursor();
    Label l1 = new Label("GAME OVER", 250, color(255, 0, 0), new PVector(100, 300));
    Label l2 = new Label("Leertaste zum Neustarten", 80, color(255, 100, 100), new PVector(200, 400));
  }
  
  void update() {
    super.update();
    checkInput();
  }
  
  void checkInput() {
    if (keyPressed) {
      if (key == ' ') {
        objects.clear();
        openGame();
      }
    }
  }
}
