Board board = new Board();
Ball ball = new Ball(100, 200);
PFont f;  

void setup() {
  size(400, 400);
  f = createFont("Arial",16,true); 
  
}

void draw() {
  background(255);
  board.show();
  ball.show();
  
  board.move();
  ball.move(board.ballHitBoard(ball));
  
  textFont(f,16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color 
  text(board.hitCounter(), 20, 20);   // STEP 5 Display Text
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
