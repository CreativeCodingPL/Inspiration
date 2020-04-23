class system {
  agent[] agenci;
  int N;
  
  String[] imiona = {"Hilad", "Olek", "Jula", "Andrzej", "Janek", "Katarzya", "Zosia", "Tamara", "Nikola"};
  
  system(int _n) {
    N = _n;
    agenci = new agent[N];
    for(int i =0; i<N; i++) {
      agenci[i] = new agent(int(random(50, width-50)), int(random(50, height-50)), 
                            random(100)<50, imiona[int(random(imiona.length))]);
    }
  }
  
  void rysuj() {
    for(int i =0; i<N; i++) agenci[i].rysuj();
  }
  
  void aktualizuj() {
    for(int i =0; i<N; i++) agenci[i].aktualizujWiek();
  }
  
}
