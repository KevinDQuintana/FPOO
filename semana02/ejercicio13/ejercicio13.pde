import javax.swing.JOptionPane;

void setup() {
  float a;
  float b;
  float c;
  float perimeter;

  float triangleBase;
  float triangleHeight;
  float area;

  a = float(JOptionPane.showInputDialog(null, "Ingrese el lado A:"));
  b = float(JOptionPane.showInputDialog(null, "Ingrese el lado B:"));
  c = float(JOptionPane.showInputDialog(null, "Ingrese el lado C:"));
  perimeter = a + b + c;

  JOptionPane.showMessageDialog(null,
    "Perimetro: " + perimeter, "Perimetro de un Triangulo", 1);

  triangleBase = float(JOptionPane.showInputDialog(null, "Ingrese la base:"));
  triangleHeight = float(JOptionPane.showInputDialog(null, "Ingrese la altura:"));
  area = triangleBase * triangleHeight;
  
  JOptionPane.showMessageDialog(null,
    "Area: " + area, "Area de un Triangulo", 1);
}
