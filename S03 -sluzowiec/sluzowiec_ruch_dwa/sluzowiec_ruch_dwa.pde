int NN = 1500; //ile komorek
Komorka[] k1 = new Komorka[NN];
Komorka[] k2 = new Komorka[NN];

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(1.0);
  for (int i=0; i<NN; i++) {
    k1[i] = new Komorka(random(width), random(height), color(#FF0000));
    k2[i] = new Komorka(random(width), random(height), color(#00FFAA));
  }
}

void rysujKomorki() {
  stroke(k1[0].kolor, 55);
  for (int i=0; i<NN; i++) {
    point(k1[i].pozycja.x, k1[i].pozycja.y);
  }
  stroke(k2[0].kolor, 55);
  for (int i=0; i<NN; i++) {
    point(k2[i].pozycja.x, k2[i].pozycja.y);
  }
}

void draw() {
  noStroke();
//  fill(0, 33);
//  rect(0,0,width, height);
  for (int i=0; i<NN; i++) {
    k1[i].aktualizuj();
    k2[i].aktualizuj();
  }
  rysujKomorki();
}
