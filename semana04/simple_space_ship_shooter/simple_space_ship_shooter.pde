import java.util.Iterator;

class Bullet {
  float x;
  float y;
  float w;
  float h;
  float speed;

  Bullet(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = 300;
  }

  public void draw() {
    rect(x, y, w, h);
  }
}

class Player {
  float x;
  float y;
  float w;
  float h;
  float fireRate;

  Player(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fireRate = 0.2;
  }

  public void draw() {
    rect(x, y, w, h);
  }

  PVector getPos() {
    return new PVector(this.x, this.y);
  }
  PVector getSize() {
    return new PVector(this.w, this.h);
  }

  void setPos(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Enemy {
  float x;
  float y;
  float w;
  float h;
  float speed;

  Enemy(float x, float y, float w, float h, float s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = s;
  }

  public void draw() {
    rect(x, y, w, h);
  }

  PVector getPos() {
    return new PVector(this.x, this.y);
  }
  PVector getSize() {
    return new PVector(this.w, this.h);
  }
}

Player player;
long timeA;
long timeB;
float deltaTime;
long fireTimeA;
long fireTimeB;
float elapsedFireTime;
long enemyTimeA;
long enemyTimeB;
float elapsedEnemyTime;
boolean[] wasdKeys;
ArrayList <Bullet> bullets;
ArrayList <Enemy> enemies;
int scoreA;
int scoreB;
int score;
int enemySpeed;
boolean gameOver;
String sGameOver;
String sRestart;

void setup() {
  size(800, 600);
  frameRate(60);

  wasdKeys = new boolean[5];
  wasdKeys[0] = false;
  wasdKeys[1] = false;
  wasdKeys[2] = false;
  wasdKeys[3] = false;
  wasdKeys[4] = false;

  score = 0;
  scoreA = 0;
  enemySpeed = 20;
  gameOver = false;
  timeA = millis();
  fireTimeA = millis();
  enemyTimeA = millis();
  player = new Player(0, 0, 50, 50);
  player.setPos(width / 2 - player.getSize().x / 2,
                height - 25 - player.getSize().y);

  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
}
void draw() {
  background(50);
  if (!gameOver) {
    timeB = millis();
    deltaTime = (timeB - timeA) / 1000.0;
    timeA = timeB;

    enemyTimeB = millis();
    elapsedEnemyTime = (enemyTimeB - enemyTimeA) / 1000.0;

    if (elapsedEnemyTime > 1.0) {
      enemyTimeA = enemyTimeB;
      float size = random(24, 51);
      Enemy enemy = new Enemy(random(0, width - size), -50, size, size, enemySpeed);
      enemies.add(enemy);
      if ((score - scoreA) > 100) {
        enemySpeed *= 2;
        scoreA = score;
      }
    }

    handlePlayerInput(player);
    if (!bullets.isEmpty()) {
      Iterator<Bullet> bulletIterator = bullets.iterator();
      while (bulletIterator.hasNext()) {
        Bullet bullet = bulletIterator.next();
        bullet.y -= bullet.speed * deltaTime;
        bullet.draw();
        if (bullet.y < -50) {
          bulletIterator.remove();
        } else {
          Iterator<Enemy> enemyIterator = enemies.iterator();
          while (enemyIterator.hasNext()) {
            Enemy enemy = enemyIterator.next();
            if (checkCollision(enemy, bullet)) {
              //println("collision");
              enemyIterator.remove();
              bulletIterator.remove();
              score += 10;
              break;
            }
          }
        }
      }
    }


    if (!enemies.isEmpty()) {
      for (int i = 0; i < enemies.size(); i++) {
        Enemy enemy = enemies.get(i);
        if (enemy.y > height) {
          enemy = null;
          enemies.remove(i);
          gameOver = true;
        } else {
          enemy.y += enemy.speed * deltaTime;
          enemy.draw();
        }
      }
      //println("enemyArrayCount: " + enemies.size());
    }

    player.draw();
    textSize(16);
    text(round(frameRate), 0, 16);
    text("Score: " + score, width - 100, 16);
  } else {
    sGameOver = "Game Over";
    sRestart = "Press R to restart.";
    text(sGameOver, width / 2 - textWidth(sGameOver) / 2, height / 2);
    text(sRestart, width / 2 - textWidth(sRestart) / 2, height / 2 + 20);
    if (keyPressed) {
      if (key == 'r') {
        gameOver = false;
        reStart();
      }
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    wasdKeys[0] = true;
  }
  if (key == 'a') {
    wasdKeys[1] = true;
  }
  if (key == 's') {
    wasdKeys[2] = true;
  }
  if (key == 'd') {
    wasdKeys[3] = true;
  }
  if (key == 32) {
    wasdKeys[4] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    wasdKeys[0] = false;
  }
  if (key == 'a') {
    wasdKeys[1] = false;
  }
  if (key == 's') {
    wasdKeys[2] = false;
  }
  if (key == 'd') {
    wasdKeys[3] = false;
  }
  if (key == 32) {
    wasdKeys[4] = false;
  }
}

void handlePlayerInput(Player obj) {
  if (wasdKeys[0]) {
    //println("TOP");
    obj.y = (obj.getPos().y - 10);
  }
  if (wasdKeys[1]) {
    //println("LEFT");
    obj.x = (obj.getPos().x - 10);
  }
  if (wasdKeys[2]) {
    //println("BOTTOM");
    obj.y = (obj.getPos().y + 10);
  }
  if (wasdKeys[3]) {
    //println("RIGHT");
    obj.x = (obj.getPos().x + 10);
  }
  if (wasdKeys[4]) {
    fireTimeB = millis();
    elapsedFireTime = (fireTimeB - fireTimeA) / 1000.0;
    if (elapsedFireTime > player.fireRate) {
      fireTimeA = fireTimeB;
      Bullet bullet = new Bullet(player.getPos().x + player.getSize().x / 2 - 7.5,
        player.getPos().y, 15, 30);
      bullets.add(bullet);
    }
  }
}

boolean checkCollision(Enemy objOne, Bullet objTwo) {
  return objOne.x < objTwo.x + objTwo.w &&
    objOne.x + objOne.w > objTwo.x &&
    objOne.y < objTwo.y + objTwo.h &&
    objOne.y + objOne.h > objTwo.y;
}

void reStart() {
  score = 0;
  scoreA = 0;
  enemySpeed = 20;
  gameOver = false;
  timeA = millis();
  fireTimeA = millis();
  enemyTimeA = millis();
  player = new Player(0, 0, 50, 50);
  player.setPos(width / 2 - player.getSize().x / 2,
                height - 25 - player.getSize().y);
  enemies.clear();
  bullets.clear();
}
