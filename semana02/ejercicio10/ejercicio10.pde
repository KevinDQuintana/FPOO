void setup() {
  float i;
  float j;
  boolean result;
  
  i = 22;
  j = 3;
  result = !((i > 4) || !(j <= 6));
  
  println("i: " + i);
  println("j: " + j);
  println("!((i > 4) || !(j = 6)) = " + result);
}
