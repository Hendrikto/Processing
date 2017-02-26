final ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup() {
  size(800, 800, P2D);
  //fullScreen(P2D);
  background(0);
}

void draw() {
  for (Walker w : walkers) {
    for (int i = 0; i < 100; i++) {
      w.update();
      w.draw();
    }
  }
}

void mouseClicked() {
  color c = color(random(255), random(255), random(255));
  if (mouseButton == RIGHT) {
    walkers.add(new RandomWalker(c, mouseX, mouseY));
  } else {
    walkers.add(new VelocityWalker(c, mouseX, mouseY));
  }
}

void keyPressed() {
  switch (key) {
    case 'c':
      background(0);
      break;
    case 'e':
      walkers.clear();
      break;
  }
}

abstract class Walker {
  final color col;
  final PVector position = new PVector();

  protected Walker(color c) {
    col = c;
  }

  abstract void update();

  void draw() {
    stroke(col);
    point(position.x, position.y);
  }

  protected void constrainPosition() {
    position.x = ((position.x % width) + width) % width;
    position.y = ((position.y % height) + height) % height;
  }
}