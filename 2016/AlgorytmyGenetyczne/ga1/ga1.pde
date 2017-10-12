float mutationRate;
int totalPopulation = 1000;
DNA[] population;
ArrayList<DNA> matingPool;
String target;
PFont mono;

void setup() {
  size(640, 360);
  target = "Twoja stara pierze w rzece";
  mutationRate = 0.001;
  population = new DNA[totalPopulation];
  for (int i =0; i < population.length; i++) {
    population[i] = new DNA();
  }
  mono = createFont("Share Tech Mono", 32);
  textAlign(CENTER, CENTER);
  textFont(mono);
  background(255);
}

void draw() {
  

  float bestFitness = 0;
  String bestGenes = "";
  PImage scr = get(0,0,width,height);
  background(255);
  image(scr, 0, -30);
  fill(255, 127);
  rect(-1,-1,width+1,height+1);
  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
    if(population[i].fitness > bestFitness){
      bestFitness = population[i].fitness;
      bestGenes = population[i].getPhrase();
    }
    if(population[i].fitness == 1){
      println("Generations: " + frameCount);
      noLoop();
    }
  }
  fill(0);
  noStroke();
  text(bestGenes, 320, 160); 
  
  matingPool = new ArrayList<DNA>();
  for (int i = 0; i < population.length; i++) {
    int n = int(population[i].fitness * 100);
    for (int j = 0; j < n; j++) {
      matingPool.add(population[i]);
    }
  }
  for (int i = 0; i < population.length; i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA parentA = matingPool.get(a);
    DNA parentB = matingPool.get(b);
    DNA child = parentA.crossover(parentB);
    child.mutate();
    population[i] = child;
  }
}