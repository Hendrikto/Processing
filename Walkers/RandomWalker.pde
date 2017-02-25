class RandomWalker extends Walker {

  RandomWalker(color c, int x, int y) {
    super(c);
    position.set(x, y);
  }

  RandomWalker(color c) {
    this(c, width / 2, height / 2);
  }

  void update() {
    position.add(PVector.random2D());
    constrainPosition();
  }
}