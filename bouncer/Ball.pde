public class Ball {
  private final float RADIUS = 5;
  private final float SPEED = 10;
  
  private float x, y;
  private float dx, dy;
  private float direction;
  
  public Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.direction = random(0, 2 * PI);
    changeDirection(direction);
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
  
  public void move() {
    reflect();
    this.x += dx;
    this.y += dy;
  }
  
  private void reflect() {
    if (x <= 0 || x >= width) {
      this.dx = this.dx * -1;
    }
    
    if (y <= 0 || y >= height) {
      this.dy = this.dy * -1;
    }
  }
  
  
}
