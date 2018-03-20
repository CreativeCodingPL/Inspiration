int lifetime;
Population population;
int lifeCounter;
PVector target;

void setup() {
  size(640, 360);
  lifetime = height;
  lifeCounter = 0;
  target = new PVector(width/2, 24);
  float mutationRate = 0.01;
  population = new Population(mutationRate, 100);
}
void draw() {
  background(255);
  noStroke();
  fill(0);
  ellipse(target.x,target.y,24,24);

  if (lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
  } 
  else {
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }
  fill(0);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifeCounter), 10, 36);
}
void mousePressed() {
  target.x = mouseX;
  target.y = mouseY;
}