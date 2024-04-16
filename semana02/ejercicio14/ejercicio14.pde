import javax.swing.JOptionPane;

void setup() {
  float a;
  float b;
  float hyp;
  
  a = float(JOptionPane.showInputDialog(null, "Ingrese el Cateto A: "));
  b = float(JOptionPane.showInputDialog(null, "Ingrese el Cateto B: "));
  
  hyp = sqrt(sq(a) + sq(b));
  JOptionPane.showMessageDialog(null, "Hipotenusa: " + hyp, "Hipotenusa", 1);
}
