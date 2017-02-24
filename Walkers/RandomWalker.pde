class RandomWalker extends Walker {

  RandomWalker(color c, int x, int y) {
    super(c);
    position.x = x;
    position.y = y;
  }

  RandomWalker(color c) {
    this(c, width / 2, height / 2);
  }

  void update() {
    position.add(PVector.random2D());
    position.x = (position.x + width) % width;
    position.y = (position.y + height) % height;
  }
}