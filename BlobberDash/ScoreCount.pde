class ScoreCount extends UiComponent
{
  public void HeartBox() {
    shaderLevel = 1;
  }
  
  void update(){
    super.update();
    fill(color(176, 255, 28));
    text("Score: " + Integer.valueOf(score), 500, 70);
  }
}