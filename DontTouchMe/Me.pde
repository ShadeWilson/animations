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
    
    float xaccel = map(xdist, 0, width, 1, -5);
    float yaccel = map(ydist, 0, height, 1, -5);
    xspeed = map(xdist, 0, width, 1, -5) + xaccel;
    yspeed = map(ydist, 0, height, 1, -5) + yaccel;
    x = x + xspeed * xdir;
    y = y + yspeed * ydir;
    
    reappear();
  }
  
  void reappear() {
    if (x > width) {
      x = 0;
      y = random(0, height);
    } else if (x < 0) {
      x = width;
      y = random(0, height);
    }
    
    if (y > height) {
      x = random(0, width);
      y = 0;
    } else if (y < 0) {
      x = random(0, width);
      y = height; 
    }
    
  }
  
  void show() {
    fill(255, 0, 255);
    noStroke();
    ellipse(x, y, thick, thick);
  }
  
}