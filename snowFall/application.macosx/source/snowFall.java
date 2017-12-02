import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class snowFall extends PApplet {

Snow[] snow = new Snow[400];

int fallCount = 0;
float maxHeight = 4;

public void setup() {
  
  for (int i=0; i<snow.length; i++) {
    snow[i] = new Snow();
  }
}

public void draw() {
 background(0, 0, 0);
 for (int i=0; i<snow.length; i++) {
    snow[i].fall();
    snow[i].show();
 }
}
class Snow {
  float x = random(width);
  float y = random(-500, -50);
  float z = random(0, 1);
  float thick = map(z, 0, 1, 0.5f, 4);
  boolean hasFallen = false;
  
  float yspeedMax = 1;
  float yspeedMin = 0.3f;
  
  float xspeedMax = 0.05f * z;
  float xspeedLimit = 0.15f * z;
  float xaccelMax = 0.01f * z;
  
  float yspeed = map(z, 0, 1, yspeedMin, yspeedMax);
  float xspeed = random(-xspeedMax, xspeedMax);
  float xaccel = random(-xaccelMax, xaccelMax);
  
  public void fall() {
    
    xspeed = xspeed + xaccel;
    x = x + xspeed;
    y = y + yspeed;
    
    
    // if snowflakes reach the bottom of the screen, or
    // if snowflakes go off the screen left or right, or
    // if the snowflake has contacted a fallen snowflake
    // they're reset at the top
    if (y >= height + 1 || x > width || x < 0 || hasFallen == true) {
      reset();
    }
    
    // if the speed in the x direction is greater than the limit
    // the acceleration is switched to the other direction
    // with a random scalar from 0 - xaccelMax
    if (xspeed > xspeedLimit || xspeed < -xspeedLimit) {
      if (xaccel > 0) {
        xaccel = random(-xaccelMax);
      } else {
        xaccel = random(xaccelMax);
      }
    }
  }
  
  public void reset() {
    y = random(-200, -100);
      yspeed = map(z, 0, 1, yspeedMin, yspeedMax);
      x = random(width);
      xspeed = random(-xspeedMax, xspeedMax);
      hasFallen = false;
  }
  
  
  public void show() {
    noStroke();
    fill(255, 255, 255);
    ellipse(x, y, thick, thick);
  }

  
  
}
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "snowFall" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
