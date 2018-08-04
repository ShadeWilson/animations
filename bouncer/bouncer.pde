import java.util.Map;
Board player1 = new Board(width * 2, height * 3.5); 
Board player2 = new Board(width * 2, height * 0.5); 
Ball ball;

Keyboard p1Keys = new Keyboard(LEFT, RIGHT);
Keyboard p2Keys = new Keyboard('a', 'd');
  
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
  
  setDirections(p1Keys, player1);
  setDirections(p2Keys, player2);
  
  player1.move();
  player2.move();
  ball.move(player1.ballHitBoard(ball) || player2.ballHitBoard(ball));
  
  textFont(f,16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color 
  text(player1.hitCounter(), 20, 20);   // STEP 5 Display Text
}



public void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT || keyCode == RIGHT) {
      p1Keys.pressKey(keyCode);
    }
  }
  
  if (key == 'a' || key == 'd') {
    p2Keys.pressKey(key);
  }
}

public void keyReleased() {
  if (key == CODED && keyCode == LEFT || keyCode == RIGHT) {
    p1Keys.releaseKey(keyCode);
  } else if (key == 'a' || key == 'd') {
    p2Keys.releaseKey(key);
  }
}


public void setDirections(Keyboard k, Board player) {
  // player 1 first
  if (k.currentKey() == k.left()) {
      player.setDirection(-1);
  } else if (k.currentKey() == k.right()) {
    player.setDirection(1);
  } else {
     player.setDirection(0);
  }
}
