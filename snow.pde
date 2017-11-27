class Snow {
  float x = random(width);
  float y = random(-500, -50);
  float z = random(0, 20);
  float yspeed = map(z, 0, 20, 0.3, .7);
  float xspeed = random(-0.05, 0.05);
  float xaccel = random(-0.01, 0.01);
  
  // TODO: define limits above, speeds upon refresh are off
  
  void fall() {
    
    
    xspeed = xspeed + xaccel;
    x = x + xspeed;
    y = y + yspeed;
    
    if (y >= height) {
      //FallenSnow fallenSnow = new FallenSnow(x, y, z);
      //fallenSnow.cover();
      
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 0.2, 2);
      //yspeed = 0;
      //xspeed = 0;
    }
    
    if (x > width || x < 0) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 0.2, 2);
      x = random(width);
      xspeed = random(-1);
    }
    
    if (xspeed > 0.5 || xspeed < -0.5) {
      if (xaccel > 0) {
        xaccel = random(-0.01);
      } else {
        xaccel = random(0.01);
      }
    }
  }
  
  void show() {
    float thick = map(z, 0, 20, 0.5, 4);
    noStroke();
    fill(255, 255, 255);
    ellipse(x, y, thick, thick);
  }

  
  
}