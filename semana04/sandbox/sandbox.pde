class AABB {
  float minX;
  float minY;
  float maxX;
  float maxY;

  AABB (Rectangle obj) {
    this.minX = obj.getX();
    this.minY = obj.getY();
    this.maxX = obj.getX() + obj.getW();
    this.maxY = obj.getY() + obj.getH();
  }
  
  PVector getMin() {
    return new PVector(this.minX, this.minY);
  }
  
  PVector getMax() {
    return new PVector(this.maxX, this.maxY);
  }
  
  public void draw() {
    noFill();
    stroke(color(255, 0, 0));
    rect(this.minX, this.minY, this.maxX - this.minX, this.maxY - this.minY);
  }
  
  void update(Rectangle obj) {
    this.minX = obj.getX();
    this.minY = obj.getY();
    this.maxX = obj.getX() + obj.getW();
    this.maxY = obj.getY() + obj.getH();
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
  
  float getX() {return this.x;}
  float getY() {return this.y;}
  float getW() {return this.w;}
  float getH() {return this.h;}
  PVector getPos() {return new PVector(this.x, this.y);}
  PVector getSize() {return new PVector(this.w, this.h);}
  
  void setX(float x) {this.x = x;}
  void setY(float y) {this.y = y;}
}

Rectangle rectOne;
AABB rectOneAABB;
PVector contactPoint;
PVector contactNormal;
float tHitNear;

boolean[] wasdKeys;

void setup() {
  size(800, 600);
  frameRate(60);
  
  rectOne = new Rectangle(width / 2, height / 2, 100, 100);
  rectOneAABB = new AABB(rectOne);
  
  wasdKeys = new boolean[4];
  wasdKeys[0] = false;
  wasdKeys[1] = false;
  wasdKeys[2] = false;
  wasdKeys[3] = false;
  
  contactPoint = new PVector(0, 0);
  contactNormal = new PVector(0, 0);
  tHitNear = 0;
}

void draw() {
  background(50);
  
  handleMoveRequest();
  rectOneAABB.update(rectOne);
  
  //rayVsRect Collision START
  PVector rayPoint = new PVector(20, 20);
  PVector rayDirection = new PVector(mouseX, mouseY).sub(rayPoint);
  //dont forget to subtract the rayPoint from rayDirection
  
  line(rayPoint.x, rayPoint.y, mouseX, mouseY);
  if (rayVsRect(rayPoint, rayDirection, rectOne) && tHitNear < 1) {
    circle(contactPoint.x, contactPoint.y, 10);
    fill(255, 0, 0);
    rectOne.draw();
  } else {
    fill(255, 255, 255);
    rectOne.draw();
  }
  //rayVsRect Collision END
  
  //rectOneAABB.draw();
}

void keyPressed() {
  if (key == 'w') {wasdKeys[0] = true;}
  if (key == 'a') {wasdKeys[1] = true;}
  if (key == 's') {wasdKeys[2] = true;}
  if (key == 'd') {wasdKeys[3] = true;}
}

void keyReleased() {
  if (key == 'w') {wasdKeys[0] = false;}
  if (key == 'a') {wasdKeys[1] = false;}
  if (key == 's') {wasdKeys[2] = false;}
  if (key == 'd') {wasdKeys[3] = false;}
}

void handleMoveRequest() {
  if (wasdKeys[0]) {
    //println("TOP");
    rectOne.setY(rectOne.getY() - 10);
  }
  if (wasdKeys[1]) {
    //println("LEFT");
    rectOne.setX(rectOne.getX() - 10);
  }
  if (wasdKeys[2]) {
    //println("BOTTOM");
    rectOne.setY(rectOne.getY() + 10);
  }
  if (wasdKeys[3]) {
    //println("RIGHT");
    rectOne.setX(rectOne.getX() + 10);
  }
}

//checks collision between a point and a rectangle
boolean pointVsRect(PVector point, Rectangle rect) {
  return point.x >= rect.getX() &&
         point.y >= rect.getY() &&
         point.x < rect.getX() + rect.getW() &&
         point.y < rect.getY() + rect.getH();
}

//checks collision between a ray and a rectangle
boolean rayVsRect(PVector rayOrigin, PVector rayDir, Rectangle target) {
  PVector tNear = vecDiv(target.getPos().sub(rayOrigin), rayDir);
  PVector tFar = vecDiv(target.getPos().add(target.getSize())
                                       .sub(rayOrigin), rayDir);
  
  if (tNear.x > tFar.x) {
    float aux = tNear.x;
    tNear.x = tFar.x;
    tFar.x = aux;
  }
  
  if (tNear.y > tFar.y) {
    float aux = tNear.y;
    tNear.y = tFar.y;
    tFar.y = aux;
  }
  
  if (tNear.x > tFar.y || tNear.y > tFar.x) {return false;}
  
  tHitNear = max(tNear.x, tNear.y);
  float tHitFar = min(tFar.x, tFar.y);
  
  if (tHitFar < 0) {return false;}
  
  contactPoint = rayOrigin.add(rayDir.mult(tHitNear));
  
  if (tNear.x > tNear.y) {
    if (rayDir.x < 0) {
      contactNormal.x = 1;
      contactNormal.y = 0;
    } else {
      contactNormal.x = -1;
      contactNormal.y = 0;
    } 
  } else if (tNear.x < tNear.y) {
    if (rayDir.y < 0) {
      contactNormal.x = 0;
      contactNormal.y = 1;
    } else {
      contactNormal.x = 0;
      contactNormal.y = -1;
    }
  }
  
  return true;
}

PVector vecDiv(PVector a, PVector b) {
  return new PVector(a.x / b.x, a.y / b.y);
}
