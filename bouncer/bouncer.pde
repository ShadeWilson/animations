Board board = new Board();
Ball ball = new Ball(100, 200);

void setup() {
  size(400, 400);
  
  
}

void draw() {
  background(255);
  board.show();
  ball.show();
  
  board.move();
  ball.move();
}



public void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      board.setDirection(-1);
    } else if (keyCode == RIGHT) {
      board.setDirection(1);
    }
  }
}

void keyReleased() {
  board.setDirection(0);
}
