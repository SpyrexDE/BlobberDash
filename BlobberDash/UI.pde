class UiComponent extends Obj {
  public UiComponent() {
    font = createFont("font.ttf", 64);
    textFont(font);
    shaderLevel = 1;
  }
}

class Label extends UiComponent {
  String text;
  int size;
  color col;
  PVector pos;

  public Label(String _text, int _size, color _col, PVector _pos) {
    text = _text;
    size = _size;
    col = _col;
    pos = _pos;
  }

  void update() {
    super.update();
    fill(col);
    textSize(size);
    text(text, pos.x, pos.y);
  }
}