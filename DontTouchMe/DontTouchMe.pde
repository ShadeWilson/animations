Me me = new Me();

void setup() {
  size(800, 600);
}

void draw() {
  //speed = map(mouseX, 0, width, 0, 50);
  background(255);
  me.move();
  me.show();
}