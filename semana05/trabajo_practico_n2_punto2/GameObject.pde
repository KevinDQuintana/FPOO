abstract class GameObject {
  private float posX;
  private float posY;
  private color defaultColor;
  
  GameObject() {}
  GameObject(float x, float y) {
    this.setPosX(x);
    this.setPosY(y);
    this.setColor(color(255, 0, 0));
  }
  
  public float getPosX() {
    return this.posX;
  }
  
  public float getPosY() {
    return this.posY;
  }
  
  public color getColor() {
    return defaultColor;
  }
  
  public void setPosX(float x) {
    this.posX = x;
  }
  
  public void setPosY(float y) {
    this.posY = y;
  }
  
  public void setColor(color c) {
    this.defaultColor = c;
  }
  
  abstract void display();
}
