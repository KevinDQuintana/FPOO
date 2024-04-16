void setup() {
  float x;
  float y;
  float z;
  float ROne;
  boolean RTwo;
  
  x = 3;
  y = 4;
  z = 1;
  
  //R1
  println("R1");
  ROne = y + z;
  println("y + z = " + ROne);
  
  //R2
  println();
  println("R2");
  RTwo = (x >= ROne);
  println("(x >= R1) = " + RTwo);
}
