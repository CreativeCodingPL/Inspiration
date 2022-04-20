int NN = 55000; //ile komorek
Komorka[] k = new Komorka[NN];

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(3.0);
  for (int i=0; i<NN; i++) {
    k[i] = new Komorka(random(width), random(height));
  }
}

void rysujKomorki() {
  stroke(#FFF700, 155);
  for (int i=0; i<NN; i++) {
    point(k[i].pozycja.x, k[i].pozycja.y);
  }
}

void draw() {
  noStroke();
  fill(0, 23);
  rect(0,0,width, height);
  for (int i=0; i<NN; i++) {
    k[i].aktualizuj();
  }
  rysujKomorki();
}
