class VelocityWalker extends Walker {
  final PVector velocity = new PVector();

  VelocityWalker(color c) {
    super(c);
  }

  void update() {
    velocity.add(PVector.random3D()).normalize();
    position.add(velocity);
    positions.add(position.array().clone());
  }
}