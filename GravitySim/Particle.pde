/**
 * @author: Hendrik Werner
 */

final float G = .01;

class Particle {
  final int mass;

  final PVector position;
  final PVector velocity;
  final PVector acceleration;

  final ArrayList<Particle> attractors = new ArrayList<Particle>();

  Particle(int x, int y, int mass) {
    this.mass = mass;
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }

  Particle(int mass) {
    this((int) random(width), (int) random(height), mass);
  }

  void addAttractor(Particle p) {
    attractors.add(p);
  }

  void update() {
    acceleration.set(0, 0);
    for (Particle attractor : attractors) {
      PVector path = attractor.position.copy().sub(position);
      acceleration.add(path.normalize().mult(G * mass * attractor.mass / path.magSq()));
    }
    velocity.add(acceleration.div(mass));
    position.add(velocity);
  }

  void show() {
    strokeWeight(mass);
    point(position.x, position.y);
  }
}