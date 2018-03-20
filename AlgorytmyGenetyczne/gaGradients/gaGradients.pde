float mutationRate;
Gradient[] population;
int totalPopulation = 64;
ArrayList<Gradient> matingPool;
int generation;

void setup() {
  size(850, 850, P3D);
  mutationRate = 0.01;
  generation = 0;
  matingPool = new ArrayList<Gradient>();
  population = new Gradient[totalPopulation];
  for (int i=0; i<totalPopulation; i++) {
    population[i] = new Gradient(new DNA(), 75+(i%8)*100, 75+(i/8)*100);
  }
}
void draw() {
  background(240);
  for (int i=0; i<totalPopulation; i++) {
    population[i].draw();
  }
}
void selection() {
  matingPool.clear();
  float maxFitness = getMaxFitness();
  for (int i = 0; i < population.length; i++) {
    float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
    int n = (int) (fitnessNormal * 100);
    for (int j = 0; j < n; j++) {
      matingPool.add(population[i]);
    }
  }
}
void reproduction() {
  for (int i = 0; i < population.length; i++) {
    int m = int(random(matingPool.size()));
    int d = int(random(matingPool.size()));
    Gradient mom = matingPool.get(m);
    Gradient dad = matingPool.get(d);
    DNA momgenes = mom.getDNA();
    DNA dadgenes = dad.getDNA();
    DNA child = momgenes.crossover(dadgenes);
    child.mutate(mutationRate);
    population[i] = new Gradient(child, 75+(i%8)*100, 75+(i/8)*100f);
  }
}
float getMaxFitness() {
  float record = 0;
  for (int i = 0; i < totalPopulation; i++) {
    if (population[i].getFitness() > record) {
      record = population[i].getFitness();
    }
  }
  return record;
}
void keyPressed() {
  if (key==' ') {
    selection();
    reproduction();
    generation++;
    println("Generation: " + generation);
  }
  if (key=='f') {
    String fitness  = "| ";
    for (int i=0; i<totalPopulation; i++) {
      fitness+=round(population[i].fitness) +" | ";
    }
    println(fitness);
  }
}
void mousePressed() {
  for (int i=0; i<totalPopulation; i++) {
    if (dist(population[i].x, population[i].y, mouseX, mouseY)<50) {
      population[i].fitness++;
    }
  }
}