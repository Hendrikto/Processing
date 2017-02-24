final int nrWalkers = 1;
final ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup() {
  size(800, 800);
  background(255);
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
}