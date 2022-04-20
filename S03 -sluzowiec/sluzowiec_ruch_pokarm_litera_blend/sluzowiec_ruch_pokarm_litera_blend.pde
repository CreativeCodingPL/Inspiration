int NN = 15000; //ile komorek
Komorka[] k = new Komorka[NN];

PGraphics g;

void setup() {
  size(800, 500);
  background(0);
  strokeWeight(1.0);
  g = createGraphics(800, 800);
  g.beginDraw(); 
  g.textSize(500);
  g.textAlign(CENTER, BASELINE);
  g.background(0);
  g.fill(#FFF700);
  g.text("Ola", width/2, height/2+200);
  g.endDraw();

  for (int i=0; i<NN; i++) {
    float x = random(width);
    float y = random(height);
    //color c = g.get(int(x),int(y)); //<>//
    //while(c==color(0)) {
    //  x = random(width); 
    //  y = random(height);
    //  c = g.get(int(x),int(y));
    //}
    k[i] = new Komorka(x,y);
  }
}

void rysujKomorki() {
  stroke(#FF4400, 155);
  for (int i=0; i<NN; i++) {
    point(k[i].pozycja.x, k[i].pozycja.y);
  }
}

boolean jestLitera = true;

void draw() {
  noStroke();
  fill(0, 15);
  rect(0,0,width, height);

  blendMode(MULTIPLY);
  image(g,0,0);
  blendMode(BLEND);
  
  for (int i=0; i<NN; i++) {
    k[i].aktualizuj();
  }
  rysujKomorki();
}

void keyPressed() {
  jestLitera = !jestLitera;
}
