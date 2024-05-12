int lastKey; //<>//
int lastRoll;
int tempIndex;
Dice lastDice;
DiceDots diceDots;
GameBoard gameBoard;

void setup() {
  size(600, 600);
  gameBoard = new GameBoard(width / 2, height / 2, 500, 500);
  gameBoard.setColor(color(255, 255, 255));
  diceDots = new DiceDots();
}

void draw() {
  background(50);
  textSize(32);
  gameBoard.display(); //<>//
  if (lastDice != null) {
    lastDice.display();
    fill(0, 0, 0);
    diceDots.setDotRadius(15);
    for (int i = 0; i < lastDice.getDiceDots().length; i++) {
      circle(lastDice.getDiceDots()[i].x, lastDice.getDiceDots()[i].y, diceDots.getDotRadius());
    }
    text(lastDice.getNumString(), width - 150, 150);
  }
}

void keyPressed() {
  if (key == 32 && lastKey != key) {
    lastKey = keyCode;
    Dice dice = new Dice(width / 2, height / 2, 100, 100);
    dice.roll();
    while (dice.getRollValue() == lastRoll) {
      dice.roll();
    }
    dice.setDiceDots(diceDots.getDiceDots(dice.getRollValue()));
    dice.setNumString(diceDots.getNumString(dice.getRollValue()));
    lastRoll = dice.getRollValue();
    gameBoard.saveDiceToArray(dice);
    lastDice = gameBoard.getCurrentDice();
  } else if (key == 113) {
    println("exit");
    Dice[] diceArray = gameBoard.getDiceArray();
    tempIndex = 0;
    for (int i = 0; i < diceArray.length; i++) {
      if (diceArray[i] != null) {
        for (int j = 0; j < 4; j++) {
          if (diceArray[i + j] != null) {
            print(diceArray[i + j].getRollValue() + " ");
          } else {
            break;
          }
        }
        println();
        i += 3;
      } else {
        break;
      }
    }
    exit();
  }
}

void keyReleased() {
  if (key == 32) {
    lastKey = 0;
  }
}
