class Dice extends GameObject {
  private float dWidth;
  private float dHeight;
  private int rollValue;
  private PVector[] diceDots;
  private String numString;

  Dice() {};
  Dice(float x, float y, float w, float h) {
    super(x, y);
    this.numString = "";
    this.setDiceWidth(w);
    this.setDiceHeight(h);
  };

  public float getDiceWidth() {
    return this.dWidth;
  }

  public float getDiceHeight() {
    return this.dHeight;
  }

  public int getRollValue() {
    return this.rollValue;
  }

  public PVector[] getDiceDots() {
    return this.diceDots;
  }

  public String getNumString() {
    return this.numString;
  }

  public void setDiceWidth(float w) {
    this.dWidth = w;
  }

  public void setDiceHeight(float h) {
    this.dHeight = h;
  }

  public void setRollValue(int value) {
    this.rollValue = value;
  }

  public void setDiceDots(PVector[] dots) {
    this.diceDots = dots;
  }

  public void setNumString(String value) {
    this.numString = value;
  }

  public void roll() {
    this.setRollValue(int(random(1, 7)));
  }

  public void display() {
    fill(this.getColor());
    rect(this.getPosX() - this.getDiceWidth() / 2,
      this.getPosY() - this.getDiceHeight() / 2,
      this.getDiceWidth(),
      this.getDiceHeight(), 25);
  }
}
