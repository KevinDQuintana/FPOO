int lastKey; //<>//
int lastRoll;
int tempIndex;
GameBoard gameBoard;

void setup() {
  size(600, 600);
  gameBoard = new GameBoard(width / 2, height / 2, 500, 500);
}
void draw() {
  background(50);
  gameBoard.display();
}

void keyPressed() {
  if (key == 32 && lastKey != key) {
    lastKey = keyCode;
    Dice dice = new Dice(0, 0); //<>//
    dice.roll();
    while (dice.getRollValue() == lastRoll) {
      dice.roll();
    }
    lastRoll = dice.getRollValue();
    gameBoard.saveDice(dice);
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
