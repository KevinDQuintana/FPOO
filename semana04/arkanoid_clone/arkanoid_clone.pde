interface GameObject {
  float getX();
  void setX(float x);
  float getY();
  void setY(float y);
  float getWidth();
  float getHeight();
}

class Player implements GameObject {
  float x;
  float y;
  float w;
  float h;
  float speed;

  Player(float posX, float posY) {
    this.x = posX;
    this.y = posY;
    this.w = 100;
    this.h = 100;
    this.speed = 0;
  }

  public void draw() {
    rect(x, y, w, h);
  }
  
  float getX() {
    return this.x;
  }
  void setX(float x) {
    this.x = x;
  }
  float getY() {
    return this.y;
  }
  void setY(float y) {
    this.y = y;
  }
  float getWidth() {
    return this.w;
  }
  float getHeight() {
    return this.h;
  }
}

class Ball implements GameObject {
  float x;
  float y;
  float w;
  float h;
  float dx;
  float dy;
  float speed;

  Ball(float posX, float posY) {
    this.x = posX;
    this.y = posY;
    this.w = 30;
    this.h = 30;
    this.dx = 1;
    this.dy = 1;
    this.speed = 300;
  }

  public void draw() {
    ellipseMode(CORNER);
    ellipse(this.x, this.y, this.w, this.h);
  }

  public void changeDirectionX() {
    this.dx *= -1;
  }

  public void changeDirectionY() {
    this.dy *= -1;
  }
  
  float getX() {
    return this.x;
  }
  void setX(float x) {
    this.x = x;
  }
  float getY() {
    return this.y;
  }
  void setY(float y) {
    this.y = y;
  }
  float getWidth() {
    return this.w;
  }
  float getHeight() {
    return this.h;
  }
}

Player player;
Player playerTwo;
Ball ball;
long timeA;
long timeB;
float deltaTime;
PVector[] compass;

void setup() {
  frameRate(60);
  size(800, 600);
  textSize(16);
  fill(255);
  timeA = millis();
  //player = new Player((width / 2) - 50, height - 100);
  player = new Player((width / 2) - 50, height - 100);
  ball = new Ball(width / 2, height / 2);
  
  compass = new PVector[4];
  compass[0] = new PVector(0, -1);  //TOP
  compass[1] = new PVector(0, 1); //BOTTOM
  compass[2] = new PVector(-1, 0); //LEFT
  compass[3] = new PVector(1, 0);  //RIGHT
}

void draw() {
  timeB = millis();
  deltaTime = (timeB - timeA) / 1000.0;
  timeA = timeB;

  player.setX(mouseX);
  player.setY(mouseY);

  //if (keyPressed) {
  //  if (key == 'a') {
  //    player.speed = constrain(player.speed - 80, -300, 0);
  //  } else if (key == 'd') {
  //    player.speed = constrain(player.speed + 80, 0, 300);
  //  }
  //} else {
  //  if (player.speed < 0) {
  //    player.speed = constrain(player.speed + 20, -300, 0);
  //  } else if (player.speed > 0) {
  //    player.speed = constrain(player.speed - 20, 0, 300);
  //  }
  //}

  //player.x += player.speed * deltaTime;
  ball.x += ball.dx * ball.speed * deltaTime;
  ball.y += ball.dy * ball.speed * deltaTime;

  checkCollision();

  background(50);
  text("FPS: " + round(frameRate), 0, 16);
  player.draw();
  ball.draw();
}

void checkCollision() {
  //check player collision with window border
  if (player.x < 0) {
    player.x = 0;
    player.speed = 0;
  } else if (player.x + player.getWidth() > width) {
    player.x = width - player.getWidth();
    player.speed = 0;
  }

  //check ball collision with window border
  if (ball.x / 2 < 0 ||
      ball.x + ball.getWidth() > width) {
    ball.changeDirectionX();
  }

  if (ball.y / 2 < 0 ||
      ball.y + ball.getHeight() > height) {
    ball.changeDirectionY();
  }

  //check player ball collision
  if (AABB(player, ball)) {
    int side = whichSide(player, ball);
    switch (side) {
      case 0:
        ball.changeDirectionY();
        break;
      case 1:
        ball.changeDirectionY();
        break;
      case 2:
        ball.changeDirectionX();
        break;
      case 3:
        ball.changeDirectionX();
        break;
    }
  } //<>// //<>// //<>// //<>//
}

boolean AABB(GameObject objOne, GameObject objTwo) {
  return objOne.getX() + objOne.getWidth() >= objTwo.getX() &&
         objOne.getX() <= objTwo.getX() + objTwo.getWidth() &&
         objOne.getY() + objOne.getHeight() >= objTwo.getY() &&
         objOne.getY() <= objTwo.getY() + objTwo.getHeight();
}

void resolveCollision(GameObject objOne, GameObject objTwo) {}

int whichSide(GameObject objOne, GameObject objTwo) {
  PVector objOneCenter = new PVector(objOne.getX() + objOne.getWidth() / 2,
                                     objOne.getY() + objOne.getHeight() / 2);
  
  PVector objTwoCenter = new PVector(objTwo.getX() + objTwo.getWidth() / 2,
                                     objTwo.getY() + objTwo.getHeight() / 2);
                                     
  PVector OneTwo = PVector.sub(objTwoCenter, objOneCenter);
  OneTwo = OneTwo.normalize();
  int bestMatch = -1;
  float max = 0;
  for (int i = 0; i < 4; i++) {
    float dotProduct = PVector.dot(compass[i], OneTwo);
    if (dotProduct > max) {
      max = dotProduct;
      bestMatch = i;
    }
  }
  println(bestMatch);
  return bestMatch;
  //if (bestMatch == 0) {
  //  //objTwo.setY(objOne.getY() - objTwo.getHeight());
  //} else if (bestMatch == 1) {
  //  //objTwo.setY(objOne.getY() + objOne.getHeight());
  //} else if (bestMatch == 2) {
  //  //objTwo.setX(objOne.getX() - objTwo.getWidth());
  //} else if (bestMatch == 3) {
  //  //objTwo.setX(objOne.getX() + objOne.getWidth());
  //}
}
