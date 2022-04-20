int NN = 5000; //ile komorek
Komorka[] k = new Komorka[NN];

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(0.5);
  for (int i=0; i<NN; i++) {
    k[i] = new Komorka(random(width), random(height));
  }
}

void rysujKomorki() {
  stroke(#FFF700, 50);
  for (int i=0; i<NN; i++) {
    point(k[i].pozycja.x, k[i].pozycja.y);
  }
}

void draw() {
  for (int i=0; i<NN; i++) {
    k[i].aktualizuj();
  }
  rysujKomorki();
}
