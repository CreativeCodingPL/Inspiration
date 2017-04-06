// oparte na: http://natureofcode.com

// Lista punktów treningowych
Trainer[] training = new Trainer[2000];

// Perceptron
Perceptron ptron;
int count = 0;

// Przestrzen punktow
float xmin = -400;
float ymin = -100;
float xmax =  400;
float ymax =  100;

// Funkcja prostej
float f(float x) {
  return 0.4*x-0.5;
}

void setup() {
  size(640, 360);
  // Perceptron z trzema wejsciami i stala uczenia
  ptron = new Perceptron(3, 0.0001);

  // Losowy zestaw punktow ze znana decyzja do uczenia
  for (int i = 0; i < training.length; i++) {
    float x = random(xmin, xmax);
    float y = random(ymin, ymax);
    int answer = 1;
    if (y < f(x)) answer = -1;
    training[i] = new Trainer(x, y, answer);
  }
  smooth();
}


void draw() {
  background(255);
  translate(width/2,height/2);

  // Prosta docelowa
  strokeWeight(4);
  stroke(127);
  float x1 = xmin;
  float y1 = f(x1);
  float x2 = xmax;
  float y2 = f(x2);
  line(x1,y1,x2,y2);

  // Linia na podstawie wartosci wag
  // Wzor: weights[0]*x + weights[1]*y + weights[2] = 0
  stroke(127,0,0);
  strokeWeight(1);
  float[] weights = ptron.getWeights();
  x1 = xmin;
  y1 = (-weights[2] - weights[0]*x1)/weights[1];
  x2 = xmax;
  y2 = (-weights[2] - weights[0]*x2)/weights[1];
  line(x1,y1,x2,y2);

  // Uczymy perceptron za pomoca zestawu punktow
  ptron.train(training[count].inputs, training[count].answer);
  count = (count + 1) % training.length;

  // Rysowanie punktow na podstawie decyzji Perceptronu
  for (int i = 0; i < count; i++) {
    stroke(0);
    strokeWeight(1);
    fill(0);
    int guess = ptron.feedforward(training[i].inputs);
    if (guess > 0) noFill();

    ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
  }
}