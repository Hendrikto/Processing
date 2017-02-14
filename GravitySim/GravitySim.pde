/**
 * @author: Hendrik Werner
 */

ArrayList<Particle> particles = new ArrayList<Particle>();
final int nrParticles = 5;

void connect(int i) {
  Particle p = particles.get(i);
  for (int j = 0; j < particles.size(); j++) {
    if (i != j) {
      p.addAttractor(particles.get(j));
    }
  }
}


void setup() {
  size(800, 800);
  background(0);
  particles.add(new Particle(width / 2, height / 2, 10)); // Sun
  for (int i = 1; i < nrParticles; i++) {
    particles.add(new Particle(1 + (int) random(5)));
  }
  for (int i = 1; i < particles.size(); i++) {
    connect(i);
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