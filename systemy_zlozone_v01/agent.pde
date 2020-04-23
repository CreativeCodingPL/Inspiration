class agent {
  int x;
  int y;
  int wiek;
  boolean zadowolony;
  String imie;

  agent(int _x, int _y, boolean _z, String _i) {
    x = _x;
    y = _y;
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
    point(x, y);
    fill(0);
    text(imie, x, y);
  }

  void aktualizujWiek() {
    if (zadowolony) 
      wiek++;
    else
      wiek += 3;
  }
}
