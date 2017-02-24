class RandomWalker implements Walker {
  final color col;
  final PVector position = new PVector();

  RandomWalker(color c, int x, int y) {
    col = c;
    position.x = x;
    position.y = y;
  }

  RandomWalker(color c) {
    this(c, width / 2, height / 2);
  }

  void update() {
    position.add(PVector.random2D());
  }

  void draw() {
    stroke(col);
    point(position.x, position.y);
  }
}