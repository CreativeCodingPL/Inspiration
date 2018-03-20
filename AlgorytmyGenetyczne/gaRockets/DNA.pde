class DNA {
  PVector[] genes;
  float maxforce = 0.1;
  DNA() {
    genes = new PVector[lifetime];
    for (int i = 0; i < genes.length; i++) {
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxforce));
    }
  }

  DNA(PVector[] newgenes) {
    genes = newgenes;
  }
  DNA crossover(DNA partner) {
    PVector[] child = new PVector[genes.length];
    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover)
        child[i] = genes[i];
      else
        child[i] = partner.genes[i];
    }    
    DNA newgenes = new DNA(child);
    return newgenes;
  }
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        float angle = random(TWO_PI);
        genes[i] = new PVector(cos(angle), sin(angle));
        genes[i].mult(random(0, maxforce));
      }
    }
  }
}