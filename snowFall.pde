Snow[] snow = new Snow[100];


void setup() {
  size(640, 360);
  for (int i=0; i<snow.length; i++) {
    snow[i] = new Snow();
  }
}

void draw() {
 background(0, 0, 0);
 for (int i=0; i<snow.length; i++) {
    snow[i].fall();
    snow[i].show();
  }
  
 
}