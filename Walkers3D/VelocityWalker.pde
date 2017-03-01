class VelocityWalker extends Walker {
  final PVector velocity = new PVector();
  float scale = .8;

  VelocityWalker(color c) {
    super(c);
    positions.add(position.array().clone());
  }

  void update() {
    velocity.add(PVector.random3D().mult(scale)).normalize();
    position.add(velocity);
    positions.add(position.array().clone());
  }
}