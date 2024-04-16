import javax.swing.JOptionPane;

void setup() {
  String name;
  name = JOptionPane.showInputDialog("Ingresa tu nombre:");
  JOptionPane.showMessageDialog(null, "Hola " + name, "Saludo", 1);
}
