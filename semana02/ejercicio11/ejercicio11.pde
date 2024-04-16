void setup() {
  float a;
  float b;
  float c;
  boolean result;
  
  a = 34;
  b = 12;
  c = 8;
  result = !(a + b == c) || (c != 0) && (b - c >= 19);
  
  println("a: " + a);
  println("b: " + b);
  println("c: " + c);
  println("!(a + b == c) || (c != 0) && (b - c >= 19) = " + result);
}
