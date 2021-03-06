class RandomWalker extends Walker {

  RandomWalker(color c, int x, int y, int z) {
    super(c);
    position.set(x, y, z);
    positions.add(position.array().clone());
  }

  RandomWalker(color c) {
    this(c, 0, 0, 0);
  }

  void update() {
    position.add(PVector.random3D());
    positions.add(position.array().clone());
  }
}