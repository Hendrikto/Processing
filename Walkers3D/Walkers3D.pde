final ArrayList<Walker> walkers = new ArrayList<Walker>();

float rotX = 0;
float rotY = 0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2, -100);
  rotateX((mouseY / 100.0) + rotX);
  rotateY((mouseX / 100.0) + rotY);
  rotX = (rotX + .01) % TWO_PI;
  rotY = (rotY + .01) % TWO_PI;
  for (Walker w : walkers) {
    w.update();
    w.draw();
  }
}

void mouseClicked() {
  color c = color(random(255), random(255), random(255));
  walkers.add(new RandomWalker(c));
}

void keyPressed() {
  switch (key) {
    case 'e':
      walkers.clear();
      break;
    case 'c':
      clearPaths();
      break;
  }
}

void clearPaths() {
  for (Walker w : walkers) {
    w.clearPath();
  }
}