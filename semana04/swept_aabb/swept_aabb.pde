interface GameObject {
  float getX();
  float getY();
  float getWidth();
  float getHeight();
  float getVelX();
  float getVelY();

  void setX(float x);
  void setY(float y);
}

class Rectangle implements GameObject {
  float x;
  float y;
  float w;
  float h;
  float vx;
  float vy;
  
  //
  //PVector[] vertex;
  PVector vertex0;
  PVector vertex1;
  PVector vertex2;
  PVector vertex3;
  //

  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vx = 50;
    this.vy = 50;
    
    //
    //vertex = new PVector[4];
    //vertex[0] = new PVector(this.x, this.y);
    //vertex[1] = new PVector(this.x + this.w, this.y);
    //vertex[2] = new PVector(this.x + this.w, this.y + this.h);
    //vertex[3] = new PVector(this.x, this.y + this.h);
    this.vertex0 = new PVector(this.getX(), this.y);
    this.vertex1 = new PVector(this.x + this.w, this.y);
    this.vertex2 = new PVector(this.x + this.w, this.y + this.h);
    this.vertex3 = new PVector(this.x, this.y + this.h);
    //
  }

  public void draw() {
    rect(x, y, w, h);
  }

  float getX() {
    return this.x;
  }

  float getY() {
    return this.y;
  }

  float getWidth() {
    return this.w;
  }

  float getHeight() {
    return this.h;
  }

  float getVelX() {
    return this.vx;
  }

  float getVelY() {
    return this.vy;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }
}

float timeA;
float timeB;
float deltaTime;

float normalX;
float normalY;

Rectangle rectOne;
Rectangle rectTwo;
Rectangle rectThree;
Rectangle rectMouse;
Rectangle rectOldPos;
Rectangle rectStatic;
void setup() {
  size(800, 600);
  frameRate(60);

  timeA = millis();

  //rectOne = new Rectangle(width / 2, height / 2, 50, 50);
  //rectTwo = new Rectangle(0, 0, 50, 50);
  //rectThree = new Rectangle(width / 2 + 150, height / 2, 50, 50);
  rectOldPos = new Rectangle(100, 350, 50, 50);
  rectMouse = new Rectangle(height - 100, 350, 50, 50);
  rectStatic = new Rectangle(height / 2, 350, 50, 50);
}

void draw() {
  timeB = millis();
  deltaTime = (timeB - timeA) / 1000.0;
  timeA = timeB;
  //float collisionTime = sweptAABB(rectStatic, rectMouse);
  
  rectMouse.setX(mouseX - 25);
  rectMouse.setY(mouseY - 25);
  
  if (keyPressed) {
    if (key == 'a') {
      //if (collisionTime < 0.02) {
      //  rectThree.setX(rectThree.getX() - rectThree.getVelX() * collisionTime + 0.01);
      //} else {
      //  rectThree.setX(rectThree.getX() - rectThree.getVelX() * deltaTime);
      //}
      rectThree.setX(rectThree.getX() - rectThree.getVelX() * deltaTime);
    } 
    
    if (key == 'd') {
      //if (collisionTime < 0.02) {
      //  rectThree.setX(rectThree.getX() + rectThree.getVelX() * collisionTime);
      //} else {
      //  rectThree.setX(rectThree.getX() + rectThree.getVelX() * deltaTime);
      //}
      rectThree.setX(rectThree.getX() + rectThree.getVelX() * deltaTime);
    }
    
    if (key == 'w') {
      rectThree.setY(rectThree.getY() - rectThree.getVelY() * deltaTime);
    }
    
    if (key == 's') {
      rectThree.setY(rectThree.getY() + rectThree.getVelY() * deltaTime);
    }
  }
  
  //println("collisionTime: " + collisionTime);
  //println("deltaTime: " + deltaTime);
  //println("rectThreeVelX: " + rectThree.getVelX());
  //println("xNormal: " + normalX);
  //println("yNormal: " + normalY);

  background(50);
  //rectOne.draw();
  //rectTwo.draw();
  //rectThree.draw();
  rectMouse.draw();
  rectOldPos.draw();
  rectStatic.draw();
  //
  //line(rectOldPos.vertex0.x,
  //     rectOldPos.vertex0.y,
  //     rectMouse.vertex0.x,
  //     rectMouse.vertex0.y);
  //line(rectOldPos.x,
  //     rectOldPos.y,
  //     rectMouse.x,
  //     rectMouse.y);
       
  //line(rectOldPos.x + rectOldPos.getWidth(),
  //     rectOldPos.y,
  //     rectMouse.x + rectMouse.getWidth(),
  //     rectMouse.y);
       
  //line(rectOldPos.x + rectOldPos.getWidth(),
  //     rectOldPos.y + rectOldPos.getHeight(),
  //     rectMouse.x + rectMouse.getWidth(),
  //     rectMouse.y + rectMouse.getHeight());
       
  //line(rectOldPos.x,
  //     rectOldPos.y + rectOldPos.getHeight(),
  //     rectMouse.x,
  //     rectMouse.y + rectMouse.getHeight());
  //
  Rectangle broadphasebox = GetSweptBoadphaseBox(rectMouse);
  if (AABBCheck(broadphasebox, rectStatic)) {
    float collisionTime = sweptAABB(rectMouse, rectStatic);
    rectMouse.x += rectMouse.vx * collisionTime;
    rectMouse.y += rectMouse.vy * collisionTime;
    if (collisionTime < 1) {
      println("collision");
    }
    println("collisionTime: " + collisionTime);
  }
}

float sweptAABB(GameObject objOne, GameObject objTwo) {

  float xInvEntry;
  float yInvEntry;
  float xInvExit;
  float yInvExit;

  if (objOne.getVelX() > 0) {
    xInvEntry = objTwo.getX() - (objOne.getX() + objOne.getWidth());
    xInvExit = (objTwo.getX() + objTwo.getWidth()) - objOne.getX();
  } else {
    xInvEntry = (objTwo.getX() + objTwo.getWidth()) - objOne.getX();
    xInvExit = objTwo.getX() - (objOne.getX() + objOne.getWidth());
  }

  if (objOne.getVelY() > 0) {
    yInvEntry = objTwo.getY() - (objOne.getY() + objOne.getHeight());
    yInvExit = (objTwo.getY() + objTwo.getHeight()) - objOne.getY();
  } else {
    yInvEntry = (objTwo.getY() + objTwo.getHeight()) - objOne.getY();
    yInvExit = objTwo.getY() - (objOne.getY() + objOne.getHeight());
  }
  
  //
  //xInvEntry = objTwo.getX() - (objOne.getX() + objOne.getWidth());
  //yInvEntry = objTwo.getY() - (objOne.getY() + objOne.getHeight());
  //xInvExit = (objTwo.getX() + objTwo.getWidth()) - objOne.getX();
  //yInvExit = (objTwo.getY() + objTwo.getHeight()) - objOne.getY();
  //

  float xEntry;
  float yEntry;
  float xExit;
  float yExit;

  if (objOne.getVelX() == 0) {
    xEntry = -Float.MAX_VALUE;
    xExit = Float.MAX_VALUE;
  } else {
    xEntry = xInvEntry / objOne.getVelX();
    xExit = xInvExit / objOne.getVelX();
  }

  if (objOne.getVelY() == 0) {
    yEntry = -Float.MAX_VALUE;
    yExit = Float.MAX_VALUE;
  } else {
    yEntry = yInvEntry / objOne.getVelY();
    yExit = yInvExit / objOne.getVelY();
  }

  //
  //if (yEntry > 1.0f) yEntry = -Float.MAX_VALUE;
  //if (xEntry > 1.0f) xEntry = -Float.MAX_VALUE;
  //

  float entryTime = max(xEntry, yEntry);
  float exitTime = min(xExit, yExit);

  //println("xEntry: " + xEntry);
  //println("yEntry: " + yEntry);
  //println("xInvEntry: " + xInvEntry);
  //println("yInvEntry: " + yInvEntry);
  //println("entryTime: " + entryTime);
  //println("exitTime: " + exitTime);

  //
  //if (entryTime > exitTime) return 1.0f; // This check was correct.
  //if (xEntry < 0.0f && yEntry < 0.0f) return 1.0f;
  //if (xEntry < 0.0f) {
  //    // Check that the bounding box started overlapped or not.
  //    if (objOne.getX() + objOne.getWidth() < objTwo.getX() || objOne.getX() > objTwo.getX() + objTwo.getWidth()) return 1.0f;
  //}
  //if (yEntry < 0.0f) {
  //    // Check that the bounding box started overlapped or not.
  //    if (objOne.getY() + objOne.getHeight() < objTwo.getY() || objOne.getY() > objTwo.getY() + objTwo.getHeight()) return 1.0f;
  //}
  //

  //if there was no collision
  if (entryTime > exitTime || xEntry < 0 &&
      yEntry < 0 || xEntry > 1 || yEntry > 1) {
    normalX = 0;
    normalY = 0;
    return 1;
  } else {
    if (xEntry > yEntry) {
      if (xInvEntry < 0) {
        normalX = 1;
        normalY = 0;
        //println("RIGHT");
      } else {
        normalX = -1;
        normalY = 0;
        //println("LEFT");
      }
    } else {
      if (yInvEntry < 0) {
        normalX = 0;
        normalY = 1;
        //println("TOP");
      } else {
        normalX = 0;
        normalY = -1;
        //println("BOTTOM");
      }
    }
  }

  //println("xInvEntry: " + xInvEntry);
  //println("yInvEntry: " + yInvEntry);
  //println("xInvExit: " + xInvExit);
  //println("yInvExit: " + yInvExit);
  
  //println("entryTime: " + entryTime);
  //println("exitTime: " + exitTime);

  return entryTime;
}

Rectangle GetSweptBoadphaseBox(Rectangle b) {
  Rectangle broadphasebox;
  broadphasebox = new Rectangle(b.getVelX() > 0 ? b.getX() : b.getX() + b.getVelX(),
                                b.getVelY() > 0 ? b.getY() : b.getY() + b.getVelY(),
                                b.getVelX() > 0 ? b.getVelX() + b.getWidth() : b.getWidth() - b.getVelX(),
                                b.getVelY() > 0 ? b.getVelY() + b.getHeight() : b.getHeight() - b.getVelY());
  return broadphasebox;
}

boolean AABBCheck(Rectangle b1, Rectangle b2) {
  return !(b1.getX() + b1.getWidth() < b2.getX()  ||
           b1.getX() > b2.getX() + b2.getWidth()  ||
           b1.getY() + b1.getHeight() < b2.getY() ||
           b1.getY() > b2.getY() + b2.getHeight());
}
