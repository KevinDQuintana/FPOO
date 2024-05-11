abstract class GameObject {
  private float posX;
  private float posY;
  
  GameObject() {}
  GameObject(float x, float y) {
    this.posX = x;
    this.posY = y;
  }
  
  public float getPosX() {
    return this.posX;
  }
  
  public float getPosY() {
    return this.posY;
  }
  
  public void setPosX(float x) {
    this.posX = x;
  }
  
  public void setPosY(float y) {
    this.posY = y;
  }
  
  abstract void display();
}
