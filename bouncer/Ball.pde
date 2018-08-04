public class Ball {
  private final float RADIUS = 5;
  private final float SPEED = 5;
  
  private float x, y;
  private float dx, dy;
  private float direction;
  
  public Ball() {
    restart();
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  
  
  public void show() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(x, y, RADIUS, RADIUS);
  }
  
 
  public void changeDirection(float theta) {
    this.dx = cos(theta) * SPEED;
    this.dy = sin(theta) * SPEED;
  }
  
  public void move(boolean hitBoard) {
    reflect(hitBoard);
    this.x += dx;
    this.y += dy;
  }
  
  private void reflect(boolean hitBoard) {
    if (x <= 0 || x >= width) {
      this.dx = this.dx * -1;
    }
    
    if (hitBoard) {
      this.dy = this.dy * -1;
    }
    
    if (y <= 0 || y >= height) {
      print("Game over!");
      restart();
    }
  }
  
  private void restart() {
    this.x = width / 2;
    this.y = height / 2;
    if (random(-1, 1) > 0 ) {
      this.direction = random(PI / 4, 3 * PI / 4);
    } else {
      this.direction = random(- PI / 4, - 3 * PI / 4);
    }
    
    changeDirection(direction);
  }
  
  
}
