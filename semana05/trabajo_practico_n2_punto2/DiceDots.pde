class DiceDots {
  private float dotRadius;
  private String numString;
  private PVector[] diceOneDot;
  private PVector[] diceTwoDots;
  private PVector[] diceThreeDots;
  private PVector[] diceFourDots;
  private PVector[] diceFiveDots;
  private PVector[] diceSixDots;

  DiceDots() {
    this.setDotRadius(25);
    this.diceOneDot = new PVector[1];
    this.diceOneDot[0] = new PVector(width / 2, height / 2);

    this.diceTwoDots = new PVector[2];
    this.diceTwoDots[0] = new PVector(width / 2 - this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceTwoDots[1] = new PVector(width / 2 + this.getDotRadius(), height / 2 + this.getDotRadius());

    this.diceThreeDots = new PVector[3];
    this.diceThreeDots[0] = new PVector(width / 2 - this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceThreeDots[1] = new PVector(width / 2, height / 2);
    this.diceThreeDots[2] = new PVector(width / 2 + this.getDotRadius(), height / 2 + this.getDotRadius());

    this.diceFourDots = new PVector[4];
    this.diceFourDots[0] = new PVector(width / 2 - this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceFourDots[1] = new PVector(width / 2 + this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceFourDots[2] = new PVector(width / 2 - this.getDotRadius(), height / 2 + this.getDotRadius());
    this.diceFourDots[3] = new PVector(width / 2 + this.getDotRadius(), height / 2 + this.getDotRadius());

    this.diceFiveDots = new PVector[5];
    this.diceFiveDots[0] = new PVector(width / 2 - this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceFiveDots[1] = new PVector(width / 2 + this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceFiveDots[2] = new PVector(width / 2 - this.getDotRadius(), height / 2 + this.getDotRadius());
    this.diceFiveDots[3] = new PVector(width / 2 + this.getDotRadius(), height / 2 + this.getDotRadius());
    this.diceFiveDots[4] = new PVector(width / 2, height / 2);

    this.diceSixDots = new PVector[6];
    this.diceSixDots[0] = new PVector(width / 2 - this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceSixDots[1] = new PVector(width / 2 + this.getDotRadius(), height / 2 - this.getDotRadius());
    this.diceSixDots[2] = new PVector(width / 2 - this.getDotRadius(), height / 2 + this.getDotRadius());
    this.diceSixDots[3] = new PVector(width / 2 + this.getDotRadius(), height / 2 + this.getDotRadius());
    this.diceSixDots[4] = new PVector(width / 2 - this.getDotRadius(), height / 2);
    this.diceSixDots[5] = new PVector(width / 2 + this.getDotRadius(), height / 2);
  }
  
  public float getDotRadius() {
    return this.dotRadius;
  }

  public PVector[] getDiceDots(int diceValue) {
    PVector[] toReturn = null;
    switch (diceValue) {
    case 1:
      toReturn = this.diceOneDot;
      this.numString = "Uno";
      break;
    case 2:
      toReturn = this.diceTwoDots;
      this.numString = "Dos";
      break;
    case 3:
      toReturn = this.diceThreeDots;
      this.numString = "Tres";
      break;
    case 4:
      toReturn = this.diceFourDots;
      this.numString = "Cuatro";
      break;
    case 5:
      toReturn = this.diceFiveDots;
      this.numString = "Cinco";
      break;
    case 6:
      toReturn = this.diceSixDots;
      this.numString = "Seis";
      break;
    }
    return toReturn;
  }
  
  public String getNumString(int diceValue) {
    String numString = "";
    switch (diceValue) {
    case 1:
      numString = "Uno";
      break;
    case 2:
      numString = "Dos";
      break;
    case 3:
      numString = "Tres";
      break;
    case 4:
      numString = "Cuatro";
      break;
    case 5:
      numString = "Cinco";
      break;
    case 6:
      numString = "Seis";
      break;
    }
    return numString;
  }
  
  public void setDotRadius(float value) {
    this.dotRadius = value;
  }
}
