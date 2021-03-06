/**
 * @author: Hendrik Werner
 */

final float G = .01;

class Particle {
  final int mass;

  final PVector position;
  final PVector velocity;
  final PVector acceleration;

  color col = color(255);

  final ArrayList<Particle> attractors = new ArrayList<Particle>();

  Particle(int x, int y, int mass) {
    this.mass = mass;
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }

  Particle(int mass) {
    this(
      (int) random(width / 2) + width / 4
      , (int) random(height / 2) + height / 4
      , mass
      );
  }

  void addAttractor(Particle p) {
    attractors.add(p);
  }

  void updateVelocity() {
    acceleration.set(0, 0);
    for (Particle attractor : attractors) {
      PVector path = attractor.position.copy().sub(position);
      acceleration.add(path.normalize().mult(G * mass * attractor.mass / path.magSq()));
    }
    velocity.add(acceleration.div(mass));
  }

  void updatePosition() {
    position.add(velocity);
  }

  void show() {
    stroke(col);
    strokeWeight(mass);
    point(position.x, position.y);
  }
}