class Perceptron {
  float[] weights;  // Tablica wag
  float c;          // stala uczenia

  // n wag i stala uczeania
  Perceptron(int n, float c_) {
    weights = new float[n];
    // Na poczatek losowe wagi
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1,1); 
    }
    c = c_;
  }

  // Uczenie
  void train(float[] inputs, int desired) {
    // Zgadnij odpowiedz
    int guess = feedforward(inputs);
    // Jak zmienic wagi na podstawie bledu
    // Blad = porzadany outpu - uzyskany output
    // Wartosci:  0, -2, or 2
    // Pomnoz przez stala uczenia
    float error = desired - guess;
    // Dopasuj wagi
    for (int i = 0; i < weights.length; i++) {
      weights[i] += c * error * inputs[i];         
    }
  }

  // Podejmowanie decyzji
  int feedforward(float[] inputs) {
    // Sumowanie wartosci
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i]*weights[i];
    }
    // Zwracamy znak sumy (-1 lub 1)
    return activate(sum);
  }
  
  int activate(float sum) {
    if (sum > 0) return 1;
    else return -1; 
  }
  
  float[] getWeights() {
    return weights; 
  }
}