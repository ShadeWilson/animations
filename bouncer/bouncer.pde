Board player1 = new Board(width * 2, height * 3.5); 
Board player2 = new Board(width * 2, height * 0.5); 
Ball ball;
PFont f;  

void setup() {
  size(400, 400);
  ball = new Ball(100, 200);
  f = createFont("Arial",16,true); 
  
}

void draw() {
  background(255);
  player1.show();
  player2.show();
  ball.show();
  
  player1.move();
  player2.move();
  ball.move(player1.ballHitBoard(ball) || player2.ballHitBoard(ball));
  
  textFont(f,16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color 
  text(player1.hitCounter(), 20, 20);   // STEP 5 Display Text
}



public void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player1.setDirection(-1);
    } else if (keyCode == RIGHT) {
      player1.setDirection(1);
    }
  }
  
  if (key == 'a') {
    player2.setDirection(-1);
  } else if (key == 'd') {
    player2.setDirection(1);
  }
}

public void keyReleased() {
  player1.setDirection(0);
  player2.setDirection(0);
}
