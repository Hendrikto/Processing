abstract class Walker {
  final color col;
  final ArrayList<float[]> positions = new ArrayList<float[]>();
  final PVector position = new PVector();

  protected Walker(color c) {
    col = c;
  }

  abstract void update();

  void draw() {
    stroke(col);
    noFill();
    beginShape();
    for (float[] p : positions) {
      vertex(p[0], p[1], p[2]);
    }
    endShape();
  }

  void clearPath() {
    positions.clear();
  }
}