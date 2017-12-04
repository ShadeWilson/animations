class Me {
  float x = random(0, width);
  float y = random(0, height);
  float xspeed = 0;
  float yspeed = 0;
  float thick = 20;
  
  void move() {
    float xdist = x - mouseX;
    float ydist = y - mouseY;
    float dist = sqrt(sq((xdist)) + sq(ydist));
    float xdir = xdist / abs(xdist);
    float ydir = ydist / abs(ydist);
    
    print(xdist, "\n");
    
    xspeed = map(xdist, 0, width, 10, 0);
    yspeed = map(ydist, 0, height, 10, 0);
    x = x + xspeed * xdir;
    y = y + yspeed * ydir;
    
    stop();
  }
  
  void stop() {
    if (x > width) {
      x = width;
    } else if (x < 0) {
      x = 0;
    }
    
    if (y > height) {
      y = height;
    } else if (y < 0) {
      y = 0; 
    }
    
  }
  
  void show() {
    fill(255, 0, 255);
    noStroke();
    ellipse(x, y, thick, thick);
  }
  
}