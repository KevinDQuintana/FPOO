int lastKey; //<>//
int lastRoll;
int tempIndex;
Dice lastDice;
GameBoard gameBoard;

PVector diceOneDot;
PVector[] diceTwoDots;
PVector[] diceThreeDots;
PVector[] diceFourDots;
PVector[] diceFiveDots;
PVector[] diceSixDots;

void setup() {
  size(600, 600);
  gameBoard = new GameBoard(width / 2, height / 2, 500, 500);
  gameBoard.setColor(color(255, 255, 255));
 //<>//
  diceOneDot = new PVector(width / 2, height / 2);

  diceTwoDots = new PVector[2];
  diceTwoDots[0] = new PVector(width / 2 - 50, height / 2 - 50);
  diceTwoDots[1] = new PVector(width / 2 + 50, height / 2 + 50);

  diceThreeDots = new PVector[3];
  diceThreeDots[0] = new PVector(width / 2 - 50, height / 2 - 50);
  diceThreeDots[1] = new PVector(width / 2, height / 2);
  diceThreeDots[2] = new PVector(width / 2 + 50, height / 2 + 50);

  diceFourDots = new PVector[4];
  diceFourDots[0] = new PVector(width / 2 - 50, height / 2 - 50);
  diceFourDots[1] = new PVector(width / 2 + 50, height / 2 - 50);
  diceFourDots[2] = new PVector(width / 2 - 50, height / 2 + 50);
  diceFourDots[3] = new PVector(width / 2 + 50, height / 2 + 50);
  
  diceFiveDots = new PVector[5];
  diceFiveDots[0] = new PVector(width / 2 - 50, height / 2 - 50);
  diceFiveDots[1] = new PVector(width / 2 + 50, height / 2 - 50);
  diceFiveDots[2] = new PVector(width / 2 - 50, height / 2 + 50);
  diceFiveDots[3] = new PVector(width / 2 + 50, height / 2 + 50);
  diceFiveDots[4] = new PVector(width / 2, height / 2);
  
  diceSixDots = new PVector[6];
  diceSixDots[0] = new PVector(width / 2 - 50, height / 2 - 50);
  diceSixDots[1] = new PVector(width / 2 + 50, height / 2 - 50);
  diceSixDots[2] = new PVector(width / 2 - 50, height / 2 + 50);
  diceSixDots[3] = new PVector(width / 2 + 50, height / 2 + 50);
  diceSixDots[4] = new PVector(width / 2 - 50, height / 2);
  diceSixDots[5] = new PVector(width / 2 + 50, height / 2);
}
void draw() {
  background(50);
  gameBoard.display();
  if (lastDice != null) {
    lastDice.display();
    fill(0, 0, 0);
    switch (lastDice.getRollValue()) {
    case 1:
      circle(diceOneDot.x, diceOneDot.y, 50);
      break;
    case 2:
      for (int i = 0; i < diceTwoDots.length; i++) {
        circle(diceTwoDots[i].x, diceTwoDots[i].y, 50);
      }
      break;
    case 3:
      for (int i = 0; i < diceThreeDots.length; i++) {
        circle(diceThreeDots[i].x, diceThreeDots[i].y, 50);
      }
      break;
    case 4:
      for (int i = 0; i < diceFourDots.length; i++) {
        circle(diceFourDots[i].x, diceFourDots[i].y, 50);
      }
      break;
    case 5:
      for (int i = 0; i < diceFiveDots.length; i++) {
        circle(diceFiveDots[i].x, diceFiveDots[i].y, 50);
      }
      break;
    case 6:
      for (int i = 0; i < diceSixDots.length; i++) {
        circle(diceSixDots[i].x, diceSixDots[i].y, 50);
      }
      break;
    }
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
