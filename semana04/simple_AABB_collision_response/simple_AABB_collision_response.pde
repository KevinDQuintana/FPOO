class AABB {
  float x;
  float y;
  float w;
  float h;
  
  AABB(Rectangle obj) {
    this.x = obj.x;
    this.y = obj.y;
    this.w = obj.w;
    this.h = obj.h;
  }
  
  PVector getMin() {
    return new PVector(this.x, this.y);
  }
  
  PVector getMax() {
    return new PVector(this.x + this.w, this.y + this.h);
  }
  
  PVector getCenter() {
    return new PVector(this.x + this.w / 2, this.y + this.h / 2);
  }
  
  void update(Rectangle obj) {
    this.x = obj.x;
    this.y = obj.y;
    this.w = obj.w;
    this.h = obj.h;
  }
}

class Rectangle {
  float x;
  float y;
  float w;
  float h;
  
  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw() {
    rect(x, y, w, h);
  }
}

Rectangle rectMouse;
Rectangle rectStatic;
AABB rectMouseAABB;
AABB rectStaticAABB;

PVector[] compass;

void setup() {
  size(800, 600);
  frameRate(60);
  
  rectMouse = new Rectangle(0, 0, 25, 25);
  rectStatic = new Rectangle(width / 2 - 25, height / 2 + 25, 50, 50);
  rectMouseAABB = new AABB(rectMouse);
  rectStaticAABB = new AABB(rectStatic);
  
  compass = new PVector[4];
  compass[0] = new PVector(0, -1);
  compass[1] = new PVector(0, 1);
  compass[2] = new PVector(-1, 0);
  compass[3] = new PVector(1, 0);
}

void draw() {
  background(50);
  rectMouse.x = mouseX - rectMouse.w / 2;
  rectMouse.y = mouseY - rectMouse.h / 2;
  
  rectMouseAABB.update(rectMouse);
  rectStaticAABB.update(rectStatic);
  
  if (checkCollision(rectStaticAABB, rectMouseAABB)) {
    int side = whichDirection(rectStaticAABB, rectMouseAABB);
    switch (side) {
      case 0:
        rectMouse.y = rectStatic.y - rectMouse.h;
        rectStatic.y += 1;
        break;
      case 1:
        rectMouse.y = rectStatic.y + rectStatic.h;
        rectStatic.y -= 1;
        break;
      case 2:
        rectMouse.x = rectStatic.x - rectMouse.w;
        rectStatic.x += 1;
        break;
      case 3:
        rectMouse.x = rectStatic.x + rectStatic.w;
        rectStatic.x -= 1;
        break;
    }
    fill(255, 0, 0);
  } else {
    fill(255, 255, 255);
  }
  
  rectMouse.draw();
  rectStatic.draw();
}

boolean checkCollision(AABB objOne, AABB objTwo) {
  return objOne.getMin().x < objTwo.getMax().x &&
         objOne.getMin().y < objTwo.getMax().y &&
         objOne.getMax().x > objTwo.getMin().x &&
         objOne.getMax().y > objTwo.getMin().y;
}

int whichDirection(AABB target, AABB origin) {
  PVector toVec = PVector.sub(origin.getCenter(), target.getCenter());
  toVec.normalize();
  
  int side = -1;
  float max = 0;
  
  for (int i = 0; i < compass.length; i++) {
    float dotProduct = PVector.dot(compass[i], toVec);
    if (dotProduct > max) {
      max = dotProduct;
      side = i;
    }
  }
  return side;
}
