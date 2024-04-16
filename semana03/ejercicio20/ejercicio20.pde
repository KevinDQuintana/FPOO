void setup() {
  size(440, 420);
  background(255/2);
  fill(25);

  int posX = 20;
  int posY = 20;
  int marginX = 20;
  int marginY = 20;
  int rectWidth = 40;
  int rectHeight = 20;

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 7; j++) {
      rect(posX, posY, rectWidth, rectHeight);
      posX = posX + marginX + rectWidth;
    }
    posX = 20;
    posY = posY + marginY + rectHeight;
  }
}
