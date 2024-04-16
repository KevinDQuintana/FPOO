void setup() {
  float A;
  float B;
  float C;
  float result;
  
  A = 4;
  B = 5;
  C = 1;
  
  println("A: " + A);
  println("B: " + B);
  println("C: " + C);
  
  //Punto A
  println();
  result = B * A - pow(B, 2) / 4 * C;
  
  println("Punto A");
  println("B * A - B^2 / 4 * C = " + result);
  
  //Punto B
  println();
  result = (A * B) / pow(3, 2);
  
  println("Punto B");
  println("(A * B) / 3^2 = " + result);
  
  //Punto C
  println();
  result = (((B + C) / 2 * A + 10) * 3 * B) - 6;
  
  println("Punto C");
  println("(((B + C) / 2 * A + 10) * 3 * B) - 6 = " + result);
}
