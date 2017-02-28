final ArrayList<Walker> walkers = new ArrayList<Walker>();

float rotX = 0;
float rotY = 0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2, -100);
  rotateX((mouseX / 100.0) + rotX);
  rotateY((mouseY / 100.0) + rotY);
  rotX += .01;
  rotY += .01;
  for (Walker w : walkers) {
    w.update();
    w.draw();
  }
}

void mouseClicked() {
  color c = color(random(255), random(255), random(255));
  walkers.add(new RandomWalker(c));
}

abstract class Walker {
  final color col;
  final ArrayList<PVector> positions = new ArrayList<PVector>();
  final PVector position = new PVector();

  protected Walker(color c) {
    col = c;
  }

  abstract void update();

  void draw() {
    stroke(col);
    noFill();
    beginShape();
    vertex(0, 0, 0);
    for (PVector p : positions) {
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
}