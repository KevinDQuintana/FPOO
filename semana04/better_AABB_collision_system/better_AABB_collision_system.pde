interface GameObject {
  float getX();
  float getY();
  float getWidth();
  float getHeight();
}

//class Rectangle implements GameObject {
//  float x;
//  float y;
//  float w;
//  float h;

//  Rectangle(float posX, float posY, float rWidth, float rHeight) {
//    this.x = posX;
//    this.y = posY;
//    this.w = rWidth;
//    this.h = rHeight;
//  }
  
//  public void draw() {rect(x, y, w, h);}
//  public void setX(float newX) {this.x = newX;}
//  public void setY(float newY) {this.y = newY;}
//  public void setWidth(float newW) {this.w = newW;}
//  public void setHeight(float newH) {this.w = newH;}
  
//  float getX() {return x;}
//  float getY() {return y;}
//  float getWidth() {return w;}
//  float getHeight() {return h;}
//}

class Rectangle {
  float x;
  float y;
  float w;
  float h;

  Rectangle(float posX, float posY, float rWidth, float rHeight) {
    this.x = posX;
    this.y = posY;
    this.w = rWidth;
    this.h = rHeight;
  }
  
  public void draw() {rect(x, y, w, h);}
  public void setX(float newX) {this.x = newX;}
  public void setY(float newY) {this.y = newY;}
  public void setWidth(float newW) {this.w = newW;}
  public void setHeight(float newH) {this.w = newH;}
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getWidth() {return w;}
  public float getHeight() {return h;}
}

PVector[] compass;

Rectangle rectOne;
Rectangle rectTwo;

void setup() {
  size(800, 600);
  frameRate(60);
  
  rectOne = new Rectangle(width / 2 - 25, height / 2 - 25, 50, 50);
  rectTwo = new Rectangle(0, 0, 25, 25);
  
  compass = new PVector[4];
  compass[0] = new PVector(0, -1);  //TOP
  compass[1] = new PVector(0, 1); //BOTTOM
  compass[2] = new PVector(-1, 0); //LEFT
  compass[3] = new PVector(1, 0);  //RIGHT
}
void draw() {
  rectTwo.setX(mouseX - rectTwo.getWidth() / 2);
  rectTwo.setY(mouseY - rectTwo.getHeight() / 2);
  
  //if (checkCollision(rectOne, rectTwo)) {
  //  fill(255, 0, 0);
  //} else {
  //  fill(255, 255, 255);
  //}
  
  //if (checkCollision(rectOne, rectTwo)) {
  //  resolveCollision(rectOne, rectTwo);
  //}
  
  if (checkCollision(rectOne, rectTwo)) {
    whichSide();
  }
  
  background(50);
  rectOne.draw();
  rectTwo.draw();
  line(rectOne.getX() + rectOne.getWidth() / 2,
       rectOne.getY() + rectOne.getHeight() / 2,
       rectTwo.getX() + rectTwo.getWidth() / 2,
       rectTwo.getY() + rectTwo.getHeight() / 2);
       
  line(rectOne.getX(),
       rectOne.getY(),
       rectOne.getX() + rectOne.getWidth(),
       rectOne.getY() + rectOne.getHeight());
       
  line(rectOne.getX() + rectOne.getWidth(),
       rectOne.getY(),
       rectOne.getX(),
       rectOne.getY() + rectOne.getHeight());
       
  line(rectTwo.getX(),
       rectTwo.getY(),
       rectTwo.getX() + rectTwo.getWidth(),
       rectTwo.getY() + rectTwo.getHeight());
       
  line(rectTwo.getX() + rectTwo.getWidth(),
       rectTwo.getY(),
       rectTwo.getX(),
       rectTwo.getY() + rectTwo.getHeight());
}

boolean checkCollision(Rectangle objOne, Rectangle objTwo) {
  return objOne.getX() + objOne.getWidth() >= objTwo.getX() &&
         objOne.getX() <= objTwo.getX() + objTwo.getWidth() &&
         objOne.getY() + objOne.getHeight() >= objTwo.getY() &&
         objOne.getY() <= objTwo.getY() + objTwo.getHeight();
}

void resolveCollision(Rectangle objOne, Rectangle objTwo) {}

void whichSide() {
  PVector objOneCenter = new PVector(rectOne.getX() + rectOne.getWidth() / 2,
                                     rectOne.getY() + rectOne.getHeight() / 2);
  
  PVector objTwoCenter = new PVector(rectTwo.getX() + rectTwo.getWidth() / 2,
                                     rectTwo.getY() + rectTwo.getHeight() / 2);
                                     
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
  if (bestMatch == 0) {
    rectTwo.setY(rectOne.getY() - rectTwo.getHeight());
  } else if (bestMatch == 1) {
    rectTwo.setY(rectOne.getY() + rectOne.getHeight());
  } else if (bestMatch == 2) {
    rectTwo.setX(rectOne.getX() - rectTwo.getWidth());
  } else if (bestMatch == 3) {
    rectTwo.setX(rectOne.getX() + rectOne.getWidth());
  }
}
