int NN = 55000; //ile komorek
Komorka[] k = new Komorka[NN];

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(3.0);
  textSize(500);
  textAlign(CENTER, CENTER);
  background(0);

  for (int i=0; i<NN; i++) {
    float x = random(width);
    float y = random(height);
    k[i] = new Komorka(x, y);
  }
}

void rysujKomorki() {
  stroke(#FFF700, 155);
  for (int i=0; i<NN; i++) {
    point(k[i].pozycja.x, k[i].pozycja.y);
  }
}

boolean jestLitera = true;

void draw() {
  noStroke();
  fill(0, 33);
  rect(0, 0, width, height);
  if (jestLitera) {
    fill(#BBB700);
    text("Ola", width/2, height/2);
  }
  for (int i=0; i<NN; i++) {
    k[i].aktualizuj();
  }
  rysujKomorki();
}

void keyPressed() {
  jestLitera = !jestLitera;
}
