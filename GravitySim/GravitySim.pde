/**
 * @author: Hendrik Werner
 */

ArrayList<Particle> particles = new ArrayList<Particle>();
final int nrParticles = 5;

void setup() {
  size(800, 800);
  background(0);
  particles.add(new Particle(width / 2, height / 2, 10)); // Sun
  for (int i = 1; i < nrParticles; i++) {
    particles.add(new Particle(1 + (int) random(5)));
  }
  for (int i = 1; i < nrParticles; i++) {
    for (int j = 0; j < nrParticles; j++) {
      if (i != j) {
        particles.get(i).addAttractor(particles.get(j));
      }
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  for (Particle p : particles) {
    p.update();
    p.show();
  }
}