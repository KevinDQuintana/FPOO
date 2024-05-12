class Dice extends GameObject {
  private int rollValue;

  Dice() {};
  Dice(float x, float y) {
    super(x, y);
  };

  public int getRollValue() {
    return this.rollValue;
  }
  
  public void setRollValue(int value) {
    this.rollValue = value;
  }

  public void display() {}
  
  public void roll() {
    this.setRollValue(int(random(1, 7)));
  }
}
