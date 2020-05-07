class agent {
  PVector pozycja;
  PVector predkosc;
  PVector przyspieszenie;
  int wiek;
  boolean zadowolony;
  String imie;

  agent(int _x, int _y, boolean _z, String _i) {
    pozycja = new PVector(_x, _y);
    predkosc = new PVector(0, 0);
    przyspieszenie = new PVector(random(-0.15, 0.15), random(-0.15, 0.15));
    wiek = 1;
    zadowolony = _z;
    imie = _i;
  }

  void rysuj() {
    strokeWeight(5+sqrt(wiek));
    if (zadowolony) 
      stroke(0, 255, 0); 
    else
      stroke(255, 0, 0);
    point(pozycja.x, pozycja.y);
    fill(0);
    text(imie, pozycja.x, pozycja.y);
  }

  void aktualizujWiek() {
    if (zadowolony) 
      wiek++;
    else
      wiek += 3;
  }
  void aktualizuPozycje() {
    if(random(100) < 30) przyspieszenie.rotate(random(-PI, PI));
    if(pozycja.x < 10 || pozycja.x > width-10) predkosc.x = -predkosc.x;
    if(pozycja.y < 10 || pozycja.y > height-10) predkosc.y = -predkosc.y;
    predkosc.add(przyspieszenie);
    pozycja.add(predkosc);
    predkosc.limit(5);
  }
}
