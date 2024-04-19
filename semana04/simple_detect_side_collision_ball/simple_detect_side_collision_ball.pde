interface Collidable {
  float getX();
  float getY();
  float getWidth();
  float getHeight();
}

class Ball implements Collidable {
  float x;
  float y;
  float w;
  float h;

  Ball(float posX, float posY, float bWidth, float bHeight) {
    this.x = posX;
    this.y = posY;
    this.w = bWidth;
    this.h = bHeight;
  }

  public void draw() {
    ellipseMode(CORNER);
    ellipse(x, y, w, h);
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getWidth() {
    return w;
  }
  float getHeight() {
    return h;
  }
}

class Rectangle implements Collidable {
  float x;
  float y;
  float w;
  float h;

  Rectangle(float posX, float posY, float bWidth, float bHeight) {
    this.x = posX;
    this.y = posY;
    this.w = bWidth;
    this.h = bHeight;
  }

  public void draw() {
    rect(x, y, w, h);
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getWidth() {
    return w;
  }
  float getHeight() {
    return h;
  }
}

Ball ball;
Rectangle rect1;
Rectangle rect2;

void setup() {
  size(800, 600);
  frameRate(60);

  ball = new Ball(0, 0, 30, 30);
  rect1 = new Rectangle(0, 0, 25, 25);
  rect2 = new Rectangle(width / 2 - 25, height / 2 - 25, 50, 50);
}
void draw() {
  ball.x = mouseX - ball.w / 2;
  ball.y = mouseY - ball.h / 2;
  //rect1.x = mouseX - 25 / 2;
  //rect1.y = mouseY - 25 / 2;

  checkCollision(rect2, ball);

  background(50);
  ball.draw();
  rect1.draw();
  rect2.draw();
}

void checkCollision(Collidable objOne, Collidable objTwo) {
  if (objOne.getX() < objTwo.getX() + objTwo.getWidth() &&
      objOne.getX() + objOne.getWidth() > objTwo.getX() &&
      objOne.getY() < objTwo.getY() + objTwo.getHeight() &&
      objOne.getY() + objOne.getHeight() > objTwo.getY()) {
    whichSide(objOne, objTwo);
  }
}

void whichSide(Collidable objOne, Collidable objTwo) {
  float dx = objTwo.getX() - objOne.getX();
  float dy = objTwo.getY() - objOne.getY();

  float objOneHalfW = objOne.getWidth() / 2;
  float objOneHalfH = objOne.getHeight() / 2;
  float objTwoHalfW = objTwo.getWidth() / 2;
  float objTwoHalfH = objTwo.getHeight() / 2;

  float offsetX = objOneHalfW + objTwoHalfW - abs(dx);
  float offsetY = objOneHalfH + objTwoHalfH - abs(dy);

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
