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

Player player;
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
}

void draw() {
  timeB = millis();
  deltaTime = timeB - timeA;
  timeA = timeB;

  if (keyPressed) {
    if (key == 'a') {
      player.speed = constrain(player.speed - 0.08, -2, 0);
    } else if (key == 'd') {
      player.speed = constrain(player.speed + 0.08, 0, 2);
    }
  } else {
    if (player.speed < 0) {
      player.speed = constrain(player.speed + 0.02, -10, 0);
    } else if (player.speed > 0) {
      player.speed = constrain(player.speed - 0.02, 0, 10);
    }
  }
  
  player.x += player.speed * deltaTime;
  
  if (player.x < 0) {
    player.x = 0;
    player.speed = 0;
  } else if (player.x + player.pWidth > width) {
    player.x = width - player.pWidth;
    player.speed = 0;
  }

  background(50);
  text("FPS: " + frameRate, 0, 16);
  player.draw();
}
