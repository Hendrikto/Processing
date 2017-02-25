final ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  for (Walker w : walkers) {
    w.update();
    w.draw();
  }
}

void mouseClicked() {
  walkers.add(new RandomWalker(
    color(random(255), random(255), random(255))
    , mouseX
    , mouseY
  ));
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