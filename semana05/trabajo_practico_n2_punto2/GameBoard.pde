class GameBoard extends GameObject {
  private float gbWidth;
  private float gbHeight;
  private Dice[] diceArray;
  private int currentDiceArrayIndex;

  GameBoard() {}
  GameBoard(float x, float y, float w, float h) {
    super(x, y);
    this.setGBWidth(w);
    this.setGBHeight(h);
    this.diceArray = new Dice[100];
    this.setCurrentDiceArrayIndex(0);
  }

  public float getGBWidth() {
    return this.gbWidth;
  }

  public float getGBHeight() {
    return this.gbHeight;
  }

  public void setGBWidth(float w) {
    this.gbWidth = w;
  }

  public void setGBHeight(float h) {
    this.gbHeight = h;
  }

  public Dice[] getDiceArray() {
    return this.diceArray;
  }

  public int getCurrentDiceArrayIndex() {
    return this.currentDiceArrayIndex;
  }

  public void setCurrentDiceArrayIndex(int value) {
    this.currentDiceArrayIndex = value;
  }

  public void display() {
    rect(this.getPosX() - this.getGBWidth() / 2,
         this.getPosY() - this.getGBHeight() / 2,
         this.getGBWidth(), this.getGBHeight());
  }

  public void saveDice(Dice dice) {
    this.diceArray[this.currentDiceArrayIndex] = dice;
    this.setCurrentDiceArrayIndex(this.getCurrentDiceArrayIndex() + 1);
  }
}
