class GameBoard extends GameObject {
  private float gbWidth;
  private float gbHeight;
  private Dice currentDice;
  private Dice[] diceArray;
  private int lastDiceArrayIndex;

  GameBoard() {}
  GameBoard(float x, float y, float w, float h) {
    super(x, y);
    this.setGBWidth(w);
    this.setGBHeight(h);
    this.diceArray = new Dice[100];
    this.setLastDiceArrayIndex(0);
  }

  public float getGBWidth() {
    return this.gbWidth;
  }

  public float getGBHeight() {
    return this.gbHeight;
  }

  public Dice getCurrentDice() {
    return this.currentDice;
  }

  public Dice[] getDiceArray() {
    return this.diceArray;
  }

  public int getLastDiceArrayIndex() {
    return this.lastDiceArrayIndex;
  }

  public void setGBWidth(float w) {
    this.gbWidth = w;
  }

  public void setGBHeight(float h) {
    this.gbHeight = h;
  }

  public void setCurrentDice(Dice dice) {
    this.currentDice = dice;
  }

  public void saveDiceToArray(Dice dice) {
    this.setCurrentDice(dice);
    this.diceArray[this.lastDiceArrayIndex] = dice;
    this.setLastDiceArrayIndex(this.getLastDiceArrayIndex() + 1);
  }

  public void setLastDiceArrayIndex(int value) {
    this.lastDiceArrayIndex = value;
  }

  public void display() {
    fill(this.getColor());
    rect(this.getPosX() - this.getGBWidth() / 2,
      this.getPosY() - this.getGBHeight() / 2,
      this.getGBWidth(), this.getGBHeight());
  }
}
