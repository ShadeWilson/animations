public class Board {
  private final int HEIGHT = 5;
  private final int WIDTH = 70;
  private final int SPEED = 10;
  
  
  private float x, y;
  private float dx;
  private int hitCounter;
  
  public Board() {
    this.x = width * 2;
    this.y = height * 3.5;
    this.dx = 0;
    this.hitCounter = 0;
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  
  public void show() {
    stroke(0);
    fill(0);
    rect(x, y, WIDTH, HEIGHT);
  }
  
  
  
  public void move() {
    if (x > 0 && x < width - WIDTH || x <= 0 && dx > 0 || x >= width - WIDTH && dx < 0) { 
      this.x += this.dx;
    } 
  }
  
  public void setDirection(int d) {
    this.dx = d * SPEED;
  }
  
  public boolean ballHitBoard(Ball b) {
    float ballX = b.getX();
    float ballY = b.getY();
    
    boolean isHit = ballY >= getY() && ballY <= getY() + HEIGHT && 
           ballX >= getX() && ballX <= getX() + WIDTH; 
           
    if (isHit) {
        hitCounter++;
    }
    
    return isHit;
  }
  
  public String hitCounter() {
    return this.hitCounter + "";
  }
  
  
  
}
