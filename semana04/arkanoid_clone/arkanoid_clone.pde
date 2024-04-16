class Player {
  float posX;
  float posY;
  float PWidth;
  float PHeight;
  float speed;

  Player(float x, float y, float w, float h, float s) {
    posX = x;
    posY = y;
    PWidth = w;
    PHeight = h;
    speed = s;
  }

  public void draw() {
    rect(posX, posY, PWidth, PHeight);
  }
}

Player player;
long timeA;
long timeB;
float deltaTime;

void setup() {
  size(800, 600);
  timeA = millis();
  player = new Player(width / 2 - 50, height - 100, 100, 25, 300);
}

void draw() {
  timeB = millis();
  deltaTime = (timeB - timeA) / 1000.0;
  timeA = timeB;
  
  println(deltaTime);
  
  if (keyPressed) {
    if (key == 'a') {
      player.posX -= player.speed * deltaTime;
    } else if (key == 'd') {
      player.posX += player.speed * deltaTime;
    }
  }
  
  background(50);
  player.draw();
}

//void keyPressed() {
//  if (key == 97 && player.posX > 0) {
//    player.posX = player.posX - player.speed * deltaTime;
//  }
//  if (key == 100 && player.posX + player.PWidth < width) {
//    player.posX = player.posX + player.speed * deltaTime;
//  }
//}
