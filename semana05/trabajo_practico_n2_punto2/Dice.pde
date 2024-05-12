class Dice extends GameObject {
  private float dWidth;
  private float dHeight;
  private int rollValue;

  Dice() {};
  Dice(float x, float y, float w, float h) {
    super(x, y);
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
  
  public void setDiceWidth(float w) {
    this.dWidth = w;
  }
  
  public void setDiceHeight(float h) {
    this.dHeight = h;
  }
  
  public void setRollValue(int value) {
    this.rollValue = value;
  }
  
  public void display() {
    fill(this.getColor());
    rect(this.getPosX() - this.getDiceWidth() / 2,
         this.getPosY() - this.getDiceHeight() / 2,
         this.getDiceWidth(),
         this.getDiceHeight());
  }
  
  public void roll() {
    this.setRollValue(int(random(1, 7)));
  }
}
