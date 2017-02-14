/**
 * @author: Hendrik Werner
 */

ArrayList<Particle> particles = new ArrayList<Particle>();
int nrParticles = 1;

void connect(int i) {
  Particle p = particles.get(i);
  for (int j = 0; j < particles.size(); j++) {
    if (i != j) {
      p.addAttractor(particles.get(j));
    }
  }
}

void mouseClicked() {
  Particle p = new Particle(mouseX, mouseY, 1 + (int) random(5));
  particles.add(p);
  for (int i = 1; i < nrParticles; i++) {
    particles.get(i).addAttractor(p);
  }
  connect(nrParticles++);
}

void setup() {
  size(800, 800);
  background(0);
  particles.add(new Particle(width / 2, height / 2, 10)); // Sun
  particles.get(0).col = color(255, 255, 0);
  for (int i = 1; i < nrParticles; i++) {
    particles.add(new Particle(1 + (int) random(5)));
  }
  for (int i = 1; i < particles.size(); i++) {
    connect(i);
  }
}

void draw() {
  background(0);
  for (Particle p : particles) {
    p.update();
    p.show();
  }
}