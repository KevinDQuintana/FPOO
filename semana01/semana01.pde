int marioPos;
int koopaPos;
int distMK;

public void setup() {
  marioPos = 5;
  koopaPos = 10;
  distMK = calcDistanceMK();
  println(distMK);
  exit();
}

public int calcDistanceMK() {
  return koopaPos - marioPos;
}
