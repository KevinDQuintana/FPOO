void setup() {
  float x;
  float y;
  boolean result;
  
  x = 6;
  y = 8;
  result = !(x < 5) && !(y >= 7);
  
  println("x: " + x);
  println("y: " + y);
  println("!(x < 5) && !(y >= 7) = " + result);
}
