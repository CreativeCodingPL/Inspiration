class Rocket {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float fitness;
  DNA dna;
  int geneCounter = 0;

  boolean hitTarget = false;

  //constructor
  Rocket(PVector l, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    location = l.get();
    r = 4;
    dna = dna_;
  }
  void fitness() {
    float d = dist(location.x, location.y, target.x, target.y);
    fitness = pow(1/d, 2);
  }
  void run() {
    checkTarget();
    if (!hitTarget) {
      applyForce(dna.genes[geneCounter]);
      geneCounter = (geneCounter + 1) % dna.genes.length;
      update();
    }
    display();
  }

  void checkTarget() {
    float d = dist(location.x, location.y, target.x, target.y);
    if (d < 12) {
      hitTarget = true;
    }
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }
}