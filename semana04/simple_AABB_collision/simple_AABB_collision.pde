class Rectangle {
  float x;
  float y;
  float rWidth;
  float rHeight;
  
  Rectangle(float posX, float posY, float w, float h) {
    x = posX;
    y = posY;
    rWidth = w;
    rHeight = h;
  }
  
  public void draw() {
    rect(x, y, rWidth, rHeight);
  }
}

Rectangle rect1;
Rectangle rect2;

void setup() {
  size(800, 600);
  frameRate(60);
  
  rect1 = new Rectangle(width / 2, height / 2, 50, 50);
  rect2 = new Rectangle(width / 2, height / 2, 50, 50);
}
void draw() {
  rect2.x = mouseX - rect2.rWidth / 2;
  rect2.y = mouseY - rect2.rHeight / 2;
  
  if (checkCollisions()) {
    fill(255, 0, 0);
  } else {
    fill(255, 255, 255);
  }
  
  background(50);
  rect1.draw();
  rect2.draw();
}

boolean checkCollisions() {
  return rect1.x < rect2.x + rect2.rWidth &&
      rect1.x + rect1.rWidth > rect2.x &&
      rect1.y < rect2.y + rect2.rHeight &&
      rect1.y + rect1.rHeight > rect2.y;
}
