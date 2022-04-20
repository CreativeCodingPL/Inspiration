class Komorka {

  PVector pozycja;
  PVector kierunek;
  float katSkretu = PI / 16;
  float katWachania = PI / 10;
  float zasieg = 19;

  Komorka(float x, float y) {
    pozycja = new PVector(x, y);
    kierunek = PVector.random2D();
  }

  void aktualizuj() {
    wachaj();
    ruszSie();
  }

  void ruszSie() {
    PVector nPoz = PVector.add(pozycja, kierunek);
    if(get(int(nPoz.x), int(nPoz.y)) != color(#FF0000))
      pozycja.add(kierunek);
    else
      pozycja.add(PVector.random2D());
  }

  void wachaj() {
    PVector Fpoz = pozycja.copy().add(PVector.mult(kierunek, zasieg));
    PVector FLpoz = pozycja.copy().add(PVector.mult(kierunek, zasieg).rotate(-katWachania));
    PVector FRpoz = pozycja.copy().add(PVector.mult(kierunek, zasieg).rotate(katWachania));

    color F = get(int(Fpoz.x), int(Fpoz.y));
    color FL = get(int(FLpoz.x), int(FLpoz.y));
    color FR = get(int(FRpoz.x), int(FRpoz.y));

    if (F>FL && F>FR) {
      //nie zmieniam kierunku
    } else if (F<FL && F<FR) {
      if (random(1.0) < 0.5)
        kierunek.rotate(-katSkretu);
      else
        kierunek.rotate(katSkretu);
    } else if (FL < FR) {
      kierunek.rotate(katSkretu);
    } else if (FR < FL) {
      kierunek.rotate(-katSkretu);
    }
  }
}
