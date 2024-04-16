void setup() {
  float contador1;
  float contador2;
  float ROne;
  boolean RTwo;
  
  contador1 = 3;
  contador2 = 4;

  println("contador1: " + contador1);
  println("contador2: " + contador2);
  
  //R1
  println();
  println("R1");
  
  ROne = ++contador1;
  
  println("++contador1 = " + ROne);
  
  //R2
  println();
  println("R2");
  
  RTwo = contador1 < contador2;
  
  println("contador1 < contador2 = " + RTwo);
}
