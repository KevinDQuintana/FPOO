void setup() {
  //Punto A
  float a;
  float b;
  float c;
  float d;
  float x;
  float y;
  float result;
  
  a = random(-100, 100);
  b = random(-100, 100);
  c = random(-100, 100);
  
  result = pow(b, 2) - 4 * a * c;
  
  println("Punto A");
  println("a: " + a);
  println("b: " + b);
  println("c: " + c);
  println("b^2 - 4 * a * c = " + result);
  
  //Punto B
  println();
  x = random(-100, 100);
  
  result = 3 * pow(x, 4) - 5 * pow(x, 3) + 12 * x - 17;
  
  println("Punto B");
  println("x: " + x);
  println("3 * x^4 - 5 * x^3 + 12x - 17 = " + result);
  
  //Punto C
  println();
  b = random(-100, 100);
  c = random(-100, 100);
  d = random(-100, 100);
  
  println("Punto C");
  println("b: " + b);
  println("c: " + c);
  println("d: " + d);
  
  result = (b + d) / (c + 4);
  
  println("(b + d) / (c + 4) = " + result);
  
  //Punto D
  println();
  //x = random(-100, 100);
  //y = random(-100, 100);
  x = 2;
  y = 2;
  
  result = sqrt(pow(x, 2) + pow(y, 2));
  
  println("Punto D");
  println("x: " + x);
  println("y: " + y);
  println("(x^2 + y^2)^(1 / 2) = " + result);
}
