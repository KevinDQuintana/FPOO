class Player {
  float posX;
  float posY;
  private int PWidth;
  private int PHeight;

  Player(float x, float y, int w, int h) {
    posX = x;
    posY = y;
    PWidth = w;
    PHeight = h;
  }

  public void draw() {
    rect(posX, posY, PWidth, PHeight);
  }
}

Player player = new Player(400 - 50, height, 100, 25);

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  player.draw();
}

void keyPressed() {
  if (key == 97) {
    player.posX = player.posX - 1;
  }
  if (key == 100) {
    player.posX = player.posX + 1;
  }
}
