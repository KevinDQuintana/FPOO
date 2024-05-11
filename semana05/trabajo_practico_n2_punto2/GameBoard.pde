class GameBoard extends GameObject {
  private Dice[] diceArray;
  private int currentDiceArrayIndex;
  
  GameBoard() {}
  GameBoard(float x, float y) {
    super(x, y);
    diceArray = new Dice[100];
    currentDiceArrayIndex = 0;
  }
  
  public Dice[] getDiceArray() {
    return diceArray;
  }
  
  public int getCurrentDiceArrayIndex() {
    return currentDiceArrayIndex;
  }
  
  public void setCurrentDiceArrayIndex(int value) {
    currentDiceArrayIndex = value;
  }
  
  public void saveDice(Dice dice) {
    diceArray[currentDiceArrayIndex] = dice;
    setCurrentDiceArrayIndex(getCurrentDiceArrayIndex() + 1);
  }
  
  public void display() {}
}
