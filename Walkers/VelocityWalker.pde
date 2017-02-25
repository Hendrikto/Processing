class VelocityWalker extends Walker {
  final PVector velocity = new PVector();

  VelocityWalker(color c, int x, int y) {
    super(c);
    position.set(x, y);
  }

  void update() {
    velocity.add(PVector.random2D()).normalize();
    position.add(velocity);
    constrainPosition();
  }
}