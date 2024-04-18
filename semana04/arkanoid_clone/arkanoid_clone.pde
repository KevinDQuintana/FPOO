class Player {
  float x;
  float y;
  float pWidth;
  float pHeight;

  float speed;

  Player(float posX, float posY) {
    x = posX;
    y = posY;
    pWidth = 100;
    pHeight = 25;

    speed = 0;
  }

  public void draw() {
    rect(x, y, pWidth, pHeight);
  }
}

class Ball {
  float x;
  float y;
  float size;
  
  float speed;
  
  Ball(float posX, float posY) {
    x = posX;
    y = posY;
    size = 30;
    speed = 300;
  }
  
  public void draw() {
    circle(x, y, size);
  }
}

Player player;
Ball ball;
long timeA;
long timeB;
float deltaTime;

void setup() {
  frameRate(60);
  size(800, 600);
  textSize(16);
  fill(255);
  timeA = millis();
  player = new Player((width / 2) - 50, height - 100);
  ball = new Ball(player.x + player.pWidth / 2, player.y - 30 / 2);
}

void draw() {
  timeB = millis();
  deltaTime = (timeB - timeA) / 1000.0;
  timeA = timeB;

  if (keyPressed) {
    if (key == 'a') {
      player.speed = constrain(player.speed - 80, -2000, 0);
    } else if (key == 'd') {
      player.speed = constrain(player.speed + 80, 0, 2000);
    }
  } else {
    if (player.speed < 0) {
      player.speed = constrain(player.speed + 20, -2000, 0);
    } else if (player.speed > 0) {
      player.speed = constrain(player.speed - 20, 0, 2000);
    }
  }
  
  player.x += player.speed * deltaTime;
  ball.x -= ball.speed * deltaTime;
  ball.y -= ball.speed * deltaTime;
  
  if (player.x < 0) {
    player.x = 0;
    player.speed = 0;
  } else if (player.x + player.pWidth > width) {
    player.x = width - player.pWidth;
    player.speed = 0;
  }
  
  if (ball.x + 15 < 0) {
    ball.x = 0;
    ball.x = -ball.x;
  }
  
  if (ball.y + 15 < 0) {
    ball.y = 0;
    ball.y = -ball.y;
  }

  background(50);
  text("FPS: " + round(frameRate), 0, 16);
  player.draw();
  ball.draw();
}
