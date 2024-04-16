void setup() {
  float a;
  float b;
  float x;
  float y;
  boolean result;
  
  a = 31;
  b = -1;
  x = 3;
  y = 2;
  result = a + b - 1 < x * y;
  
  println("a: " + a);
  println("b: " + b);
  println("x: " + x);
  println("y: " + y);
  println("a + b - 1 < x * y = " + result);
}
