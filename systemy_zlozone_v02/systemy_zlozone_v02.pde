system swiat;

void setup() {
  size(500, 500);
  swiat = new system(20);
}

void draw() {
  background(255);
  swiat.rysuj();
  swiat.aktualizuj();
}
