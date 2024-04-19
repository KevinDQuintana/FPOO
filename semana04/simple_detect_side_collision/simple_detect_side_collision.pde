class Circle {
  float x;
  float y;
  float size;

  Circle(float posX, float posY) {
    x = posX;
    y = posY;
    size = 15;
  }

  public void draw() {
    circle(x, y, size);
  }
}

class Rectangle {
  float x;
  float y;
  float rWidth;
  float rHeight;

  Rectangle(float posX, float posY) {
    x = posX;
    y = posY;
    rWidth = 50;
    rHeight = 50;
  }

  public void draw() {
    rect(x, y, rWidth, rHeight);
  }
}

//Circle circle;
Rectangle rect1;
Rectangle rect2;

void setup() {
  size(800, 600);
  frameRate(60);

  //circle = new Circle(0, 0);
  rect1 = new Rectangle(width / 2 - 25, height / 2 - 25);
  rect2 = new Rectangle(0, 0);
}
void draw() {
  //circle.x = mouseX;
  //circle.y = mouseY;
  rect2.x = mouseX;
  rect2.y = mouseY;

  checkCollisions();

  background(50);
  //circle.draw();
  rect1.draw();
  rect2.draw();
}

void checkCollisions() {
  if (rect1.x < rect2.x + rect2.rWidth &&
    rect1.x + rect1.rWidth > rect2.x &&
    rect1.y < rect2.y + rect2.rHeight &&
    rect1.y + rect1.rHeight > rect2.y) {
    float dx = rect2.x - rect1.x;
    float dy = rect2.y - rect1.y;

    //float circleRadius = circle.size / 2;
    float halfWidthRect1 = rect1.rWidth / 2;
    float halfHeightRect1 = rect1.rHeight / 2;
    float halfWidthRect2 = rect2.rWidth / 2;
    float halfHeightRect2 = rect2.rHeight / 2;

    float offsetX = halfWidthRect1 + halfWidthRect2 - abs(dx);
    float offsetY = halfHeightRect1 + halfHeightRect2 - abs(dy);

    if (offsetX < offsetY) {
      if (dx > 0) {
        println("RIGHT");
      } else {
        println("LEFT");
      }
    } else {
      if (dy > 0) {
        println("DOWN");
      } else {
        println("TOP");
      }
    }
  }
}
