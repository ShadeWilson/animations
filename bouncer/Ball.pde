public class Ball {
  private final float RADIUS = 5;
  private final float SPEED = 1;
  
  private float x, y;
  private float dx, dy;
  private float direction;
  
  public Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.direction = random(0, 2 * PI);
    changeDirection(direction);
    println(direction);
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
    this.x += dx;
    this.y += dy;
  }
  
  
}
